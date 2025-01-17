#
# Android SDK with Emulator OCI / Docker image.
#
# Build and publish with default arguments:
#
#   $ ./scripts/build --push
#
# Build with custom arguments:
#
#   $ ./scripts/build --android 35 --jdk 22.0.2_9
#

ARG android=35
ARG jdk=22.0.2_9

FROM --platform=linux/amd64 saschpe/android-sdk:${android}-jdk${jdk}
ARG android
ARG jdk
LABEL maintainer="Sascha Peilicke <sascha@peilicke.de"
LABEL description="Android SDK ${android} using JDK ${jdk} with Android Emulator"

ENV DEBIAN_FRONTEND=noninteractive
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    ubuntu-desktop-minimal
USER nonroot
RUN sdkmanager --install \
    emulator
