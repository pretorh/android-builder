FROM openjdk:8-jdk-stretch

ENV ANDROID_HOME=/opt/android/
ENV PATH $PATH:$ANDROID_HOME:/opt/gradle/bin/:$ANDROID_HOME/setup/

# install sdk tools and gradle
WORKDIR $ANDROID_HOME/
COPY setup/install-base.sh setup/
RUN install-base.sh 4333796 4.1

# copy the other util scripts
COPY setup/ setup/

# setup building from source
WORKDIR /src/
CMD gradle assemble
