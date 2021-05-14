/*Import data*/ 
data hw2; 
set "/folders/myfolders/Multilevel and Longitudinal Data Analysis/DataForHW2.sas7bdat"; 
run; 

/* Check categorical variables */
proc freq data=hw2;  
tables  ChildGender Meducation ChildRace FamilyStructure 
		HouseIncome Phealth Region Urban schooltype;  
run;  

/* Manage Variables */
data bmidata;  
set hw2;  
	if 	meducation in('1=<high school','2=high school') then  
		meducation = '1=<college';  
	else 	meducation = '2=college';  
	if 	childrace = '5=white' then  
		childrace = '2=white';  
	else 	childrace = '1=other';  
	if 	houseincome in('5:50000-75000','6:75000-100000','7:>100000') then houseincome = '2=high-income';  
	else 	houseincome = '1=middle/low-income';	  
	if 	phealth = '3=Very good/excellen' then  
		phealth = '2=excellent';  
	else 	phealth = '1=<excellent';  
run; 

/* Re-check categorical variables */
proc freq data=bmidata;  
tables  ChildGender Meducation ChildRace FamilyStructure 
		HouseIncome Phealth Region Urban schooltype;  
run;  

*model 1 - random intercept only;  
proc mixed data = bmidata noclprint method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);   
  class school_ID;  
  model bmipct = / solution ddfm = bw;  
  random intercept / subject = school_ID type = UN;   
run;  

*model 2 - familystructure;  
proc mixed data = bmidata noclprint method=ml covtest noitprint PLOTS (MAXPOINTS=1000000);  
  class school_ID familystructure;  
  model bmipct = familystructure / solution ddfm = bw;  
  random intercept / subject = school_ID type = UN;   
run;  

data pvalue;  
  df = 1;   
  chisq = 151836.3 - 151827.6;  
  pvalue = 1 - probchi(chisq, df);  
run; 

proc print data=pvalue noobs;
run;

*model 3 - childrace;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000); 
  class school_ID familystructure childrace;
  model bmipct = familystructure childrace/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 3 to 2;
data pvalue;
  df = 1; 
  chisq = 151836.3 - 151809.7;
  pvalue = 1 - probchi(chisq, df);
run;
*significant;

*model 4 - houseincome;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000); 
  class school_ID familystructure childrace houseincome;
  model bmipct = familystructure childrace houseincome/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 4 to 3;
data pvalue;
  df = 1; 
  chisq = 151809.7 - 151797.0;
  pvalue = 1 - probchi(chisq, df);
run;
*significant;

*model 5 - remove familystructure;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);
  class school_ID childrace houseincome;
  model bmipct = childrace houseincome/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 5 to 4;
data pvalue;
  df = 1; 
  chisq = 151797.0 - 151798.6;
  pvalue = 1 - probchi(chisq, df);
run;
*not significant;


*model 6 - phealth;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000); 
  class school_ID childrace houseincome phealth;
  model bmipct = childrace houseincome phealth/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 6 to 5;
data pvalue;
  df = 1; 
  chisq = 151798.6 - 151786.7	;
  pvalue = 1 - probchi(chisq, df);
run;
*significant;

*model 7 - meducation;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);
  class school_ID childrace houseincome phealth meducation;
  model bmipct = childrace houseincome phealth meducation/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 7 to 6;
data pvalue;
  df = 1; 
  chisq = 151786.7	- 151782.3;
  pvalue = 1 - probchi(chisq, df);
run;
*significant;

*model 8 - tv;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);
  class school_ID childrace houseincome phealth meducation;
  model bmipct = childrace houseincome phealth meducation tv / solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 8 to 7;
data pvalue;
  df = 1; 
  chisq = 151782.3	- 149832.9;
  pvalue = 1 - probchi(chisq, df);
run;
*result: significant;

*model 9 - exercisefreetime;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000); 
  class school_ID childrace houseincome phealth meducation;
  model bmipct = childrace houseincome phealth meducation tv exercisefreetime/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;
*not significant, go with simpler model;


/* step 3: add level-2 variables
no slope variances for level-1 variables */

