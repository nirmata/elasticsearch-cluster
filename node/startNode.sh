#!/bin/bash

NODE_NAME=${NODE_NAME:="node"}
CLUSTER_NAME=${CLUSTER_NAME:="elasticsearch"}
IS_MASTER=${IS_MASTER:=false}
IS_DATA=${IS_DATA:=true}

# Replace the names and config before starting elasticsearch
sed -i -e "/cluster.name:*/c\cluster.name: ${CLUSTER_NAME}" -e "/node.name:*/c\node.name: ${NODE_NAME}" -e "/node.data:*/c\node.data: ${IS_DATA}" -e  "/node.master:*/c\node.master: ${IS_MASTER}"  /elasticsearch/config/elasticsearch.yml

# Start the elasticsearch node
/elasticsearch/bin/elasticsearch
