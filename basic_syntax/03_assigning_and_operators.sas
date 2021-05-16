*ASSIGNMENT STATEMENTS or CREATING VARIABLES
	variable = expression --->
	* multiplication
	/ division
	+ addition
	- subtraction
	** exponentiation;
	
*COMPARISON OPERATORS
	EQ = equal to 
	NE ^= not equal to
	GT > greater than
	LT < less than
	GE >= greater than or equal to
	LE <= less than or equal to
	IN equal to one of a list
	e.g. 
		where age ge 50;
		*where CityName='ladue';
	
*LOGICAL OPERATORS
	and &
	or |
	not ~
	e.g.
		where CityName in (‘Ladue', ‘Lemay', ‘Troy');
		*where CityName=‘Ladue' or
     	CityName=‘Lemay' or
     	CityName=‘Troy';


data work.houseprice;

	/* length type $ 1-7 price 8-14 tax 15-19; */
	input Type $ Price Tax;
	ActualTax = round(price * tax);
	
	datalines;
	Single 300000 0.20
	Single 300000 0.25
	Duplex 175000 0.15
	;

*SET STATEMENTS
	to read data, 
	modify existing variables, 
	or create a subset of the data;
	
	data work.filter;
 	set houseprice; 
 	if price <200000;
	*you can also use the funnel option in output data;

run;



/* Example 2 */
data work.testscores;

	input Name $ Test1 Test2 Test3 Test4;
	Total = Test1 + Test2 + Test3 + Test4;
	Weighted = Total * 0.3;
	
	datalines;
	Greg 10 9 8 10
	John 10 9 8 8
	Lisa 9 9 8 10
	Carla 10 9 10 10
	Mark 7 9 8 10
	;

*WHERE STATEMENTS with new output filter
	Can be used in procedures and data steps,
	Used to see only parts of dataset with certain specifications;
	
	data work.highscores;
		set testscores;
		where total > 35;
	
run;

*WHERE STATEMENTS to print output;

	proc print data = testscores (where = (total > 35));
	
	run;
	
	proc print data = testscores;
		where total > 35;
	
	run;
	

