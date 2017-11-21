#!/bin/bash
echo "******************************"
echo "*** START REDIS !!!     ***"
echo "******************************"
if [ "$ROLE" = "SLAVE" ]; then
	if [ -z "$MASTER_HOST" ]; then
		echo "empty MASTER_HOST env param!!!, exit..."
		exit 0
	fi
	if [ -z "$MASTER_PORT" ]; then
		echo "empty MASTER_PORT env param!!!, exit..."
		exit 0
	fi
	redis-server --slaveof "$MASTER_HOST" "$MASTER_PORT"
elif [ "$ROLE" = "MASTER" ]; then 
	redis-server
fi
