FROM openjdk:8-jdk-stretch

ENV ANDROID_HOME=/opt/android \
    PATH=$PATH:/opt/android/:/opt/gradle/bin/:/opt/android/scripts/
COPY scripts/ $ANDROID_HOME/scripts/

# setup building from source
WORKDIR /src/
CMD gradle assembleRelease

# install sdk tools and gradle
RUN install-base.sh 3859397 4.6
