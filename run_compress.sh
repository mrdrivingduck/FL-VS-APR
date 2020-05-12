dir=/home/mrdrivingduck/Desktop/d4jData/ # Store the buggy projects.

# proj=Chart
# for bug in $(seq 1 26)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=Cli
# for bug in $(seq 1 5; seq 7 40)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=Closure
# for bug in $(seq 1 62; seq 64 92; seq 94 176)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=Codec
# for bug in $(seq 1 18)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=Collections
# for bug in $(seq 25 28)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

proj=Compress
for bug in $(seq 1 47)
do
	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
done

# proj=Csv
# for bug in $(seq 1 16)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=Gson
# for bug in $(seq 1 18)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=JacksonCore
# for bug in $(seq 1 26)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=JacksonDatabind
# for bug in $(seq 1 112)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=JacksonXml
# for bug in $(seq 1 6)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=Jsoup
# for bug in $(seq 1 93)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=JxPath
# for bug in $(seq 1 22)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=Lang
# for bug in $(seq 1 1; seq 3 65)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=Math
# for bug in $(seq 1 106)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=Mockito
# for bug in $(seq 1 38)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done

# proj=Time
# for bug in $(seq 1 20; seq 22 27)
# do
# 	/home/mrdrivingduck/jdk1.8.0_251/bin/java -Dfile.encoding=UTF-8 -cp /tmp/cp_89f8xlpdukmhsl6zdknebkeyq.jar edu.lu.uni.serval.main.Main ${proj}_${bug}
# done