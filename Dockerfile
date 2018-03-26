FROM openjdk:8-jdk-stretch

ENV ANDROID_HOME=/opt/android/
ENV PATH $PATH:$ANDROID_HOME:/opt/gradle/bin/:$ANDROID_HOME/scripts/

# install sdk tools and gradle
WORKDIR $ANDROID_HOME/
COPY scripts/install-base.sh scripts/
RUN install-base.sh 3859397 4.6

# copy the other util scripts
COPY scripts/ scripts/

# setup building from source
WORKDIR /src/
CMD gradle assembleRelease
