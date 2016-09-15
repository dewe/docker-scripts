#!/bin/sh

echo
echo "Removing all stopped containers, and their associated volumes..."
docker ps -aqf status=exited | xargs docker rm

echo
echo "Removing dangling images..."
docker images -qf dangling=true | xargs docker rmi

echo
echo "Done."
