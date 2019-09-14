#!/bin/bash

# exhibir el menu
clear
echo "ADMINISTRAR USUARIOS"
echo "--------------------"
echo "1) Crear usuario"
echo "2) Eliminar usuario"
echo "3) Crear grupo"
echo "4) Agregar usuario a grupo"
echo "5) Eliminar usuario de grupo"
echo "6) Exit"
echo ""

# selecionar una opción
read -p "Opción: " option

# limpa la pantalla
clear

if [[ $option = 1 ]]; then
	# creación de usuario	
	echo "CREAR USUARIO"
	echo "-------------"
	read -p "Nombre: " user_name

	read -p "Quieres agregar el usuario a un grupo? (s/N) " add_to_group
	if [[ $add_to_group = "s" ]]; then
		read -p "Grupo primario: " primary_group
		read -p "Grupo secundario " secondary_group
	fi
	
	read -p "Confirma la creación del usuario $user_name? (s/N) " confirm
	if [[ $confirm = "s" ]]; then
		useradd $user_name
		if [[ ! $primary_group = "" ]]; then
			usermod $user_name -g $primary_group
		fi		 
		if [[ ! $secondary_group = "" ]]; then
			usermod $user_name -G $secondary_group
		fi		 

		echo "Usuario $user_name creado!"
		read
	fi

elif [[ $option = 2 ]]; then
	# eliminar usuario	
	echo "ELIMINAR USUARIO"
	echo "----------------"
	read -p "Nombre: " user_name

	read -p "Confirma la remoción del usuario $user_name? (s/N) " confirm
	if [[ $confirm = "s" ]]; then
		userdel $user_name
		echo "Usuario $user_name eliminado!"
		read
	fi

elif [[ $option = 3 ]]; then
	# crear grupo
	echo "CREAR GRUPO"
	echo "-----------"
	read -p "Nombre: " group_name

	read -p "Confirma la creación del grupo $group_name? (s/N) " confirm
	if [[ $confirm = "s" ]]; then
		groupadd $group_name
		echo "Grupo $group_name creado!"
		read
	else
		echo "No se ha creado el grupo $group_name!"
		read
	fi

elif [[ $option = 4 ]]; then
	# agregar usuario a grupo
	echo "AGREGAR USUARIO A GRUPO"
	echo "-----------------------"
	read -p "Usuario: " user_name
	read -p "Grupo: " group_name

	read -p "Confirma la adición del usuario $user_name al grupo $group_name? (s/N) " confirm
	if [[ $confirm = "s" ]]; then
		gpasswd -a $user_name $group_name
		echo "Usuario $user_name agregado al grupo $group_name!"
		read
	else
		echo "Usuario $user_name no ha sido agreado al grupo $group_name!"
		read
	fi

elif [[ $option = 5 ]]; then
	# eliminar usuario de grupo
	echo "ELIMINAR USUARIO DE GRUPO"
	echo "-------------------------"
	read -p "Usuario: " user_name
	read -p "Grupo: " group_name

	read -p "Confirma la remoción del usuario $user_name del grupo $group_name? (s/N) " confirm
	if [[ $confirm = "s" ]]; then
		gpasswd -d $user_name $group_name
		echo "Usuario $user_name removido del grupo $group_name!"
		read
	else
		echo "Usuario $user_name no ha sido removido del grupo $group_name!"
		read
	fi

elif [[ $option = 6 ]]; then
	# salir
	exit	
fi

# recarga el programa
source $0
