#!/bin/sh

add_book(){
   read -p "Enter the Name of the Book that you want to be add : " newBook
   books[$i]=$newBook
   let i++
   echo "Book has been successfully Added!!"
   echo
}

delete_book(){
   read -p "Enter the Name of the Books that you want to be delete: " book_to_delete
   availible="no"
   for index in ${!books[@]}
   do
        if [ ${books[$index]} = $book_to_delete ]; then
	  availible="yes"
	  unset books[$index]
	  echo "$book_to_delete Book Deleted Successfully"
          echo
	  break
        fi
   done
   if [ $availible = "no" ]; then
      echo "$book_to_delete is not availible, and Not found in the database"
      echo
   fi
}

list_book(){
   if [ ${books[@]} -eq 0 ]; then
	echo "No Books are Availible"
	echo
	return 1
   fi

   echo "List of All Available Books :"
   echo "-----------------------------"
   for book in ${books[@]}
   do	
	echo $book
   done
}



echo "Book Management System"
echo "----------------------"
declare -a books
i=0
while [ true ] 
do
  read -p "[Add | Delete | List | Exit] - Enter your choice : " option
  case $option in
	Add)
	   add_book
	   ;;
	Delete)
	   delete_book
	   ;;
	List)
	   list_book
	   ;;
	Exit)
	   echo "Thank You !! for using our Application"
	   echo "Created By - "
	   echo "Nitin Patel 2K20/CO/308"
	   echo "Nilesh Seth 2K20/CO/303"
	   exit 0	
	   ;;
	*) 
	   echo "Wrong Option, Try Again"
  esac
done  
