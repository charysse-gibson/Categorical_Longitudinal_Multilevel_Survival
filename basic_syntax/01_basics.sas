*Raw Data in SAS; 
*variables are columns & observations are rows;

*VARIABLES;
*No space between variable names;
*Use $ for variables with characters; 

*DESCRIPTIVE stats;
*mean, median, max, min, standard deviation; 
*use median for skewed data and not normally distributed, as mean is more sensitive to outliers;

*DATA step starts with DATA and ends with RUN statement;
	*can process multiple steps at once or one at a time to check for errors;
	*always end with semicolon;
*PROC step allows you to run procedures;


*SAS can do mathematical calculations;
data demo; 

	a = 10;
	b = 20;
	c = a*b;
	
run;

data temperature;

	celsius=35; 
	fahrenheit=35*(9/5)+32;
	
run;


*LENGTH tells SAS you want to read a dataset and how many spaces the variables takes up;
*INFILE grabs data from another dataset;
	*dlm is what separates the different columns and rows;
*INPUT is what variables you want to use;

data work.NewSalesEmps;
   length First_Name $ 12 
          Last_Name $ 18 Job_Title $ 25;
   infile 'newemps.csv' dlm=',';
   input First_Name $ Last_Name $  
         Job_Title $ Salary;
run;

*to print dataset;
proc print data=work.NewSalesEmps;
run;

*to find mean; 
proc means data=work.NewSalesEmps;
   class Job_Title;
   var Salary;
run;


*SAS COLOR MEANINGS
Red means it is wrong, probably misspelled
Dark blue is for PROCs, DATA steps, and RUN statements
Lighter blue is for SAS statements and options
Green is for comments
Purple means it is enclosed in quotes
Other SAS syntax will show up as other colors;

