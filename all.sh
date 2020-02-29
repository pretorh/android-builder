#!/usr/bin/env sh
suffix=$(date --iso-8601)

docker pull pretorh/android-builder:base
docker build -t pretorh/android-builder:"base_$suffix" .

for file in Dockerfile.* ; do
    number=$(echo "$file" | sed -e 's#Dockerfile.##')
    docker pull pretorh/android-builder:"$number"
    docker build -t pretorh/android-builder:"${number}_${suffix}" -f "$file" .
done
