/* UNIVARIATE STATISTICS */
	*use to look at distributions of continuous variables;

/* Format: */
PROC UNIVARIATE DATA=SAS-data-set  <options>;
   VAR <variable list>;
   HISTOGRAM <variable list>;
RUN;

/* example */
data westrates;
	infile '/folders/myfolders/Data for Classes 3 to 6/westernrates.dat';
	input  city $ 					1-30 
		   state $ 					31-33 
 		   HealthCareEnvironment 	45-49 
 		   Crime 					50-54;
 run; 
Proc univariate data=westrates;
	var healthcareenvironment crime;
	histogram;
run;

*Checking for characteristics for normality of a given distribution:
	Measures of centrality	
	Measures of variability
	Measures of normality
	Extreme observations
	Count and percent of missing values;

*Also various plotting options:
	Histograms
	Boxplots
	Stem leaf plots
	Normal probability plots
	QQ plots;
