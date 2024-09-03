#!/bin/sh
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "\033c"
printf "${GREEN}Starting..${NC}\n"
printf "\033c"

DIR=$PWD # get current dir
# if current dir is /root print ~
if [ "$PWD" = "/root"* ]; then
    DIR="~${PWD#/root}"
fi

printf "\033c"
echo "${GREEN}╭────────────────────────────────────────────────────────────────────────────────╮${NC}"
echo "${GREEN}│                                                                                │${NC}"
echo "${GREEN}│                               Pterodactyl VPS                                  │${NC}"
echo "${GREEN}│                                                                                │${NC}"
echo "${GREEN}│                           ${RED}© 2021 - 2024                                        │${NC}"
echo "${GREEN}│                                                                                │${NC}"
echo "${GREEN}╰────────────────────────────────────────────────────────────────────────────────╯${NC}"
echo "                                                                                               \n"
printf "                                                                                               \n"
printf "root@MyVPS:${DIR}#                                                                             \n"

run_cmd() {
    read -p "root@MyVPS:$DIR# " CMD
    eval "$CMD"

    # Update DIR after executing command
    DIR=$PWD
    if [ "$PWD" = "/root"* ]; then
        DIR="~${PWD#/root}"
    fi

    printf "root@MyVPS:$DIR# \n"
    run_user_cmd
}

run_user_cmd() {
    read -p "user@MyVPS:$DIR# " CMD2
    eval "$CMD2"

    # Update DIR after executing command
    DIR=$PWD
    if [ "$PWD" = "/root"* ]; then
        DIR="~${PWD#/root}"
    fi

    printf "root@MyVPS:$DIR# \n"
    run_cmd
}

run_cmd
