*PROC PRINT

You can control the number of observations that are printed 
by using the (obs=n) option in the print statement.
;  
proc print data=drug noobs (obs=10);
run;

*NOOBS tells the program not to print the observations column;

*The FIRSTOBS option paired with an OBS option allows you to 
print the observations between the row denoted by FIRSTOBS and OBS.
;
proc print data=drug(firstobs=10 obs=20);
run;
