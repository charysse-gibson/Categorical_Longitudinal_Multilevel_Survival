/* SUMMARY STATISTICS */
	*By default, it includes:
	 N, MEAN, STD, MIN, and MAX;
	*excludes missing values before calculating;

/* PROC MEANS OPTIONS */
/* 	Format: */
/* 	proc means data = sasdata <options>;  */
/* 	var variable1 variable2; */
/* 	run; */
	
	*N = number of rows with nonmissing values
	 MEAN = arithmetic mean (average)
	 STD = standard deviation
	 MIN = minimum value
	 MAX = maximum value
	 RANGE = difference between lowest and highest values
	 MEDIAN = 50th percentile value
	 SUM = total
	 NMISS = number of rows with missing values
	 lclm = one-sided confidence limit below the mean
	 uclm = one-side confidence limit above the mean;

*example1;
Proc means data=resdat.occudata;
	title 'Analysis of Workplace Injury Costs';
run;

*example2;
data westrates;
	infile '/folders/myfolders/Data for Classes 3 to 6/westernrates.dat';
	input  city $ 					1-30 
		   state $ 					31-33 
 		   HealthCareEnvironment 	45-49 
 		   Crime 					50-54;
 run; 
Proc means data=westrates;
run;

/* Grouping Observations */
/* 	The CLASS statement in the MEANS procedure */
/* 	groups the observations of the SAS data set for analysis. */

*Format:
	CLASS SAS-variable(s);

*example;
proc means data=resdat.injrydat maxdec=2;
   var MedCost;
   class JobCode;
   title 'Injury Costs by Job Code';
run;

*The MAXDEC= option controls the number of decimal places displayed in the output.;

/* REMOVE TITLE */
ods noproctitle;
