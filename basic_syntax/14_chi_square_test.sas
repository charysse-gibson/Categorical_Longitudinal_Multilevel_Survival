/* CHI SQUARE TEST */
	*A chi-square test is used to examine the association between two categorical variables. 
	 It can be used to test both extent of dependence and extent of independence between Variables. 
	 SAS uses PROC FREQ along with the option chisq to determine the result of Chi-Square test.;
	 
*Ho: Independent
 Ha: Dependent;


/* Example */
libname BST5030 '/folders/myfolders/Data for Classes 3 to 6';

data pilotdata;
   infile '/folders/myfolders/Data for Classes 1 and 2/pilot.dat';
   input EmployeeID $  1 - 6
         FirstName  $  7 - 19
         LastName   $ 20 - 34
         JobCode    $ 35 - 41
         Salary       42 - 47
         Category   $ 48 - 50;
run;

proc freq data = pilotdata;  
  tables category*jobcode salary*jobcode/ chisq; 
  run; 

