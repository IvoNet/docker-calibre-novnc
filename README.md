# calibre ebook reader

Web desktop docker image for: Calibre

# Usage

See `run.sh` and `calibre.sh` for examples on how to run the application.

# Volumes

| Volume path          | Description                                             |
| :--------------------| :-------------------------------------------------------|
| `/calibre-library`   | the calibre-library where calibre will store its e-books|
| `/calibre-autoscan`  | folder that will be auto scanned by calibre. Files in this folder will also be auto deleted after the auto import. |
| `/nobody/inbox`      | shared folder where you can place e-books you can import at your leisure |

# Exposed Ports

| Port number          | Description                                             |
| :--------------------| :-------------------------------------------------------|
| `32000`              | the application runs here                               |
| `7777`               | the web interface of of calibre runs here               |


# Base image configurable settings

Lots of things can be configured through the base image.

See repo [docker-x11webui](https://github.com/IvoNet/docker-x11webui/blob/master/README.md)
for documentation on the base image.

# For developers

## Build 

```shell
make x86-callibre
```

or on an amd64/x86 machine

```shell
make release-intellij
```

---
# License

    Copyright 2019 (c) Ivo Woltring

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

NOTE that:
- The usage of IntelliJ itself falls under their license of course.