FROM openjdk:8-jdk-stretch

ENV ANDROID_HOME=/opt/android/
ENV PATH $PATH:$ANDROID_HOME:/opt/gradle/bin/:$ANDROID_HOME/setup/

WORKDIR $ANDROID_HOME/
COPY setup/ setup/
RUN sh setup/install.sh 4333796 4.1
RUN yes | ./tools/bin/sdkmanager --install "platforms;android-27" "build-tools;27.0.3" "platform-tools"

WORKDIR /src/
CMD gradle assemble
