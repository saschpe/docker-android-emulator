#
# Android SDK container image with build-tools.
#
# Contains JDK, Android SDK and Android Build Tools. Each version is
# configurable. Build and publish with default arguments:
#
#   $ ./scripts/build --push
#
# Build with custom arguments:
#
#   $ ./scripts/build --android 33 --jdk 17.0.6_10
#

ARG android=33
ARG jdk=17.0.6_10

FROM --platform=linux/amd64 saschpe/android-sdk:${android}-jdk${jdk}

LABEL maintainer="Sascha Peilicke <sascha@peilicke.de"
LABEL description="Android SDK ${android} using JDK ${jdk} with Emulator"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ubuntu-desktop-minimal
RUN yes | sdkmanager --licenses && \
    sdkmanager --update && \
    sdkmanager --install \
        emulator