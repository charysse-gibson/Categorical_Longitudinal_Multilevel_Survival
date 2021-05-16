/* INFROMATS or FORMATTED INPUT */
	*Formats used in input statements
	- used to read data correctly
	- form: <$>informat-namew.<d>;

/* Format */
	input pointer-control variable informat . . .;
*Formatted input is used to read data values by doing the following:
	(1) moving the input pointer to the starting position of the field
	(2) specifying a variable name
	(3) specifying an informat

Pointer controls:		
@n	moves the pointer to column n.
+n	moves the pointer n positions. 

An informat specifies the following: 
(1) the width of the input field
(2) how to read the data values that are stored in the field;

/* Example */
data work.dfwlax;
   input @1 Flight $3. @4 Date mmddyy8.
         @12 Dest $3. @15 FirstClass 3.
         @18 Economy 3.;
datalines;
43912/11/00LAX 20137
92112/11/00DFW 20131
11412/12/00LAX 15170
;
run;

*Selected informats:
$w. removes leading blanks
$CHAR8. preserves leading blanks
--- see "Formats" for more