#!/usr/bin/env bash
USER=localhost:5555
NAME=calibre
VERSION=latest
CONTENT_SERVER_PORT=32780
PORT=32781

docker run                                                                 \
    -d                                                                     \
    --name ${NAME}                                                         \
    -e AUTH=${AUTH:-false}                                                 \
    -v "/volume1/books/calibre-library/calibre-library:/calibre-library"   \
    -v "/volume1/books/calibre-library/calibre-autoscan:/calibre-autoscan" \
    -v "/volume1/books/calibre-library/calibre-inbox:/nobody/inbox"        \
    -p ${CONTENT_SERVER_PORT}:7777                                         \
    -p ${PORT}:32000                                                       \
    ${USER}/${NAME}:${VERSION}
