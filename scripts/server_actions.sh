#!/bin/bash

# $1 -- command $2 -- container name

wrong_usage() {
  echo "Wrong usage! Available commands:"
  echo "start    | st   -- start server"
  echo "stop     | sp   -- stop server"
  echo "restart  | r    -- restart server"
}

echo $1 $2

if [[ $# -ne 2 ]]; then
  wrong_usage
  exit
fi

case $1 in
start | st)
  docker start $2 >/dev/null
  ;;

stop | sp)
  docker stop $2 >/dev/null
  ;;

restart | r)
  docker restart $2 >/dev/null
  ;;
update | u)
  docker restart $2 >/dev/null
  ;;
console | c)
  docker logs $2
  docker attach $2
  ;;
*)
  wrong_usage
  ;;
esac
