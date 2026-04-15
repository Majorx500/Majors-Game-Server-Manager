#!/bin/bash

# $1 -- Game $2 -- directory $3 -- opt -- gamePort $4 -- opt -- game version

if [[ $# = 0 ]]; then
  GAME=$(whiptail --title "Game Server Settings" --backtitle "Major's Game Server Manager" --radiolist \
    "Choose Game" 20 78 4 \
    "PaperMC" "PaperMC Minecraft Server" ON \
    "FabricMC" "Fabric Minecraft Server" OFF \
    "SCPSL" "SCP Secret Laboratory" OFF 3>&1 1>&2 2>&3)
  exit_status=$?
  if [[ exit_status -ne 0 ]]; then
    echo "Cancelled Creating Server"
    exit
  fi
else
  GAME="$1"
fi

SERV_ID=$(grep -c ${GAME,,} servers.csv)
if [[ $GAME = "PaperMC" ]]; then
  if [[ $# -ne 4 ]]; then
    GAME_VER=$(
      whiptail --title "Game Server Settings" --backtitle "Major's Game Server Manager" --radiolist \
        "Choose Game Version" 20 78 8 \
        "1.21.11" "latest" ON \
        "1.21.10" "" OFF \
        "1.20.5" "" OFF \
        "1.20.4" "" OFF \
        "1.19.4" "" OFF \
        "1.18.2" "" OFF \
        "1.16.5" "" OFF \
        "1.16.4" "" OFF \
        3>&1 1>&2 2>&3
    )
  else
    GAME_VER=$3
  fi
else
  GAME_VER="latest"
fi

exit_status=$?

if [[ exit_status -ne 0 ]]; then
  echo "Cancelled Creating Server"
  exit
fi

if [[ $# -lt 2 ]]; then

  GAME_DIR=$(
    whiptail --title "Game Server Settings" --backtitle "Major's Game Server Manager" \
      --inputbox "Choose gameserver directory. If the directory is not clear all it's contents will be deleted" 20 78 \
      "$HOME/servers/${GAME,,}$SERV_ID" \
      3>&1 1>&2 2>&3
  )
else
  if [[ $2 = "default" ]]; then
    GAME_DIR="$HOME/servers/${GAME,,}${SERV_ID}"
  else
    GAME_DIR=$2
  fi
fi

exit_status=$?

echo $exit_status
if [[ exit_status -ne 0 ]]; then
  echo "Cancelled Creating Server"
  exit
fi

echo $GAME
case $GAME in
"PaperMC") DEFAULT_PORT=25565 ;;
"SCPSL") DEFAULT_PORT=7777 ;;
esac

echo $DEFAULT_PORT

if [ $# -lt 3 ]; then
  GAME_PORT=$(whiptail --title "Game Server Settings" --backtitle "Major's Game Server Manager" \
    --inputbox "Choose the game server port, make sure it is not being used by another server!" 20 78 \
    "$DEFAULT_PORT" 3>&1 1>&2 2>&3)
fi

exit_status=$?
echo $exit_status
if [[ exit_status -ne 0 ]]; then
  echo "Cancelled Creating Server"
  exit
fi

echo "${GAME,,};${GAME,,}${SERV_ID};$GAME_VER;$GAME_PORT" >>servers.csv

case $GAME in
"PaperMC")
  ./scripts/install/papermc.sh $GAME_VER $GAME_DIR $SERV_ID $GAME_PORT
  ;;
"SCPSL")
  ./scripts/install/scpsl.sh $GAME_DIR $SERV_ID $GAME_PORT
  ;;
esac
