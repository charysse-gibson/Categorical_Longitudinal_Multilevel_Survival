/* SUBSETTING */

	*In a DATA step, you can subset the rows (observations) 
	 in a SAS data set with the following statements:
	 	(1) WHERE statement
	 	(2) DELETE statement
	 	(3) Subsetting IF statement;

libname project '/folders/myfolders/Project Data Sets';

data lipid;
  set project.lipid_ext;
  BMI = round((weight/(height**2))*703,.1);
  if BMI >= 25;
run;

proc print data=lipid (obs=10);
var name age gender weight height bmi;
run;

/* Subsetting by date example */
data icd9data;
  set bst5030.icd9data;
  if date_visit > '14dec2000'd;
run;

proc print data=icd9data;
  format date_visit Date9.;
run;

/* Using WHERE */
data icd9data;
  set bst5030.icd9data;
  by patient;
  where date_visit>'14dec2000'd;
  retain start_weight;
  if first.patient then start_weight=weight;
  weight_change = start_weight - weight;
  if weight_change > 0;
run;

proc print data=icd9data (obs=10);
  format date_visit date9.;
  var patient date_visit weight start_weight 
	weight_change;
run;

*NOTES:
- WHERE is more efficient, because it processes as the data is being read in
- Subsetting IF is processed as the data is being written to the new SAS dataset
- DELETE also processes as the data is being written;

/* CONTROLLING OBSERVATIONS */
	*Controlling Which observations are read;
data westrates;
  infile '/folders/myfolders/Data for Classes 3 to 6/westernrates.dat';
  input  city $ 				1-30 
		 state $ 				31-33 
		 HealthCareEnvironment 	45-49 
		 Crime 					50-54;
run;

data westrates2;
   set westrates (obs=23);
   if state eq 'CA' then output;
run;

data westrates3;
   set westrates(firstobs=11 obs=25);
   if state eq 'CA' then output;
run;

Proc Print data=westrates2;
run;

Proc Print data=westrates3;
run;

*Choosing observations within PROC PRINT statement;
proc print data=westrates3 (firstobs= 2 obs=4);
var city healthcareenvironment crime;
run;
