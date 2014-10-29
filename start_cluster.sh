CLUSTER_NAME=${CLUSTER_NAME:-$1}

# Start Master node
sudo docker run --name es1 -d -P -v /var/elasticsearch/es1/data:/data -v /var/log/elasticsearch/es1:/var/log/supervisor \
	-e NODE_NAME=node.master -e CLUSTER_NAME=${CLUSTER_NAME} -e IS_MASTER=true -e IS_DATA=false nirmata/elasticsearch
# Start data node
sudo docker run --name es2 -d -P -v /var/elasticsearch/es2/data:/data -v /var/log/elasticsearch/es2:/var/log/supervisor \
	-e NODE_NAME=node.data -e CLUSTER_NAME=${CLUSTER_NAME} -e IS_MASTER=false -e IS_DATA=true nirmata/elasticsearch
