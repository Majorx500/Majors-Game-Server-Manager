#!/bin/bash

# $1 -- GAME_DIR $2 -- SERVER_ID $3 -- GAME_PORT

docker run -p $3:7777/tcp -p $3:7777/udp -v $1:/data:rw --name scpsl$2 -itd ghcr.io/majorx500/scpsl-mgsm:latest
