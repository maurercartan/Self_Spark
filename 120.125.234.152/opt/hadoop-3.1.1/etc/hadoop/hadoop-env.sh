export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export HADOOP_HEAPSIZE_MAX=512
export HADOOP_HEAPSIZE_MIN=512
export HADOOP_OS_TYPE=${HADOOP_OS_TYPE:-$(uname -s)}
case ${HADOOP_OS_TYPE} in
  Darwin*)
    export HADOOP_OPTS="${HADOOP_OPTS} -Djava.security.krb5.realm= "
    export HADOOP_OPTS="${HADOOP_OPTS} -Djava.security.krb5.kdc= "
    export HADOOP_OPTS="${HADOOP_OPTS} -Djava.security.krb5.conf= "
  ;;
esac
export HADOOP_LOG_DIR=/tmp