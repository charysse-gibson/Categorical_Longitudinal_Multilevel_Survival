/* Homework 5 */

data one; 
	set "/folders/myfolders/Multilevel and Longitudinal Data Analysis/hw5p1_data.sas7bdat";  
	logGSI=log2(GSI + 1/53); 
run;

*Model 1: random intercept only; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID; 
  model logGSI = / solution ddfm=bw; 
  random intercept/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: significant; 
*-2LL: 7281.8; 

/* level-1 variables (time-dependent): True_month, Season, Parent_died, Parent_drug_status, Parent_alcohol, and Parent_marijuana */ 
*Model 2: true_month; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID; 
  model logGSI = true_month/ solution ddfm=bw; 
  random intercept/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: not significant; 
*-2LL: 7281.8; 

*compare model 2 to model 1; 
data pvalue; 
df = 1;  
chisq = 7281.8-7281.8; 
pvalue = 1 - probchi(chisq, df); 
run; 
proc print data=pvalue;   
run;  
*not significantly different; 
*keep true_month anyway since it is the longitudinal measure; 

*Model 3: season; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season; 
  model logGSI = true_month season/ solution ddfm=bw; 
  random intercept/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: some significant; 
*-2LL: 7272.2; 

*compare model 3 to model 2; 
data pvalue; 
df = 1;  
chisq = 7281.8-7272.2; 
pvalue = 1 - probchi(chisq, df); 
run; 
proc print data=pvalue;   
run;  
*significantly different; 
*keep season; 

*Model 4: parent_died; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died; 
  model logGSI = true_month season parent_died/ solution ddfm=bw; 
  random intercept/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: significant; 
*-2LL: 7265.8; 

*compare model 4 to model 3; 
data pvalue; 
df = 1;  
chisq = 7272.2-7265.8; 
pvalue = 1 - probchi(chisq, df); 
run; 
proc print data=pvalue;   
run;  
*significantly different; 
*keep parent_died; 

*Model 5: Parent_drug_status; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status; 
  model logGSI = true_month season parent_died Parent_drug_status/ solution ddfm=bw; 
  random intercept/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: some significant; 
*-2LL: 7259.1; 

*compare model 5 to model 4; 
data pvalue; 
df = 1;  
chisq = 7265.8-7259.1; 
pvalue = 1 - probchi(chisq, df); 
run; 
proc print data=pvalue;   
run;  
*significantly different; 
*keep Parent_drug_status; 

*Model 6: Parent_alcohol; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status Parent_alcohol; 
  model logGSI = true_month season parent_died Parent_drug_status Parent_alcohol/ solution ddfm=bw; 
  random intercept/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: not significant; 
*-2LL: 7255.7; 

*compare model 6 to model 5; 
data pvalue; 
df = 1;  
chisq = 7259.1-7255.7; 
pvalue = 1 - probchi(chisq, df); 
run; 
proc print data=pvalue;   
run;  
*not significantly different; 
*don't keep Parent_alcohol; 

*Model 7: Parent_marijuana; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status Parent_marijuana; 
  model logGSI = true_month season parent_died Parent_drug_status Parent_marijuana/ solution ddfm=bw; 
  random intercept/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: not significant; 
*-2LL: 7259.1; 

*compare model 7 to model 5; 
data pvalue; 
df = 1;  
chisq = 7259.1-7259.1; 
pvalue = 1 - probchi(chisq, df); 
run; 
proc print data=pvalue;   
run; 
*not significantly different; 
*don't keep Parent_marijuana; 


/* Test random slope of significant level-1 variables: 
true_month, season, parent_died, Parent_drug_status */ 

*Model 8: true_month random slope; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status; 
  model logGSI = true_month season parent_died Parent_drug_status/ solution ddfm=bw; 
  random intercept true_month/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: UN(2,2) significant; 
*-2LL: 7219.1; 

*compare model 8 to model 5; 
data pvalue; 
df = 2;  
chisq = 7259.1-7219.4; 
pvalue = 1 - probchi(chisq, df); 
run; 
proc print data=pvalue;   
run;  
*significantly different; 
*keep true_month random slope; 

*Model 9: season random slope; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status; 
  model logGSI = true_month season parent_died Parent_drug_status/ solution ddfm=bw; 
  random intercept season/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: some covariance parameters significant; 
*-2LL: 7244.7; 
 
*compare model 9 to model 5; 
data pvalue; 
df = 11-4;  
chisq = 7259.1-7244.7; 
pvalue = 1 - probchi(chisq, df); 
run; 
proc print data=pvalue;   
run;  
*significantly different; 
*keep season random slope; 

*Model 10: parent_died random slope; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status; 
  model logGSI = true_month season parent_died Parent_drug_status/ solution ddfm=bw; 
  random intercept parent_died/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: covariance parameters not significant; 
*-2LL: 7258.1; 

*compare model 10 to model 5; 
data pvalue; 
df = 7-4;  
chisq = 7259.1-7258.1; 
pvalue = 1 - probchi(chisq, df); 
run; 
*Results: not significant; 
*Keep parent_died random slope in model; 

*Model 11: Parent_drug_status random slope; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status; 
  model logGSI = true_month season parent_died Parent_drug_status/ solution ddfm=bw; 
  random intercept Parent_drug_status/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: covariance parameters not significant; 
*-2LL: 7256.2; 

