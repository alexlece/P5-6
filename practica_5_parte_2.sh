#!/bin/bash

#Autor: Alejandro Adell Pina

#discos duros disponibles y de su tamaño en bloques
echo "Disco       Bloques"
	info=$(ssh -n user@$1 -i /home/user/.ssh/id_as_ed25519 "sudo sfdisk -s")
	total=$(echo "$muestra" | wc -l)
	echo "$muestra" | head -n $((total - 1)) | awk '{ print $1 "   " $2 }'


# particiones y sus tamaños
	info=$(ssh -n user@$1 -i /home/user/.ssh/id_as_ed25519 "sudo sfdisk -l")
	find=$(echo "$info" | grep '/dev/sd[a-z][0-9]')
	total=$(echo "$find" | wc -l)
	echo "$find" | head -n 1 | awk '{ print $1 "   " $6 }'
	echo "$find" | tail -n $((total - 1)) | awk '{ print $1 "   " $5  }'
	

#discos montajes capacidad 
	info=$(ssh -n user@$1 -i $HOME/.ssh/id_as_ed25519 "sudo df -hT")
	find=$(echo "$info" | grep -v "^tmpfs")
	echo "$find" | awk '{ print $1  "    "  $2  "    "  $3  "    "  $5  "   "  $7 }'


   