*model 10 - urban;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000); 
  class school_ID childrace houseincome phealth meducation urban;
  model bmipct = childrace houseincome phealth meducation tv urban/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 10 to 8;
data pvalue;
  df = 1; 
  chisq = 149832.9 - 149827.2;
  pvalue = 1 - probchi(chisq, df);
run;
*significant;

*model 11 - schooltype;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);
  class school_ID childrace houseincome phealth meducation urban schooltype;
  model bmipct = childrace houseincome phealth meducation tv urban schooltype/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;
*not significant, go with simpler model;

*model 12 - region;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);
  class school_ID childrace houseincome phealth meducation urban region;
  model bmipct = childrace houseincome phealth tv urban region/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 12 to 10;
data pvalue;
  df = 1; 
  chisq = 149827.2 - 149793.8;
  pvalue = 1 - probchi(chisq, df);
run;
*significant;

*model 13 - pctminority;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);
  class school_ID childrace houseincome phealth meducation urban region;
  model bmipct = childrace houseincome phealth meducation tv urban region pctminority/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 13 to 12;
data pvalue;
  df = 1; 
  chisq = 149793.8 - 146124.2;
  pvalue = 1 - probchi(chisq, df);
run;
* significant;

*model 14 - remove childrace;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);
  class school_ID houseincome phealth meducation urban region;
  model bmipct = houseincome phealth meducation tv urban region pctminority/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 14 to 13;
data pvalue;
  df = 1; 
  chisq = 146124.2 - 146126.4;
  pvalue = 1 - probchi(chisq, df);
run;
*not significant, go with simpler model;

*model 15 - remove meducation;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);
  class school_ID houseincome phealth urban region;
  model bmipct = houseincome phealth tv urban region pctminority/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;

*test model 15 to 14;
data pvalue;
  df = 1; 
  chisq = 146126.4 - 146129.5;
  pvalue = 1 - probchi(chisq, df);
run;
*not significant, go with simpler model;

*model 16 - pctfreelunch;
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000); 
  class school_ID houseincome phealth urban region;
  model bmipct = houseincome phealth tv urban region pctminority pctfreelunch/ solution ddfm = bw;
  random intercept / subject = school_ID type = UN;
run;
*not significant;


/* step 4: add slope variances for level-1 variables */

*change categorical level-1 variables into numeric variables;
data bmidata1;
	set bmidata;
	if 		houseincome = '2=high-income' then
			houseincome = '2';
	else 	houseincome = '1';	
	
	if 		phealth = '2=excellent' then
			phealth = '2';
	else 	phealth = '1';
run;
data bmidata2;
	set bmidata1;
	houseincome1 = input(houseincome, 1.);
	drop houseincome;
	rename houseincome1=houseincome;
	
	phealth1 = input(phealth, 1.);
	drop phealth;
	rename phealth1=phealth;
run;

*model 17 - houseincome slope variant;
proc mixed data = bmidata2 noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000); 
  class school_ID phealth urban region;
  model bmipct = houseincome phealth tv urban region pctminority / solution ddfm = bw;
  random intercept houseincome/ subject = school_ID type = UN;
run;
*not significant;

*model 18 - phealth slope variant;
proc mixed data = bmidata2 noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);
  class school_ID houseincome urban region;
  model bmipct = houseincome phealth tv urban region pctminority / solution ddfm = bw;
  random intercept phealth/ subject = school_ID type = UN;
run;
*not significant;

*model 19 - tv slope variant;
proc mixed data = bmidata2 noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000);
  class school_ID houseincome phealth urban region;
  model bmipct = houseincome phealth tv urban region pctminority / solution ddfm = bw;
  random intercept tv/ subject = school_ID type = UN;
run;
*not significant;

/* step 5: interaction terms between level-2 variables and level-1 variables with varying slope */

*no need, no level-1 variables have a varying slope;

/* Best fitting model to the data: Model 15 */
proc mixed data = bmidata noclprint  method=ml covtest noitprint PLOTS(MAXPOINTS=1000000); 
  class school_ID houseincome phealth urban region; 
  model bmipct = houseincome phealth tv urban region pctminority/ solution ddfm = bw; 
  random intercept / subject = school_ID type = UN; 
run; 
