#!/usr/bin/env bash

######## Use these to clean up conflicts with Boost Library versions ######
# cd MP-SPDZ
# make clean
# find . -name "CMakeCache.txt" -delete

# set -e

# IMAGE_NAME="mpc-frameworks"
# DOCKERFILE="Dockerfile"
# MP_SPDZ="$(pwd)/MP-SPDZ"
# MOTION="$(pwd)/MOTION"

# # Check if image exists

# echo "[INFO] Building Docker Image '$IMAGE_NAME'..."
# docker build \
#     --build-arg HOST_UID=$(id -u) \
#     --build-arg HOST_GID=$(id -g) \
#     -t "$IMAGE_NAME" \
#     -f "$DOCKERFILE" .

# # Run the container
# docker run -it --rm \
#     -v "$MP_SPDZ":/workspace/MP-SPDZ \
#     -v "$MOTION":/workspace/MOTION \
#     "$IMAGE_NAME" /bin/bash

set -e

IMAGE_NAME="mpc-frameworks"
DOCKERFILE="Dockerfile"
PARENT_DIR="$(pwd)"

docker build \
    --build-arg HOST_UID=$(id -u) \
    --build-arg HOST_GID=$(id -g) \
    -t "$IMAGE_NAME" \
    -f "$DOCKERFILE" .

docker run -it --rm \
    -v "$PARENT_DIR":/workspace \
    "$IMAGE_NAME" /bin/bash