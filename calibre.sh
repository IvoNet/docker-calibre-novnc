#!/usr/bin/env bash
NAME=calibre
CONTENT_SERVER_PORT=7777
PORT=10002
WAIT=4

if [ ! "$(docker ps -q -f name=$NAME)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=$NAME)" ]; then
        echo "Starting existing $NAME container..."
        docker start $NAME
        sleep $WAIT
        open http://localhost:$PORT
    else
        echo "Starting new $NAME container..."
        docker run                                          \
            -d                                              \
            --name $NAME                                    \
            -v "${HOME}/calibre-library:/calibre-library"   \
            -v "${HOME}/calibre-autoscan:/calibre-autoscan" \
            -v "${HOME}/calibre-inbox:/nobody/inbox"        \
            -p ${CONTENT_SERVER_PORT}:7777                  \
            -p ${PORT}:32000                                \
            ivonet/$NAME

        sleep $WAIT
        open http://localhost:$PORT
    fi
else
    echo "Stopping $NAME..."
    docker stop $NAME
fi

