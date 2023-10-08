#!/usr/bin/env sh
set -e

suffix=$(date +%Y-%m-%d)

docker pull pretorh/android-builder:base
docker build \
    -t "pretorh/android-builder:base-$suffix" \
    -t "pretorh/android-builder:base" \
    .

for file in Dockerfile.* ; do
    number=$(echo "$file" | sed -e 's#Dockerfile.##')
    docker pull pretorh/android-builder:"$number"
    docker build \
        -t "pretorh/android-builder:${number}-${suffix}" \
        -t "pretorh/android-builder:${number}" \
        -f "$file" \
        .
done
