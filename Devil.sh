#!/bin/bash

RED='\033[0;31m'  # Define red color
NC='\033[0m'      # No color

# Devil Tool ASCII banner
echo -e "${RED}"
cat << "EOF"
██████╗ ███████╗██╗   ██╗██╗██╗         ████████╗ ██████╗  ██████╗ ██╗     
██╔══██╗██╔════╝██║   ██║██║██║         ╚══██╔══╝██╔═══██╗██╔═══██╗██║     
██║  ██║█████╗  ██║   ██║██║██║            ██║   ██║   ██║██║   ██║██║     
██║  ██║██╔══╝  ╚██╗ ██╔╝██║██║            ██║   ██║   ██║██║   ██║██║     
██████╔╝███████╗ ╚████╔╝ ██║███████╗       ██║   ╚██████╔╝╚██████╔╝███████╗
╚═════╝ ╚══════╝  ╚═══╝  ╚═╝╚══════╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
                                                                           
EOF
echo -e "${NC}"

echo -e "${RED}Welcome to Devil Tool by Mr.Joy Mahanty${NC}"

# Rest of the script...

#!/bin/bash

RED='\033[0;31m'  # Define red color
NC='\033[0m'      # No color

echo -e "${RED}Welcome to Password List Generator by Mr.Joy Mahanty${NC}"

while true; do
    echo -e "${RED}Options:${NC}"
    echo -e "${RED}1. Create Passwords${NC}"
    echo -e "${RED}2. About Us${NC}"
    echo -e "${RED}3. Exit${NC}"
    read -p "${RED}Choose an option:${NC} " choice

    case $choice in
        1)
            read -p "${RED}Enter password length:${NC} " length
            echo -e "${RED}Select options for password generation:${NC}"
            echo -e "${RED}1. Letters${NC}"
            echo -e "${RED}2. Numbers${NC}"
            echo -e "${RED}3. Mix${NC}"
            read -p "${RED}Choose an option:${NC} " option

            case $option in
                1)
                    characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                    ;;
                2)
                    characters="0123456789"
                    ;;
                3)
                    characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
                    ;;
                *)
                    echo -e "${RED}Invalid option. Exiting.${NC}"
                    exit 1
                    ;;
            esac

            read -p "${RED}Enter the quantity of passwords to generate:${NC} " quantity

            for ((i=1; i<=$quantity; i++)); do
                password=$(tr -dc "$characters" < /dev/urandom | head -c $length)
                echo -e "${RED}Generated Password $i:${NC} $password"
            done

            echo -e "${RED}Options:${NC}"
            echo -e "${RED}1. Save${NC}"
            echo -e "${RED}2. Exit${NC}"
            read -p "${RED}Choose an option:${NC} " save_option

            if [ $save_option -eq 1 ]; then
                read -p "${RED}Enter a file name to save passwords:${NC} " file_name
                echo -e "${RED}Saving passwords to $file_name...${NC}"
                for ((i=1; i<=$quantity; i++)); do
                    password=$(tr -dc "$characters" < /dev/urandom | head -c $length)
                    echo "$password" >> $file_name
                done
                echo -e "${RED}Passwords saved successfully.${NC}"
            elif [ $save_option -eq 2 ]; then
                echo -e "${RED}Exiting.${NC}"
                exit 0
            else
                echo -e "${RED}Invalid option. Exiting.${NC}"
                exit 1
            fi
            ;;
        2)
            echo -e "${RED}About Us:${NC}"
            echo -e "${RED}Created By Mr.Joy Mahanty${NC}"
            echo -e "${RED}Certified Ethical Hacker & Developer${NC}"
            ;;
        3)
            echo -e "${RED}Exiting.${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Try again.${NC}"
            ;;
    esac
done
