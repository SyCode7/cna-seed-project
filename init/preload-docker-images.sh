#!/bin/bash

# This script just downloads docker images from docker hub
# Define the environment variable DOCKER_PRELOAD_IMAGES to tell which images (seperated with colon) should be downloaded
# Example DOCKER_PRELOAD_IMAGES="apache:haproxy" will download icclabcna/zurmo_apache and icclabcna/zurmo_haproxy
# If you like to change the username and prefix of the images, define the environment variables IMAGE_USERNAME, IMAGE_PREFIX

IMAGE_USERNAME=${DOCKER_PRELOAD_IMAGE_USERNAME:-"icclabcna"}
IMAGE_PREFIX=${DOCKER_PRELOAD_IMAGE_PREFIX:-"zurmo_"}
IMAGES_NAMES=${DOCKER_PRELOAD_IMAGES:-"apache:haproxy:memcache:mysql:config:application"}

IFS=":"
set ${IMAGES_NAMES}
for item
do
	IMAGE_NAME=${IMAGE_USERNAME}/${IMAGE_PREFIX}${item}
	echo "Pulling ${IMAGE_NAME}"
	docker pull -a ${IMAGE_NAME} &
done
wait