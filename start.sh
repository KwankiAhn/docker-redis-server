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
	echo " >>> Run as slave"
	redis-server --slaveof "$MASTER_HOST" "$MASTER_PORT"
	echo " >>> Finished"
elif [ "$ROLE" = "MASTER" ]; then 
	echo " >>> Run as master"
	redis-server
	echo " >>> Finished"
else
	echo " >>> Run as UNKNOWN Role, this is not supposed to triggered as 1st invoking redis"
        redis-server
        echo " >>> Finished"
fi