*compare model 11 to model 5; 
data pvalue; 
df = 11-4;  
chisq = 7259.1-7256.2; 
pvalue = 1 - probchi(chisq, df); 
run; 
*Result: not significant; 
*Keep Parent_drug_status fixed slope in model; 

 
/* Test random slope of significant level-1 variables together: true_month, season */ 
*Model 12: true_month & season random slopes; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status; 
  model logGSI = true_month season parent_died Parent_drug_status/ solution ddfm=bw; 
  random intercept true_month season/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: too many covariance parameters; 
*-2LL: cannot calculate, cannot compare to other models; 
*model 8 is our best model based on -2LL; 


/* Test level-2 variables: Treatment, Gender, Hispanic, Parent_base_age, Parent_gender, Parent_diagnosis */ 

*Model 13: Treatment; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status treatment(ref='0'); 
  model logGSI = true_month season parent_died Parent_drug_status treatment/ solution ddfm=bw; 
  random intercept true_month/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: not significant; 
*-2LL: 7219.4; 
 
*compare model 13 to model 8; 
data pvalue; 
df = 1;  
chisq = 7219.4-7219.4; 
pvalue = 1 - probchi(chisq, df); 
run; 
*Result: not significant; 
*Keep treatment in model (important to study question); 

*Model 14: gender; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status treatment(ref='0') gender; 
  model logGSI = true_month season parent_died Parent_drug_status treatment gender/ solution ddfm=bw; 
  random intercept true_month/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: significant; 
*-2LL: 7209.3; 

*compare model 14 to model 13; 
data pvalue; 
df = 1;  
chisq = 7219.4-7209.3; 
pvalue = 1 - probchi(chisq, df); 
run; 
*Result: significant; 
*Keep gender in model; 

*Model 15: Hispanic; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status treatment(ref='0') gender Hispanic; 
  model logGSI = true_month season parent_died Parent_drug_status treatment gender Hispanic/ solution ddfm=bw; 
  random intercept true_month/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: not significant; 
*-2LL: 7209.0; 
 
*compare model 15 to model 14; 
data pvalue; 
df = 1;  
chisq = 7209.3-7209.0; 
pvalue = 1 - probchi(chisq, df); 
run;
*Result: not significant; 
*Do not keep hispanic in model; 

*Model 16: Parent_base_age; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status treatment(ref='0') gender; 
  model logGSI = true_month season parent_died Parent_drug_status treatment gender Parent_base_age/ solution ddfm=bw; 
  random intercept true_month/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: not significant; 
*-2LL: 7207.0; 

*compare model 16 to model 14; 
data pvalue; 
df = 1;  
chisq = 7209.3-7207.0; 
pvalue = 1 - probchi(chisq, df); 
run; 
*Result: not significant; 
*Do not keep parent_base_age in model; 

*Model 17: Parent_gender; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status treatment(ref='0') gender Parent_gender; 
  model logGSI = true_month season parent_died Parent_drug_status treatment gender Parent_gender/ solution ddfm=bw; 
  random intercept true_month/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: not significant; 
*-2LL: 7206.9; 

*compare model 17 to model 14; 
data pvalue; 
df = 1;  
chisq = 7209.3-7206.9; 
pvalue = 1 - probchi(chisq, df); 
run; 
*Result: not significant; 
*Do not keep parent_gender in model;  

*Model 18: parent_diagnosis; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status treatment(ref='0') gender Parent_diagnosis; 
  model logGSI = true_month season parent_died Parent_drug_status treatment gender Parent_diagnosis/ solution ddfm=bw; 
  random intercept true_month/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: some significant; 
*-2LL: 7203.2; 
 
*compare model 18 to model 14; 
data pvalue; 
df = 2;  
chisq = 7209.3-7203.2; 
pvalue = 1 - probchi(chisq, df); 
run; 
*Result: significant; 
*Keep parent_diagnosis in model; 

/* Test interactions between level-1 variable with random slope (true_month) and level-2 variables */

*Model 19: true_month*treatment; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status treatment(ref='0') gender Parent_diagnosis; 
  model logGSI = true_month|treatment season parent_died Parent_drug_status gender Parent_diagnosis/ solution ddfm=bw; 
  random intercept true_month/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: not significant; 
*-2LL: 7200.4; 

*compare model 19 to model 18; 
data pvalue; 
df = 1;  
chisq = 7203.2-7200.4; 
pvalue = 1 - probchi(chisq, df); 
run; 
*Result: not significant; 
*Do not keep interaction; 
 
*Model 20: true_month*gender; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status treatment(ref='0') gender Parent_diagnosis; 
  model logGSI = true_month|gender season parent_died Parent_drug_status treatment Parent_diagnosis/ solution ddfm=bw; 
  random intercept true_month/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: not significant; 
*-2LL: 7203.2; 
 
*compare model 20 to model 18; 
data pvalue; 
df = 1;  
chisq = 7203.2-7203.2; 
pvalue = 1 - probchi(chisq, df); 
run; 
*Result: not significant; 
*Do not keep interaction in model; 

*Model 21: true_month*Parent_diagnosis; 
proc mixed data=one noclprint method=ml covtest noitprint; 
  class ID season parent_died Parent_drug_status treatment(ref='0') gender Parent_diagnosis; 
  model logGSI = true_month|Parent_diagnosis season parent_died Parent_drug_status treatment gender/ solution ddfm=bw; 
  random intercept true_month/subject=ID type=un; 
  repeated/subject=ID;  
run; 
*Result: some significant; 
*-2LL: 7195.9; 
 
*compare model 21 to model 18; 
data pvalue; 
df = 1;  
chisq = 7203.2-7195.9; 
pvalue = 1 - probchi(chisq, df); 
run; 
*Result: significant; 
*Keep interaction in model;  
