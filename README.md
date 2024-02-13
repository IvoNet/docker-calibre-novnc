# calibre ebook reader

Web desktop docker image for: Calibre
This version needs the [ivonet/docker-x11novnc](https://github.com/IvoNet/docker-x11novnc) image to work.

# Usage

example docker-compose.yml

```yaml
version: '3'

services:
    novnc:
        image: ivonet/x11novnc:latest
        environment:
            - DISPLAY_WIDTH=1600
            - DISPLAY_HEIGHT=950
        ports:
            - 10000:8080
        networks:
            - x11
    calibre:
        image: ivonet/calibre-novnc:7.4.0
        volumes:
            - "${HOME}/calibre/calibre-library:/calibre-library"
            - "${HOME}/calibre/calibre-autoscan:/calibre-autoscan"
            - "${HOME}/calibre/calibre-inbox:/root/inbox"
        environment:
            # Very important to set this to the novnc container as that container will be the display server
            - DISPLAY=novnc:0.0
        depends_on:
            - novnc
        networks:
            - x11
networks:
    x11:
    

```

# Volumes

| Volume path         | Description                                             |
|:--------------------| :-------------------------------------------------------|
| `/calibre-library`  | the calibre-library where calibre will store its e-books|
| `/calibre-autoscan` | folder that will be auto scanned by calibre. Files in this folder will also be auto deleted after the auto import. |
| `/root/inbox`       | shared folder where you can place e-books you can import at your leisure |

# Exposed Ports

| Port number          | Description                                             |
| :--------------------| :-------------------------------------------------------|
| `32000`              | the application runs here                               |
| `7777`               | the web interface of of calibre runs here               |



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
