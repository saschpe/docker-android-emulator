# Android SDK with Emulator OCI / Docker image

[![License](https://img.shields.io/github/license/saschpe/docker-android-emulator)](https://opensource.org/licenses/Apache-2.0)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/saschpe/docker-android-emulator/ci.yml?branch=main)](https://github.com/saschpe/docker-android-emulator/actions?query=branch%3Amain++)
[![Docker Pulls](https://img.shields.io/docker/pulls/saschpe/android-emulator)](https://hub.docker.com/r/saschpe/android-emulator)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/saschpe/android-emulator)](https://hub.docker.com/r/saschpe/android-emulator)

Android SDK OCI image based on Docker image `saschpe/android-sdk` with
pre-installed build-tools, latest command-line tools and JDK 11 (or later) as
well as the Android Emulator.

## Android SDK and JDK support

The following JDK and Android SDK API level combinations are currently
available:

|    | 11 | 17 | 21 | 22 |
|----|----|----|----|----|
| 31 | ✅  | ✅  |    |    |
| 32 | ✅  | ✅  | ✅  | ✅  |
| 33 | ✅  | ✅  | ✅  | ✅  |
| 34 | ✅  | ✅  | ✅  | ✅  |
| 35 |    | ✅  | ✅  | ✅  |

## Usage

```shell
docker pull saschpe/android-emulator:35-jdk21.0.5_11
```

Use as a base image:

```Dockerfile
FROM saschpe/android-emulator:35-jdk21.0.5_11
RUN sdkmanager --install "cmake;3.22.1"
```

## Building

These scripts simplify various tasks related to container building and
publishing:

```shell
./scripts/build --help
```

## License

    Copyright 2023 Sascha Peilicke

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
