# Major's Game Server Manager

This is a terminal game server manager for linux distributions that allows you to install and manage game servers.
Has been tested on arch-based and debian-based distros.

## Requirements

The current requirements are:
  docker, whiptail

## Installing

  To use install, simply git clone the repository and run the mgsm file.
  You can also make a link in the /usr/bin directory to the mgsm script.
  
## Running

  It is recommended to use a seperate user for mgsm, that is in the docker group.
  Check the docker documentation to find out how to do that. The containers create their own user with UID and GID of 9201.

## Available Games

Game servers that you can currently install with mgsm are:

* PaperMC

## Future Games

Game servers that I'm working on adding are:

* Arma 3  
* SCP Secret Laboratory

## Adding custom servers

If you have a docker container running with a game server you can add it to mgsm to also have it in the list of servers.
To do so simply add another row to servers.csv file with data in order: Game;Server_Name;Version
If you don't know the game's version simply put latest.
 *CUSTOM SERVER UPDATING WILL DEPEND ON THE CONTAINER IMPLEMENTATION*
 *ADDING CUSTOM SERVERS SHOULD ONLY BE USED FOR STARTING AND STOPPING THE CONTAINER*

## Bugs and features

If you have any ideas for features or found some bugs feel free to DM me on discord : Majorx500.
