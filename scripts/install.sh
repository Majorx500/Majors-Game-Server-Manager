#!/bin/bash

# $1 -- Game $2 -- directory $3 -- opt -- game

if [[ $# = 0 ]]; then
  GAME=$(whiptail --title "Game Server Settings" --backtitle "Major's Game Server Manager" --radiolist \
    "Choose Game" 20 78 4 \
    "PaperMC" "PaperMC Minecraft Server" ON \
    "Arma3" "Arma 3 Server" OFF \
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
  if [[ $# -ne 3 ]]; then
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
      --inputbox "Choose gameserver directory. If you choose an occupied one it will be cleared" 20 78 \
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

echo "${GAME,,};${GAME,,}${SERV_ID};$GAME_VER" >>servers.csv

case $GAME in
"PaperMC")
  ./scripts/install/papermc.sh $GAME_VER $GAME_DIR $SERV_ID
  ;;
"SCPSL")
  ./scripts/install/scpsl.sh $GAME_DIR $SERV_ID
  ;;
esac
