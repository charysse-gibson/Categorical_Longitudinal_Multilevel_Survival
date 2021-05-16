/* GROUPING OBSERVATIONS*/
	   *For grouping observations in a report, 
		the BY statement is used to produce separate 
		sections of the report for each BY group.;

/* example */
proc sort data=work.clinic out=work.sort;
   by Country descending Gender Last_Name;
run;

proc print data=work.sort;
   by Country descending Gender;
run;

/* To print each country on a separate page */
proc print data=work.sort;
   by Country descending Gender;
   pageby Country;
run;
