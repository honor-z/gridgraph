#!/bin/bash

SOURCE="$0"
while [[ -h "$SOURCE" ]]; do
  cd -P "$( dirname "$SOURCE" )" || exit 1
  DIR="$(pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
cd -P "$( dirname "$SOURCE" )" || exit 1
WORKSPACE="$(pwd)"

echo Start gremlin server
$WORKSPACE/gridgraph-server-1.2.0/bin/gremlin-server.sh start

echo Start admin console
$WORKSPACE/admin-console/bin/startup.sh
