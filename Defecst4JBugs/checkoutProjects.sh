dir=/home/mrdrivingduck/Desktop/d4jData/ # Store the buggy projects.

proj=Chart
for bug in $(seq 1 26)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Cli
for bug in $(seq 1 5; seq 7 40)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Closure
for bug in $(seq 1 62; seq 64 92; seq 94 176)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Codec
for bug in $(seq 1 18)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Collections
for bug in $(seq 25 28)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Compress
for bug in $(seq 1 47)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Csv
for bug in $(seq 1 16)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Gson
for bug in $(seq 1 18)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=JacksonCore
for bug in $(seq 1 26)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=JacksonDatabind
for bug in $(seq 1 112)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=JacksonXml
for bug in $(seq 1 6)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Jsoup
for bug in $(seq 1 93)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=JxPath
for bug in $(seq 1 22)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Lang
for bug in $(seq 1 1; seq 3 65)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Math
for bug in $(seq 1 106)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Mockito
for bug in $(seq 1 38)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done

proj=Time
for bug in $(seq 1 20; seq 22 27)
do
	defects4j checkout -p $proj -v ${bug}b -w ${dir}${proj}_${bug}
done