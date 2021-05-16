/* FREQUENCY PROCEDURE */
	*For frequency tables;

/* FORMAT */
PROC FREQ DATA=SAS-data-set;
       TABLES SAS-variables < / options >;
RUN;

/* example */
proc freq data=IQ_AND_TEST_SCORES_SORTED; 
	table Group; 
run;

/* example2 */
data survey;
	input QUES1 $ 1
		  QUES2 $ 2
		  QUES3 $ 3
		  QUES4 $ 4
		  QUES5 $ 5;
datalines;
ABCDE
AACCE
BBBBB
CABDA
DDAAC
CABBB
EEBBB
ACACA
;
run;

*For table options;
proc freq data=survey;
	table QUES1-QUES5 / nocum;
run;

*OPTIONS:
/missing : displays the counts of missing values in a separate “missing value” cell of the table
/missprint : will display the counts of missing data for any of the cells corresponding to the requested table
NLEVLES (in proc freq statement) : displays number for levels for the variables included in the frequency counts;
proc freq data=bst5030.lipid_base nlevels;
  table Smoking;
  title "Distribution of Smoking Status";
run;

*Analyzing categories of values;
proc format;
   value $smokfmt 
         ‘no‘,‘quit'=‘Non-smoker'
         ‘cigar‘,‘pipes'=‘Current Smoker';
run;
proc freq data = bst5030.lipid_base;
   format smoking $smokfmt.;
   tables smoking;
run;

*Crosstabular Frequency Reports;
	*asterisk (*) operator in the TABLES statement is used to cross variables;
PROC FREQ DATA=SAS-data-set;
        TABLES variable1*variable2;
RUN;
	*add CROSSLIST option in TABLES statement to display crosstabs results in a listing form;
proc freq data=bst5030.lipid_base;
  table smoking*bmi / crosslist;
  format Smoking $smokfmt. bmi bmifmt.;
  title "Distribution of Smoking by BMI";
run; 


/* Group Presentation */

/* Analyze the agreement of Systolic and Diastolic Blood pressure */
libname project '/folders/myfolders/Project Data Sets';
run;
data project;
set project.lipid_ext;
LENGTH testS $ 25 testD $ 25; 
if SystolicBP lt 90 then testS='Hypotension';
Else if SystolicBP ge 90 and SystolicBP lt 120 then testS='Desirable';
else if SystolicBP ge 120 and SystolicBP lt 140 then testS='Prehypertension';
else if SystolicBP ge 140 and SystolicBP lt 160 then testS='Stage 1 Hypertension';
else if SystolicBP ge 160 and SystolicBP lt 180 then testS='Stage 2 Hypertension';
else if SystolicBP ge 180 then testS='Hypertensive Crisis';
if DiastolicBP lt 60 then testD='Hypotension';
else if DiastolicBP ge 60 and DiastolicBP lt 80 then testD='Desirable';
else if DiastolicBP ge 80 and DiastolicBP lt 90 then testD='Prehypertension';
else if DiastolicBP ge 90 and DiastolicBP lt 100 then testD='Stage 1 Hypertension';
else if DiastolicBP ge 100 and DiastolicBP lt 110 then testD='Stage 2 Hypertension';
else if DiastolicBP ge 110 then testD='Hypertensive Crisis';
run;
proc freq data=project;
tables testS*testD/agree;
run;

data kappa;
LENGTH Systolic_standard $ 25 Diastolic_standard $ 25;
input Systolic_standard $ Diastolic_standard $ count;
datalines;
Desirable Desirable 14
Desirable Non_Desirable 4
Non_Desirable Desirable 47
Non_Desirable Non_Desirable 30
;
proc freq data=kappa order=data;
tables Systolic_standard*Diastolic_standard/agree;
test kappa;
weight count;
run;

/* To see if there is an association between gender and cholesterol loss */
data project;
set project.lipid_ext;
if CholesterolLoss le 0 then chll1=0;
Else if CholesterolLoss gt 0 then chll1=1;
label chll1='Cholesterol Loss';
run;
proc freq data=project order=data;
tables gender*chll1/relrisk;
run;

/* Predict the relationship between age and cholesterol level, when gender is stratified */
data project;
set project.lipid_ext;
if Cholesterol ge 200 then chl1=1;
Else if Cholesterol lt 200 then chl1=0;
if age ge 25 then age1=1;
else if age lt 25 then age1=0;
label chl1='Cholesterol level>=200'
      age1='Age>=25';
run;
proc freq data=project;
table gender*age1*chl1/all;
run;


*Cohen's Kappa Statistic - to evaluate the agreement of the diagnosis 
(a possible contribution to measurement error in the study)
	- Cohen's kappa coefficient is a statistic which measures inter-rater agreement 
	  for qualitative items. It is generally thought to be a more robust measure than
	  simple percent agreement calculation, as κ takes into account the possibility 
	  of the agreement occurring by chance.

McNemar’s test - to determine whether the row and column marginal 
frequencies are equal (that is, whether there is "marginal homogeneity")

Cochran–Mantel–Haenszel (CMH) statistics - to test the association 
between a binary predictor or treatment and a binary outcome such as case 
or control status while taking into account the stratification

Odds ratios & Relative risks - to measure the association between age 
and cholesterol further stritisfied by gender.

Chi-square test -  to determine whether there is a significant difference between 
the expected frequencies and the observed frequencies in one or more categories.;