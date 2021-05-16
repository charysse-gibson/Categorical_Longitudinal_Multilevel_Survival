/* Cleaning Data */

*Proc Univariate, Proc Means, Proc Freq, Proc Print
	- Used to identify invalid or missing data entries
If/Then Statements
	- Used to clean identified invalid data;
	
/*create PIMA2 dataset*/
Data PIMA2;
infile '/folders/myfolders/Project Data Sets/pima-indians-diabetes.csv' dlm=',';
input Npreg Glucose DBP Tricepts Insulin BMI Pedigree Age Diabetic;
run;

/*use proc means to look at data*/
proc means data=pima2;
var Glucose DBP BMI;
run;

/*use proc univariate to look at data*/
proc univariate data=PIMA2 plot;
Var Glucose DBP BMI;
histogram Glucose DBP BMI;
run;

/*create DEPRESSION dataset with formats for employment and religion*/
Proc format;
value employmentfmt 1='full time'
	2='part time'
	3='unemployed'
	4='retired'
	5='house-person'
	6='in school'
	7='other';
value religionfmt 1='Protestant'
	2='Catholic'
	3='Jewish'
	4='none'
	5='other';
run;

data depression;
infile '/folders/myfolders/Project Data Sets/DepressionData0.dat';
input ID Gender Age Marital Education Employment Income Religion
	Statement1-Statement20
	Drink Health RegDoctor Treat BedDays AcuteIll ChronicIll;
format Employment employmentfmt. Religion religionfmt.
run;

/*use proc freq to check for invalid data*/
proc freq data=depression;
table Employment Religion/nocum;
run;

/*use proc print to identify which obs are invalid*/
proc print data=depression;
where religion = 6;
ID ID;
var religion;
run;

/*use if/then statements to clean data*/
data depression2;
set work.depression;
if religion=6 then delete;
run;

/*confirm cleaned data with proc freq*/
proc freq data=depression2;
table religion;
run;

