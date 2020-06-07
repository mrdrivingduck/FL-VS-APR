#!/bin/bash

proj=Chart
for bug in $(seq 1 26)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Cli
for bug in $(seq 1 5; seq 7 40)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Closure
for bug in $(seq 1 62; seq 64 92; seq 94 176)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Codec
for bug in $(seq 1 18)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Collections
for bug in $(seq 25 28)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Compress
for bug in $(seq 1 47)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Csv
for bug in $(seq 1 16)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Gson
for bug in $(seq 1 18)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=JacksonCore
for bug in $(seq 1 26)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=JacksonDatabind
for bug in $(seq 1 112)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=JacksonXml
for bug in $(seq 1 6)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Jsoup
for bug in $(seq 1 93)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=JxPath
for bug in $(seq 1 22)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Lang
for bug in $(seq 1 1; seq 3 65)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Math
for bug in $(seq 1 106)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Mockito
for bug in $(seq 1 38)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done

proj=Time
for bug in $(seq 1 20; seq 22 27)
do
	echo ${proj}_${bug}
	./runGZoltar.sh ${proj} ${bug}
done
