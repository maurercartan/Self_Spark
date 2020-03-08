# Figure out where Spark is installed
if [ -z "${SPARK_HOME}" ]; then
  source "$(dirname "$0")"/find-spark-home
fi

if [ -z "$SPARK_ENV_LOADED" ]; then
  export SPARK_ENV_LOADED=1

  export SPARK_CONF_DIR="${SPARK_CONF_DIR:-"${SPARK_HOME}"/conf}"

  if [ -f "${SPARK_CONF_DIR}/spark-env.sh" ]; then
    # Promote all variable declarations to environment (exported) variables
    set -a
    . "${SPARK_CONF_DIR}/spark-env.sh"
    set +a
  fi
fi

# Setting SPARK_SCALA_VERSION if not already set.

if [ -z "$SPARK_SCALA_VERSION" ]; then

  ASSEMBLY_DIR2="${SPARK_HOME}/assembly/target/scala-2.11"
  ASSEMBLY_DIR1="${SPARK_HOME}/assembly/target/scala-2.12"

  if [[ -d "$ASSEMBLY_DIR2" && -d "$ASSEMBLY_DIR1" ]]; then
    echo -e "Presence of build for multiple Scala versions detected." 1>&2
    echo -e 'Either clean one of them or, export SPARK_SCALA_VERSION in spark-env.sh.' 1>&2
    exit 1
  fi

  if [ -d "$ASSEMBLY_DIR2" ]; then
    export SPARK_SCALA_VERSION="2.11"
  else
    export SPARK_SCALA_VERSION="2.12"
  fi
fi
