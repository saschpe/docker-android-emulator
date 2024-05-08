#
# Android SDK with Emulator OCI / Docker image.
#
# Build and publish with default arguments:
#
#   $ ./scripts/build --push
#
# Build with custom arguments:
#
#   $ ./scripts/build --android 34 --jdk 22.0.1_8
#

ARG android=34
ARG jdk=22.0.1_8

FROM --platform=linux/amd64 saschpe/android-sdk:${android}-jdk${jdk}

LABEL maintainer="Sascha Peilicke <sascha@peilicke.de"
LABEL description="Android SDK ${android} using JDK ${jdk} with Android Emulator"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ubuntu-desktop-minimal
RUN sdkmanager --install \
    emulator
