dir=/home/mrdrivingduck/Desktop/d4jData/ # Store the buggy projects.

failedTestCases=/home/mrdrivingduck/Desktop/FL-VS-APR/data/FailedTestCases/

proj=Chart
for bug in $(seq 1 26)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Cli
for bug in $(seq 1 5; seq 7 40)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Closure
for bug in $(seq 1 62; seq 64 92; seq 94 176)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Codec
for bug in $(seq 1 18)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Collections
for bug in $(seq 25 28)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Compress
for bug in $(seq 1 47)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Csv
for bug in $(seq 1 16)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Gson
for bug in $(seq 1 18)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=JacksonCore
for bug in $(seq 1 26)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=JacksonDatabind
for bug in $(seq 1 112)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=JacksonXml
for bug in $(seq 1 6)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Jsoup
for bug in $(seq 1 93)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=JxPath
for bug in $(seq 1 22)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Lang
for bug in $(seq 1 1; seq 3 65)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Math
for bug in $(seq 1 106)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Mockito
for bug in $(seq 1 38)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done

proj=Time
for bug in $(seq 1 20; seq 22 27)
do
	cd ${dir}${proj}_${bug}
	defects4j test > ${failedTestCases}${proj}_${bug}.txt
	echo ${proj}_${bug} done.
	cd ..
done
