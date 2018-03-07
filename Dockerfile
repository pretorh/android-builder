FROM openjdk:8-jdk-stretch

ENV ANDROID_HOME=/opt/android/
WORKDIR $ANDROID_HOME
COPY sdk-tools-linux-*.zip ./
RUN unzip sdk-tools-linux-*.zip
RUN yes | ./tools/bin/sdkmanager --install "platforms;android-27" "build-tools;27.0.3" "platform-tools"

WORKDIR /opt/gradle
COPY gradle-*-bin.zip ./
RUN unzip gradle-*-bin.zip

ENV PATH $PATH:$ANDROID_HOME:/opt/gradle/gradle-4.1/bin/

WORKDIR /src/
CMD gradle assemble
