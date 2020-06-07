#!/bin/bash

SCRIPT_DIR=`pwd`
source "${SCRIPT_DIR}/pathUtil.sh" || exit 1

# GZoltar Version
GZoltarVersion=1.7.3-SNAPSHOT

# Absolute path of junit.jar
JUNIT_JAR=/home/mrdrivingduck/Desktop/gzoltar/lib/junit-4.12.jar
# Absolute path of hmacrest-core.jar
HAMCREST_JAR=/home/mrdrivingduck/Desktop/gzoltar/lib/hamcrest-core-1.3.jar
# Absolute path of com.gzoltar.cli-${GZoltarVersion}-jar-with-dependencies.jar
GZOLTAR_CLI_JAR=/home/mrdrivingduck/Desktop/gzoltar/lib/gzoltarcli.jar
# Absolute path of com.gzoltar.agent.rt-${GZoltarVersion}-all.jar
GZOLTAR_AGENT_JAR=/home/mrdrivingduck/Desktop/gzoltar/lib/gzoltaragent.jar



pid="$1"       # Project name
bid="$2"       # bug id



# Output path of fault localization results.
output_dir="/home/mrdrivingduck/Desktop/FL-VS-APR/gzoltar_results/${pid}_${bid}"

bug_dir="/home/mrdrivingduck/Desktop/d4jData/${pid}_${bid}" # bug directory

mkdir -p ${output_dir}
test_classpath="$bug_dir$(_get_test_classpath $pid $bid)"
src_classes_dir="$bug_dir$(_get_src_classpath $pid $bid)"

tool="developer"                      # <developer|evosuite|randoop>
unit_tests_file="${output_dir}/tests.txt" # all test methods.
ser_file="${output_dir}/gzoltar.ser"


java -cp $src_classes_dir:$test_classpath:$JUNIT_JAR:$HAMCREST_JAR:$GZOLTAR_CLI_JAR \
  com.gzoltar.cli.Main listTestMethods $test_classpath \
    --outputFile "$unit_tests_file"
    
echo "[INFO] Start: $(date)" >&2
    (cd "$tmp_dir" > /dev/null 2>&1 && \
      java -javaagent:$GZOLTAR_AGENT_JAR=destfile=$ser_file,buildlocation=$src_classes_dir,inclnolocationclasses=false,output="FILE" \
        -cp $src_classes_dir:$JUNIT_JAR:$test_classpath:$GZOLTAR_CLI_JAR \
        com.gzoltar.cli.Main runTestMethods \
          --testMethods "$unit_tests_file" \
          --collectCoverage)
if [ $? -ne 0 ]; then
  echo "[ERROR] GZoltar runTestMethods command has failed for ${pid}_${bid}b version!" >&2
  # rm -rf "$tmp_dir"
fi
[ -s "$ser_file" ] || die "[ERROR] $ser_file does not exist or it is empty!"

spectra_file="$output_dir/sfl/txt/spectra.csv"
matrix_file="$output_dir/sfl/txt/matrix.txt"
tests_file="$output_dir/sfl/txt/tests.csv"

java -cp $src_classes_dir:$JUNIT_JAR:$test_classpath:$GZOLTAR_CLI_JAR \
      com.gzoltar.cli.Main faultLocalizationReport \
        --buildLocation "$src_classes_dir" \
        --granularity "line" \
        --inclPublicMethods \
        --inclStaticConstructors \
        --inclDeprecatedMethods \
        --dataFile "$ser_file" \
        --outputDirectory "$output_dir" \
        --family "sfl" \
        --formula "ochiai" \
        --metric "entropy" \
        --formatter "txt"
if [ $? -ne 0 ]; then
  echo "[ERROR] GZoltar faultLocalizationReport command has failed for ${pid}_${bid}b version!" >&2
  # rm -rf "$tmp_dir"
fi
echo "[INFO] End: $(date)" >&2
rm -rf $ser_file

if [ -s "$matrix_file" ]; then
  mv $spectra_file "$output_dir/sfl_spectra.csv"
  mv $matrix_file "$output_dir/sfl_matrix.txt"
  mv $tests_file "$output_dir/sfl_tests.csv"
  mv $output_dir/sfl/txt/ochiai.ranking.csv $output_dir/sfl_ochiai_ranking.csv
  mv $output_dir/sfl/txt/statistics.csv $output_dir/sfl_statistics.csv
fi

rm -rf $output_dir/sfl/

echo "DONE!"

