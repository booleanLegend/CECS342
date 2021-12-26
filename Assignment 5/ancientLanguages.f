*This is a comment
	program ancientLanguages
*I create a name
*The following lines declare the kind of data including the variable names
	implicit none
	integer, allocatable, dimension(:) :: x
	integer :: range, start, finish, mid, tries
	integer :: i, number, val

*Displays a message asking for the number of values to set the array to allocates the amount
	print *, 'Enter the number of values: '
	read *, number
	allocate( x(number) )

*Reads all the values to add to the array
	do i = 1, number
		READ *, x(i)
	end do

*Asks for a value to lookup
	print *, 'Enter value: '
	read *, VAL

*Sets the start, finish, middle of the array as well as the number of tries the user has 
	start = 1
	finish = number
	range = finish - start
	mid = (start + finish) / 2
	tries = 4

*Loop with the amount of tries the user has
	do while ( tries > 0 ) 
*Loop to sort, check value to find
		do while ( x(mid) /= val .and. range > 0 )
			if (val > x(mid)) then
				start = mid + 1
			else
				finish = mid - 1
			end if
			range = finish - start
			mid = (start + finish) / 2
		end do
*Displays message for value to be found 
		if ( x(mid) /= val ) then
			print *, val, 'NOT FOUND'
			print *, 'Enter value: '
			read *, VAL
		else
			print *, 'VALUE AT ', mid
			print *, 'Enter value: '
			read *, VAL
		end if 
*Decrements the tries, resets the start, finish, range, mid, loops again
		tries = tries - 1
		start = 1
		finish = number
		range = finish - start
		mid = (start + finish) / 2
	end do
	
*Deallocates the array space
	deallocate(x)
*Ends 
	end program ancientLanguages