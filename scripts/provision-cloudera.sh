#!/usr/bin/env bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && dirname `pwd` )"

hadoop dfs -copyFromLocal "$ROOT_DIR/cloudera/examples" hdfs://quickstart.cloudera:8020/user/cloudera