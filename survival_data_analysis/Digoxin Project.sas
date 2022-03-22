libname survival '/folders/myfolders/Survival Data Analysis/Project';
 
data dig;
	set survival.dig;
	label FUNCTCLS_BI='0=No limitation, 1=Limitation';
	if functcls=1 then functcls_bi=0;
	else if functcls=2 or functcls=3 or functcls=4 then functcls_bi=1;
	* dichotomous functional class into two categories, 0=no limitation of physical activity,
	  1=certain degrees limitation of physical activity;
run;
 
*conglomerate outcome of CVD hospitalization;
proc surveyfreq data=dig;
	tables CVD*trtmt*functcls_bi*race / nopct;
run;
 
*tests for significance of confounders and treatment;
proc phreg data=dig;
	model CVDDAYS*CVD(0)= TRTMT;
run;
proc phreg data=dig;
	model CVDDAYS*CVD(0)= FUNCTCLS_bi;
run;
proc phreg data=dig;
	model CVDDAYS*CVD(0)= RACE;
run;

*test for significance of variables all in model together;
proc phreg data=dig;
	model CVDDAYS*CVD(0)= FUNCTCLS_bi RACE TRTMT / rl;
run;

*descriptive stats;
proc freq data=dig;
	tables TRTMT CVD RACE FUNCTCLS_bi;
run;
proc means data=dig;
	var CVDDAYS;
run;

*log-rank test;
proc sort data=dig;
	by TRTMT;
proc lifetest data=dig plots=s(test atrisk);
	time CVDDAYS*CVD(0);
	strata TRTMT;
run;
 
*Initial Cox Model;
proc phreg data=dig;
	model CVDDAYS*CVD(0)= FUNCTCLS_bi RACE TRTMT/rl ties=efron;
run;
 
*lls plot for treatment;
ODS EXCLUDE ProductLimitEstimates;/** Surpress	life test table **/
proc lifetest data=dig plots=lls;
	time CVDDAYS*CVD(0);
	strata TRTMT;
	title 'log-log survival plots for treatment';
run; 

/* Schoenfeld residuals */
 
*step 1 - get residuals;
proc phreg data=dig;
	model CVDDAYS*CVD(0) = FUNCTCLS_bi RACE/ties=efron;
	output out=sch ressch = sch_FUNCTCLS_bi sch_RACE;
	title 'Schoenfeld residuals for FUNCTCLS_BI RACE';
run;
*step 2 - log transform time;
data schoenfeld;
	set sch;
	if CVD=1;
	Ldays=log(CVDDAYS);
	days2=CVDDAYS**2;
run;
*rank events based on log time;
proc rank data=schoenfeld out=ranked1 ties=mean;
	Var ldays;
	Ranks ldaysrank;
run;
proc sort data=ranked1;
	by ldaysrank;
run;
 
*step 3 - correlate residuals to ranked log time & test;
proc corr data=ranked1 nosimple;
	var sch_FUNCTCLS_bi sch_RACE;
	with ldaysrank;
run; *FUNCTCLS is correlated with time, not RACE
 
*step 4: Graph Schoenfeld residuals against survival time;
proc sgplot data=ranked1;
 loess x=Ldaysrank y=sch_FUNCTCLS_bi/ clm LINEATTRS=(COLOR=Black) CLMATTRS=(CLMFILLATTRS=(COLOR=Yellow));
 title 'Schoenfeld residuals for FUNCTCLS_BI';
run; *FUNCTCLS is time-independent;

proc sgplot data=ranked1;
 loess x=Ldaysrank y=sch_RACE/ clm LINEATTRS=(COLOR=Black) CLMATTRS=(CLMFILLATTRS=(COLOR=Yellow));
 title 'Schoenfeld residuals for RACE';
run; *RACE is time-dependent;
 
*reconfirm results by checking significance of interaction terms with time;
proc phreg data=dig;
	model CVDDAYS*CVD(0)= FUNCTCLS_BI RACE t_FUNCTCLS_BI t_RACE/rl ties=efron;
	strata TRTMT;
	t_FUNCTCLS_bi = FUNCTCLS_bi*CVDDAYS;
	t_RACE = RACE*CVDDAYS;
	title 'Schoenfeld residuals for FUNCTCLS_BI RACE';
run; *FUNCTCLS_BI varies with time, not RACE;
 
*Final Cox Model;
proc phreg data=dig;
	model CVDDAYS*CVD(0)= FUNCTCLS_bi RACE TRTMT t_TRTMT t_FUNCTCLS_bi/rl ties=efron;
t_FUNCTCLS_bi = FUNCTCLS_bi*CVDDAYS;
t_TRTMT = TRTMT*CVDDAYS;
day_1_TRTMT: test TRTMT+1*T_TRTMT;
day_800_TRTMT: test TRTMT+800*T_TRTMT;
day_1_FUNCTCLS: test TRTMT+1*t_FUNCTCLS_bi;
day_800_FUNCTCLS: test TRTMT+800*t_FUNCTCLS_bi;
run;
