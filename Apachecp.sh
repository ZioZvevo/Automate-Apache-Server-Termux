#!/bin/bash
echo "Welcome to Install Apache for Termux!"
sleep 2
echo 
echo 
REQUIRED_PKG="apache2"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  pkg install $REQUIRED_PKG
fi
echo 
echo 

sleep 3
echo "Would you like to run the server to localhost?(Y/n)"
read response

if [[ ("$response" != "Y" || "y") && "$response" = "n" ]]; then
echo "Thank you for using Apache!"
sleep 2
   exit 0
elif [[ "$response" != "n" && ("$response" = "Y" || "y") ]]; then
   
   apachectl
   
   echo "Type stop to exit and stop the server"
   read CC
   if [[ $CC = "stop" || "Stop" ]];
   then 
   apachectl -k stop
   sleep 3
   echo 
   echo "Server stopped"
   fi
  fi
