#!/usr/bin/env bash
set -e

SDK_VERSION=${1?"sdk version missing"}
GRADLE_VERSION=${2?"gradle version missing"}
shift; shift

echo "installing sdk tools $SDK_VERSION"
wget --continue "https://dl.google.com/android/repository/sdk-tools-linux-$SDK_VERSION.zip"
unzip -q sdk-tools-linux-*.zip
rm sdk-tools-linux-*.zip

echo "installing gradle $GRADLE_VERSION"
wget --continue "https://downloads.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
unzip -q gradle-*-bin.zip
rm gradle-*-bin.zip
mv -v gradle-* /opt/gradle
