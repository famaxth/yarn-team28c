#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/scripts"

case "${1:-all}" in
  all)
    ./00_preflight.sh
    ./01_install.sh
    ./02_configure.sh
    ./03_format.sh
    ./04_start.sh
    ./05_verify.sh
    ./07_yarn_configure.sh
    ./08_yarn_start.sh
    ./09_web_publish.sh
    ./10_yarn_verify.sh ;;
  hdfs)
    ./00_preflight.sh
    ./01_install.sh
    ./02_configure.sh
    ./03_format.sh
    ./04_start.sh
    ./05_verify.sh ;;
  yarn)
    ./02_configure.sh
    ./07_yarn_configure.sh
    ./08_yarn_start.sh
    ./09_web_publish.sh
    ./10_yarn_verify.sh ;;
  preflight)    ./00_preflight.sh ;;
  install)      ./01_install.sh ;;
  configure)    ./02_configure.sh; ./07_yarn_configure.sh ;;
  format)       ./03_format.sh ;;
  start)        ./04_start.sh; ./08_yarn_start.sh; ./09_web_publish.sh ;;
  web)          ./09_web_publish.sh ;;
  verify)       ./05_verify.sh; ./10_yarn_verify.sh ;;
  verify-yarn)  ./10_yarn_verify.sh ;;
  stop-yarn)    ./11_yarn_stop.sh ;;
  stop)         ./11_yarn_stop.sh; ./06_stop.sh ;;
  *) echo "usage: $0 [all|hdfs|yarn|preflight|install|configure|format|start|web|verify|verify-yarn|stop-yarn|stop]"; exit 2 ;;
esac
