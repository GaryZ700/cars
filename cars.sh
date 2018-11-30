#! /bin/bash
#cars.sh
#Gary Zeri

#global variables defined here 
#init loop control variable
loop=false

#############################################################################

#All function defined here 
#menu function to show the menu to the user
function mainMenu(){

	#init loop control variable
	loop=true
	
	#loop to check user input to ensure it is valid
	while($loop)
	do		
		#clear the screen and present the menu options to the user 
		clear
		echo "1. Add A Car"
		echo "2. List Cars in the Inventory"
		echo "3. Quit"
		echo "\n Please choose and option: "
	
		read input 		
		
		result=0
		loadOption input result		

		if [ loadOption input ]
		then
			loop=false
		fi	
	done
}

#############################################################################

#function to load specifed option
function loadOption(){
	
	case $1 in 
		1 ) 
			addCar()
			returnValue=true;;
		2 ) 
			listCars()
			returnValue=true;;
		3 ) 
			echo "Goodbye"
			returnValue=2;;
	esac
	
	return $returnValue
}

#############################################################################

#init main while loop for the code 
while $loop
do

	#print the menu to the user
	mainMenu()



done
