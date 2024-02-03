#!/usr/bin/env bash
NAME=calibre
CONTENT_SERVER_PORT=7777
PORT=8080
if [ ! -z $1 ]; then
   EP="--entrypoint bash"
fi

docker run                                          \
    -it                                             \
    --rm                                            \
    --name $NAME-dev                                \
    -e AUTH=${AUTH:-false}                          \
    -v "${HOME}/calibre-library:/calibre-library"   \
    -v "${HOME}/calibre-autoscan:/calibre-autoscan" \
    -v "${HOME}/calibre-inbox:/nobody/inbox"        \
    -p ${CONTENT_SERVER_PORT}:7777                  \
    -p ${PORT}:32000                                \
    $EP                                             \
    ivonet/$NAME
