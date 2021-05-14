/* Longitudinal Mixed Model Building */

data one;
	set "/folders/myfolders/Multilevel and Longitudinal Data Analysis/one.sas7bdat"; 
run;

*wide-form data to long-form;  
data epilepsy;   
	set one;  
	seizure=seizure1; week=0; output;  
	seizure=seizure2; week=2; output;  
	seizure=seizure3; week=4; output;  
	seizure=seizure4; week=6; output;  
	seizure=seizure5; week=8; output;  
	drop seizure1 seizure2 seizure3 seizure4 seizure5;   
run; 

*graph data;  
proc sgpanel data=epilepsy;  
  panelby ID /columns=4 rows= 2;   
  scatter y = seizure x = week;  
  reg y = seizure x = week;  
run; 

*Model 1: random-intercept only;  
proc mixed data=epilepsy noclprint covtest noitprint method=ml;   
  class id;  
  model seizure = /solution ddfm=bw;  
  random intercept /sub=id type=UN g v;  
  repeated / subject = id r;  
run;
*result: significant;  
*-2LL = 2489.0; 

*Model 2: level 1 variables, no random effects on slope;  
proc mixed data=epilepsy noclprint covtest noitprint method=ml;   
  class id;  
  model seizure = week /solution ddfm=bw;  
  random int /sub=id type=un g v;  
  repeated / subject = id;  
run;  
*result: signficant;  
*-2LL = 2406.3; 

*compare model 2 vs model 1;  
data pvalue;  
  df = 1;  
  chisq = 2489.0 - 2406.3;  
  pvalue = 1 - probchi(chisq, df);  
run;  
proc print data=pvalue;   
run;  
*result: significant; 

*Model 3: add random effect on slope on level 1 variables;  
proc mixed data=epilepsy noclprint covtest noitprint method=ml;   
  class id;  
  model seizure = week/solution ddfm=bw;  
  random intercept week /sub=id type=UN g v;  
  repeated / subject = id r;  
run;  
*result: covariances not significant, g-matrix is negative;  
*-2LL = 2347.7; 

*Model 4: add level-2 variable treatment;  
proc mixed data=epilepsy noclprint covtest noitprint method=ml;   
  class id;  
  model seizure = week treatment/solution ddfm=bw;  
  random intercept/sub=id type=UN g v;  
  repeated / subject = id r;  
run;  
*result: non-significant;  
*-2LL = 2406.3; 

*Model 5: add level-2 variable age;  
proc mixed data=epilepsy noclprint covtest noitprint method=ml;   
  class id;  
  model seizure = week age/solution ddfm=bw;  
  random intercept/sub=id type=UN g v;  
  repeated / subject = id r;  
run;  
*result: non-significant;  
*-2LL = 2405.4; 

*Model 6: add level-2 variable treatment interaction with time (week);  
proc mixed data=epilepsy noclprint covtest noitprint method=ml;   
  class id;  
  model seizure = week|treatment/solution ddfm=bw;  
  random intercept week/sub=id type=UN g v;  
  repeated / subject = id r; 
run;  
*result: non-significant;  
*-2LL = 2347.1; 

*Final Model: Model 2;
proc mixed data=epilepsy noclprint covtest noitprint method=ml;   
  class id;  
  model seizure = week /solution ddfm=bw;  
  random int /sub=id type=un g v;  
  repeated / subject = id;  
run;  


/* Working correlation matrix for GEE model */

*exchangeable;  
proc genmod data=epilepsy;   
  class ID;  
  model seizure = week/type3 dist=normal;  
  repeated subject = ID/type=exch corrw;   
run;  
*QIC=300.4427;  
*QICu=297;  

*AR(1);  
proc genmod data=epilepsy;   
  class ID;  
  model seizure = week/type3 dist=normal;  
  repeated subject = ID/type=ar(1) corrw;   
run;  
*QIC=301.5874;  
*QICu=297; 

*toep;  
proc genmod data=epilepsy;   
  class ID;  
  model seizure = week/type3 dist=normal;  
  repeated subject = ID/type=toep corrw;   
run;  
*QIC=306.9898;  
*QICu=297;  
*WARNING: GEE score statistic algorithm failed to converge for week;  

*unstructured;  
proc genmod data=epilepsy;   
  class ID;  
  model seizure = week/type3 dist=normal;  
  repeated subject = ID/type=un corrw;   
run; 
*QIC=299.6820;  
*QICu=297;  
*WARNING: GEE score statistic algorithm failed to converge for week; 
