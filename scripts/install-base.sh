#!/usr/bin/env bash
set -e

SDK_VERSION=${1?"sdk version missing"}
GRADLE_VERSION=${2?"gradle version missing"}
shift; shift
cd "$ANDROID_HOME"

echo "installing sdk tools $SDK_VERSION"
wget --continue "https://dl.google.com/android/repository/commandlinetools-linux-${SDK_VERSION}_latest.zip"
unzip -q commandlinetools-linux-*.zip
rm commandlinetools-linux-*.zip

echo "installing gradle $GRADLE_VERSION"
wget --continue "https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip"
unzip -q gradle-*-bin.zip
rm gradle-*-bin.zip
mv -v gradle-* /opt/gradle
