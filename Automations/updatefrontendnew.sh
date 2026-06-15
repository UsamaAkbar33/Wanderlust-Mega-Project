#!/bin/bash
ipv4_address="178.128.122.158"
file_to_find="../frontend/.env.docker"
alreadyUpdate=$(cat ../frontend/.env.docker)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e " ${GREEN}System Public Ipv4 address ${NC} : ${ipv4_address}"

if [[ "${alreadyUpdate}" == "VITE_API_PATH=\"http://${ipv4_address}:31100\"" ]]
then
    echo -e "${YELLOW}Already updated${NC}"
else
    if [ -f ${file_to_find} ]
    then
        echo -e "${GREEN}Configuring frontend env...${NC}"
        sleep 7s
        sed -i -e "s|VITE_API_PATH.*|VITE_API_PATH=\"http://${ipv4_address}:31100\"|g" ${file_to_find}
        echo -e "${GREEN}Done!${NC}"
    else
        echo -e "${RED}ERROR: File not found${NC}"
    fi
fi
