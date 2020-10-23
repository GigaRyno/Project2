#!/bin/bash

#date 10/22/2020
#file scripting2.sh
#brief Creating/Configuring Accounts from emails
#author Ryan LaVigne
#assignment: Scripting 2

makePass()
{
    echo "$(openssl rand -base64 12)"
}

getUser()
{
    echo "$(echo $1 | cut -d "@" -f1)"
}

if [ "$EUID" -ne 0 ]; then #Makes sure user is running as root
	echo "Must Run as Root"
    exit
else
    file=$1
    if [ -f $file ]; then # checks to see if the file exist
        #for l in $(cat $file) #gets emails from file
        while read line
        do
            user="$(getUser $line)" #gets usernames from the file and then cuts from the @ back to make the username
            pass="$(makePass)" #generates a 12 charcter password using openssl
            if [ "$(cat /etc/group | grep 'CSI230')" ] #checks to see if group exist
            then
                groupadd "CSI230"
            fi 

            if [ "$(cat /etc/passwd | grep $user)" ] #checks to see if user already exist
            then
                sudo useradd -m -s /bin/bash $user
            fi

            echo "$user:$pass" | chpasswd 
            $ echo "You password is: $pass" | mail -s "Password changed" $line #is supposed to send email to user with updated info
            chage --lastday 0 $user #forces user to change password
            usermod -a -G CSI230 $user #puts user in group for CSI230
        done
    else
        echo "File does not exist" #if file does not exist it exits
        exit
    fi
fi