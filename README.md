# Major's Game Server Manager

[Github](https://github.com/Majorx500)
[Discord Server](https://discord.gg/Hx5cqpKV3c)

This is a terminal-based game server manager for linux distributions that allows you to install and manage game servers.
Has been tested on arch-based and debian-based distros.

It runs the game servers in docker containers; For steam-based servers it also auto-updates it during container start.

## Requirements

The current requirement is docker; all the other tools should already be installed on most modern distributions.

Debian:

    sudo apt install docker

Arch-linux:

    sudo pacman -S docker

## Installing

There are two ways to install MGSM:

1. Clone the repository and remove the .git folder (or keep it to be able to update)

    git clone <https://github.com/Majorx500/Majors-Game-Server-Manager.git> && rm -rf Majors-Game-Server-Manager/.git

2.

## Running

  It is recommended to use a separate user for mgsm, that is in the docker group.
  To find out how to add a user to the docker group look [here](https://docs.docker.com/engine/install/linux-postinstall/)
  The containers create their own user with UID and GID of 9201.
  
  You may need to add execute permissions to the executable. To do so run

      chmod u+x mgsm

  While in the main directory of the repository simply run the mgsm file

    ./mgsm

## Available Games

Game servers that you can currently install with mgsm are:

* PaperMC
* SCP Secret Laboratory

## Future Games

Game servers that I'm working on adding are:

* Arma 3  
* Fabric MC

## Bugs and features

If you have any ideas for features or found some bugs feel free to create an issue on this repository
or join my discord server and let me know there!
