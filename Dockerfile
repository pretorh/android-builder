FROM openjdk:8-jdk-stretch

ENV ANDROID_HOME=/opt/android \
    PATH=$PATH:/opt/android/:/opt/gradle/bin/:/opt/android/scripts/
COPY scripts/ $ANDROID_HOME/scripts/

# setup building from source
WORKDIR /src/
CMD gradle assembleRelease

# install sdk tools and gradle
# get versions from https://developer.android.com/studio/#downloads and https://gradle.org/releases/
RUN install-base.sh 4333796 5.3
