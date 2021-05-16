/* Graphs - PROC GCHART*/

PROC SGPLOT DATA=SAS-data-set;

HBAR chart-variable . . . </ options>;
VBAR chart-variable . . . </ options>;
HBOX chart-variable . . . </ options>;
VBOX chart-variable . . . </ options>;

/* vertical bar graph examples */
libname project '/folders/myfolders/Project Data Sets';
proc sgplot data=project.lipid_ext;
  title "Frequency of Alcohol Consumption";
  vbar alcohol;
run;
proc sgplot data=project.lipid_ext;
  title "Frequency of Alcohol Consumption by Gender";
  vbar alcohol / group=gender;
run;
quit;

libname bst5030 '/folders/myfolders/Data for Classes 3 to 6';
proc sgplot data=bst5030.fltattnd;
  vbar JobCode / group=country;
  where JobCode =: 'FLTAT';
  title 'Job Code Frequency by Country';
run;
quit;

proc sgplot data=bst5030.fltattnd;
  vbar JobCode/ response=Salary stat=mean;
  where JobCode =: "FLTAT";
  format Salary dollar9.;
  label JobCode = 'Job Codes' Salary = 'Salary of each Flight Attendant';
  title 'Average Salary by Job Code';
run; 
quit;


/* horizontal bar graph example */
libname bst5030 '/folders/myfolders/Data for Classes 3 to 6';
proc sgplot data=bst5030.fltattnd;
  hbar JobCode;
  where JobCode =: 'FLTAT';
  title 'Number of Flight Attendants by JobCode';
run;
quit;  

/* histogram example */
Proc sgplot data = bst5030.fltattnd; 
   histogram Salary / nbins= 5 showbins;
   where JobCode =: 'FLTAT';
   format Salary dollar9.;
   title "Distribution of Salary for Flight Attendants";
 run;
 quit;
 
* NOTE:
  - NBINS= option in the HISTOGRAM statement divides the values of Salary into five ranges and displays a bar for each range of values.
  - SHOWBINS= option in the HISTOGRAM statement displays a tick mark at the midpoint of each bin, and displays the midpoint value under this tick mark; 

/* Scatterplot example */
libname project '/folders/myfolders/Project Data Sets';
PROC sgplot DATA= project.lipid_ext;
    SCATTER X = age Y = weight ;
RUN;
PROC sgplot DATA= project.lipid_ext;
    SCATTER X = weight Y = height / group=gender;
RUN;
QUIT;

/* Class Exercise: Creating Scatterplots */
proc sgplot data=bst5030.budget;
   scatter X = Month Y = Yr2007;
   format Yr2007 dollar12.;
   title 'Plot of Budget by Month';
run;
quit;

proc sgplot data=bst5030.budget;
   series X = Month Y = Yr2007 / markers;
   label Yr2007='Budget';
   format Yr2007 dollar12.;
   title 'Plot of Budget by Month';
run;
quit;

proc sgplot data=bst5030.budget;
   series X = Month Y = Yr2007 / markers;
series X = Month Y = Yr2006 / markers;
   label Yr2007='2007 Budget';
label Yr2006='2006 Budget';
   format Yr2007 dollar12.;
format Yr2006 dollar12.;
   title 'Plot of Budget by Month for 2006 and 2007';
run;
quit;