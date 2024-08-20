#!/bin/bash

# Define colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
MAGENTA='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'
RESET='\e[0m'

clear
cd /var/www/pterodactyl/ || { echo -e "${RED}Directory /var/www/pterodactyl/ does not exist.${RESET}"; exit 1; }
echo -e "${CYAN}-----------------------------------------------${RESET}"
echo -e "${CYAN}-----歡迎使用FlyBirdHost Pterodactyl重啟腳本----${RESET}"
echo -e "${CYAN}-----------------------------------------------${RESET}"
echo -e "${MAGENTA}+*+-+*+-+*+-+*+-+*+-+*+-+*+-+*+-+*+-+*+-+*+-+*+${RESET}"
echo -e "${GREEN}==========版本: V1.0.0==========${RESET}"
echo -e "${YELLOW}>=--------開始執行腳本--------=<${RESET}"
php artisan down || { echo -e "${RED}Failed to open Pterodactyl in maintenance mode.${RESET}"; exit 1; }
echo -e "${GREEN}_____________開啟Pterodactyl維護模式_____________${RESET}"
php artisan view:clear || { echo -e "${RED}Failed to clear Pterodactyl view cache.${RESET}"; exit 1; }
echo -e "${GREEN}_____________清理Pterodactyl View快取_____________${RESET}"
php artisan config:clear || { echo -e "${RED}Failed to clear Pterodactyl config cache.${RESET}"; exit 1; }
echo -e "${GREEN}_____________清理Pterodactyl Config快取_____________${RESET}"
php artisan queue:restart || { echo -e "${RED}Failed to restart Pterodactyl queue.${RESET}"; exit 1; }
echo -e "${GREEN}_____________重啟Pterodactyl 佇列_____________${RESET}"
yarn build:production || { echo -e "${RED}Failed to build Pterodactyl content.${RESET}"; exit 1; }
echo -e "${GREEN}_____________重新打包Pterodactyl 內容_____________${RESET}"
php artisan optimize:clear || { echo -e "${RED}Failed to optimize Pterodactyl.${RESET}"; exit 1; }
echo -e "${GREEN}_____________Pterodactyl 最佳化處理_____________${RESET}"
php artisan up || { echo -e "${RED}Failed to close Pterodactyl maintenance mode.${RESET}"; exit 1; }
echo -e "${GREEN}_____________關閉Pterodactyl維護模式_____________${RESET}"
echo -e "${MAGENTA}+*+-+*+-+*+-+*+-+*+-+*+-+*+-+*+-+*+-+*+-+*+-+*+${RESET}"
clear
echo -e "${CYAN}-----------------------------------------------${RESET}"
echo -e "${CYAN}-----感謝使用FlyBirdHost Pterodactyl重啟腳本----${RESET}"
echo -e "${CYAN}-----------------------------------------------${RESET}"
echo -e "${YELLOW}>=--------結束執行腳本--------=<${RESET}"
