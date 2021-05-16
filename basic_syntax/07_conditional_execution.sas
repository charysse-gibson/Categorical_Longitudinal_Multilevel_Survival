*Conditional Execution
	Used when a condition is involved (if...then...)

1. Specify the DATA step that defines the SAS data set. 
2. Determine the condition.
3. Determine the action. 
;

data pilotdata;
   infile 'input-raw-data-file';
   input EmployeeID  $  1 - 6
         FirstName   $  7 - 19
         LastName    $ 20 - 34
         JobCode     $ 35 - 41
         Salary        42 - 47
         Category    $ 48 - 50;
   Bonus = Salary * 0.10;
   
   if JobCode = 'PILOT1' then
   NewSalary = Salary * 1.05;

	if JobCode = 'PILOT2' then
   NewSalary = Salary * 1.07;

	if JobCode = 'PILOT3' then
   NewSalary = Salary * 1.09;

run;                          

*A more efficient approach uses an ELSE IF-THEN sequence of statements. After a condition is true, no further statements in the series are processed.
General form of the ELSE IF-THEN statement:
;
/* IF condition THEN action; */
/* ELSE IF condition THEN action; */

	if JobCode = 'PILOT1' then
	   NewSalary = Salary * 1.05;
	
	else if JobCode = 'PILOT2' then
	        NewSalary = Salary * 1.07;
	
	else if JobCode = 'PILOT3' then
	        NewSalary = Salary * 1.09;

/* TEST SCORES EXAMPLE */
data TestScores;
	input Name $ Test1 Test2 Test3 Test4;
	Total = Test1 + Test2 + Test3 + Test4;
/* Create character variable */
	Final = '';
	
/* 	if Name = 'Greg' then Total = 0; */
	if Name = 'Greg' & Total >= 37 then Final = 'B';

datalines;
Greg 10 9 8 10
John 10 9 8 8
Lisa 9 9 8 10
Carla 10 9 10 10
Mark 7 9 8 10
;
	
run;

/* HOMEWORK example */
data IQ_AND_TEST_SCORES;
	input ID 1-3 IQ 4-6 MATH 7-9 SCIENCE 10-12;
	OVERALL=((IQ+MATH+SCIENCE)/3)/500;

	if IQ lt 100 then
		GROUP=1;

	if IQ ge 101 le 140 then
		GROUP=2;

	if IQ gt 140 then
		GROUP=3;
	datalines;
001128550590
002102490501
003140670690
004115510510
;
run;