#! /bin/bash
#cars.sh
#Gary Zeri

#############################################################################

#All function defined here 
#menu function to show the menu to the user
function mainMenu(){

	#init loop control variable
	loop=true

	#init message variable
	message=""	

	#loop to check user input to ensure it is valid
	while($loop)
	do		
		#clear the screen and present the menu options to the user 
		clear
		echo $message
		echo ""
		echo "1. Add A Car"
		echo "2. List Cars in the Inventory"
		echo "3. Quit"
		echo ""
		echo "Please choose and option: "
		echo ""
	
		read input
 		
		loadOption $input result 

		if [ $result -eq 0 ]
		then
			loop=false
		fi	
	done
}

#############################################################################

#function to add a car to the list 
function addCar(){
	
	#clear the screen 
	clear 
	
	#ask for the year 
	echo "Please enter the year of the vehicle kind sir or madam: "
	read year

	#ask for the make
	echo "Please enter the make of your vehicle, Mr. or Mrs. Linux User: "
	read make 
	
	#ask for the model 
	echo "Last thing to ask! Can you please enter in the model of your vehicle all-mighty keyboard typer: "
	read model	
	
	#create final string
	echo "$year:$make:$model" >> My_old_cars

	#create message string 
	messageStr="Your $year $make $model was added to the list."
	message=$messageStr
}


#############################################################################

#function to dispalay the list of cars to the user
function listCars(){

	#use cat to get file, and then use tr to rmove the : characters form the fil
	clear
	echo ""
        cat My_old_cars | tr ':' ' ' 
	echo ""
	echo "Press enter to return to the main menu."
	read nothing
}

#############################################################################

#function to load specifed option
function loadOption(){

	#set up return value 	
	local __return=$2
	eval $__return=1

	case $1 in 
		"1" ) 
			addCar
			returnValue=true;;
		"2" ) 
			listCars
			returnValue=true;;
		"3" )
			echo ""
			echo "Goodbye"	
			eval $__return="'0'";;
		* )	
			message="Invalid Option! Please choose another.";;
	esac
}

#############################################################################

#start main loop of the program with the main menu 
mainMenu
