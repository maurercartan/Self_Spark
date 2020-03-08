if [ -z "${SPARK_HOME}" ]; then
  export SPARK_HOME="$(cd "`dirname "$0"`"/..; pwd)"
fi

. "${SPARK_HOME}/sbin/spark-config.sh"
. "${SPARK_HOME}/bin/load-spark-env.sh"

exec "${SPARK_HOME}/sbin"/spark-daemon.sh start org.apache.spark.deploy.history.HistoryServer 1 "$@"
