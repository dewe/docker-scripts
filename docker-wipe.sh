#!/bin/sh
echo
echo "This script will kill and forcibly remove all containers, images and volumes."
echo
read -p "Are you sure? (Y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Y]$ ]]
then
    # wipe out every image and container, .

    echo
    echo "Terminating all running containers..."
    docker ps -q | xargs docker kill
    sleep 1s

    echo
    echo "Removing all containers and associated volumes..."
    docker ps -aq | xargs docker rm --force --volumes
    sleep 1s

    echo
    echo "Removing all images..."
    docker images -q | xargs docker rmi --force

    echo
    echo "Removing all remaining volumes..."
    docker volume ls -q | xargs docker volume rm

    echo
    echo "Done."
fi
