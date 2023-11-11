FROM amazoncorretto:17-al2023-jdk
RUN yum install unzip --assumeyes

WORKDIR /src/
CMD gradle assembleRelease bundleRelease
ENV ANDROID_HOME=/opt/android \
    PATH=$PATH:/opt/android/:/opt/gradle/bin/:/opt/android/scripts/
COPY scripts/ $ANDROID_HOME/scripts/

# install sdk tools and gradle
# get versions from https://developer.android.com/studio/#downloads and https://gradle.org/releases/
RUN install-base.sh 8092744 7.4
