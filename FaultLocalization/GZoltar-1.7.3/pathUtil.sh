#!/usr/bin/env bash

#
# Returns the test classpath of a previously checkout D4J's project-bug.
#
_get_test_classpath() {
  local USAGE="Usage: ${FUNCNAME[0]} <project_name> <bug_id>"
  if [ "$#" != 2 ]; then
    echo "$USAGE" >&2
    return 1
  fi

  local projectName="$1"
  local bugId="$2"

  cp=""

  if [ "$projectName" == "Chart" ]; then
    cp="/build-tests"
  elif [ "$projectName" == "Cli" ]; then
    cp="/target/test-classes"
  elif [ "$projectName" == "Closure" ]; then
    cp="/build/test"
  elif [ "$projectName" == "Codec" ]; then
    if [ $bugId <= 16 ]; then
      cp="/target/tests"
    else
      cp="/target/test-classes"
    fi
  elif [ "$projectName" == "Collections" ]; then
    cp="/target/tests"
  elif [ "$projectName" == "Compress" ]; then
    cp="/target/test-classes"
  elif [ "$projectName" == "Csv" ]; then
    cp="/target/test-classes"
  elif [ "$projectName" == "Gson" ]; then
    cp="/target/test-classes"
  elif [ "$projectName" == "JacksonCore" ]; then
    cp="/target/test-classes"
  elif [ "$projectName" == "JacksonDatabind" ]; then
    cp="/target/test-classes"
  elif [ "$projectName" == "JacksonXml" ]; then
    cp="/target/test-classes"
  elif [ "$projectName" == "Jsoup" ]; then
    cp="/target/test-classes"
  elif [ "$projectName" == "JxPath" ]; then
    cp="/target/test-classes"
  elif [ "$projectName" == "Lang" ]; then
    if [ $bugId <= 20 ]; then
      cp="/target/tests"
    elif [ $bugId <= 41 ]; then
      cp="/target/test-classes"
    else
      cp="/target/tests"
    fi
  elif [ "$projectName" == "Math" ]; then
    cp="/target/test-classes"
  elif [ "$projectName" == "Mockito" ]; then
    if [ $bugId <= 11 ]; then
      cp="/build/classes/test"
    elif [ $bugId <= 17 ]; then
      cp="/target/test-classes"
    elif [ $bugId <= 21 ]; then
      cp="/build/classes/test"
    else
      cp="/target/test-classes"
    fi
  elif [ "$projectName" == "Time" ]; then
    if [ $bugId <= 11 ]; then
      cp="/target/test-classes"
    else
      cp="/build/tests"
    fi
  fi

  echo "$cp"
  return 0
}

#
# Return full path of the target directory of source classes.
#
_get_src_classpath() {
  local USAGE="Usage: ${FUNCNAME[0]} <project_name> <bug_id>"
  if [ "$#" != 2 ]; then
    echo "$USAGE" >&2
    return 1
  fi

  local projectName="$1"
  local bugId="$2"

  cp=""

  if [ "$projectName" == "Chart" ]; then
    cp="/build"
  elif [ "$projectName" == "Cli" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "Closure" ]; then
    cp="/build/classes"
  elif [ "$projectName" == "Codec" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "Collections" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "Compress" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "Csv" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "Gson" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "JacksonCore" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "JacksonDatabind" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "JacksonXml" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "Jsoup" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "JxPath" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "Lang" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "Math" ]; then
    cp="/target/classes"
  elif [ "$projectName" == "Mockito" ]; then
    if [ $bugId <= 11 ]; then
      cp="/build/classes/main"
    elif [ $bugId <= 17 ]; then
      cp="/target/classes"
    elif [ $bugId <= 21 ]; then
      cp="/build/classes/main"
    else
      cp="/target/classes"
    fi
  elif [ "$projectName" == "Time" ]; then
    if [ $bugId <= 11 ]; then
      cp="/target/classes"
    else
      cp="/build/classes"
    fi
  fi
  
  echo "$cp"
  return 0
}
