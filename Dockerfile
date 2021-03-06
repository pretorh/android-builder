FROM openjdk:8-jdk-stretch

WORKDIR /src/
CMD gradle assembleRelease bundleRelease
ENV ANDROID_HOME=/opt/android \
    PATH=$PATH:/opt/android/:/opt/gradle/bin/:/opt/android/scripts/
COPY scripts/ $ANDROID_HOME/scripts/

# install sdk tools and gradle
# get versions from https://developer.android.com/studio/#downloads and https://gradle.org/releases/
RUN install-base.sh 6200805 6.2.1
