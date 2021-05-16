/* SORTING DATA */
   *For rearranging observations in SAS data set
	Create new data sets with rearranged observations
	Can sort multiple variables (ascending by default & does not generate printed output);


/* INSTRUCTIONS */
/* Name the SAS data set to be sorted. */
/* Name the SAS data set to be created (optional).  Default is to update the original data via sorting… */
/* Name the variable(s) and order by which to sort. */


/* FORMAT */
PROC SORT	DATA=SAS_data_set_name
			OUT=NEW_SAS_data_set_name;
		by variable1 variable2;
run;


/* Example */
Data score;
input name$ test_1 test_2 test_3 test_4;
total = test_1 + test_2 + test_3 + test_4;
datalines;
Greg 10 9 8 10
John 10 9 8 8
Lisa 9 9 8 10
Carla 10 9 10 10
Mark 7 9 8 10
;
run;
proc print data= score;
run;
proc sort data = score 
		  out = score2;
		  by test_3;
run;
Proc print data=score2;
run;
proc sort data = score 
		  out = score3;
		  by descending test_1;
run;
Proc print data=score3;
run;
