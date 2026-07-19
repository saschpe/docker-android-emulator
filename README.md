# Android SDK with Emulator OCI / Docker image

[![License](https://img.shields.io/github/license/saschpe/docker-android-emulator)](https://opensource.org/licenses/Apache-2.0)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/saschpe/docker-android-emulator/main.yml?branch=main)](https://github.com/saschpe/docker-android-emulator/actions?query=branch%3Amain++)
[![Docker Pulls](https://img.shields.io/docker/pulls/saschpe/android-emulator)](https://hub.docker.com/r/saschpe/android-emulator)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/saschpe/android-emulator)](https://hub.docker.com/r/saschpe/android-emulator)

Android SDK OCI image based on Docker image [saschpe/android-sdk](https://hub.docker.com/r/saschpe/android-sdk) with pre-installed build-tools, latest command-line
tools and JDK 17 (or later) as well as the Android Emulator.

## Android SDK and JDK support

The following JDK (horizontal axis) and Android SDK API level combinations are currently available:

|    | 11 | 17 | 21 | 22 | 23 |
|----|----|----|----|----|----|
| 31 | ✅ | ✅ |    |    |    |
| 32 | ✅ | ✅ | ✅ | ✅ |    |
| 33 | ✅ | ✅ | ✅ | ✅ |    | 
| 34 | ✅ | ✅ | ✅ | ✅ | ✅ | 
| 35 |    | ✅ | ✅ | ✅ | ✅ |

## Usage

### Pulling

```shell
docker pull saschpe/android-emulator:35-jdk23.0.2_7
```

### Running

The emulator requires KVM acceleration for reasonable performance. Ensure the host supports KVM
and pass the device to the container:

```shell
docker run -it --rm --device /dev/kvm saschpe/android-emulator:35-jdk23.0.2_7
```

For CI environments or other headless use-cases, you can start the emulator with `-no-window`:

```shell
docker run -it --rm --device /dev/kvm saschpe/android-emulator:35-jdk23.0.2_7 \
    emulator -avd pixel -no-window -no-audio
```

### Base Image

```Dockerfile
FROM saschpe/android-emulator:35-jdk23.0.2_7
RUN sdkmanager --install "cmake;3.31.5"
```

## Building

These scripts simplify various tasks related to container building and publishing:

```shell
./scripts/build --help
```

## License

    Copyright 2023-2026 Sascha Peilicke

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
