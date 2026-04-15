#!/bin/bash

# $1 -- GAME_VER $2 -- GAME_DIR $3 -- SERVER_ID $4 -- GAME_PORT

docker run -e GAME_VERSION=$1 -p $4:25565/tcp -p $4:25565/udp -v $2:/data:rw --name papermc$3 -itd ghcr.io/majorx500/papermc-mgsm:latest
