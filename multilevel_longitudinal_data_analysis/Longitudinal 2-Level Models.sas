/* Introduction to 2-level models for longitudinal data */

data alcohol;
set "/folders/myfolders/Multilevel and Longitudinal Data Analysis/alcohol.sas7bdat"; 
run;

/* Step 1 for two-level longitudinal model */
proc mixed data=alcohol noclprint covtest noitprint method=ml; 
  class id;
  model alcuse = /solution ddfm=bw;
  random intercept /sub=id type=UN g v vcorr;
  repeated / subject = id r;
run;

/* Step 2 for model building for data */
*No random effects on the slopes of the explanatory variables;
proc mixed data = alcohol noclprint covtest noitprint method=ml; 
  class id;
  model alcuse = age /solution ddfm=bw;
  random int /sub=id type=un g v vcorr;
  repeated / subject = id r;
run;

/* Comparison of step 1 model and 2 model using Model Fit statistics    */
data pvalue;
  df =1; chisq = 670.2- 647.2;
  pvalue = 1 - probchi(chisq, df);run;
proc print data = pvalue noobs;run;

/* Step 3 for model building for data  */
/* Unconditional growth model */
*Random coefficient of the time variable without including any level-2 covariates;
proc mixed data=alcohol noclprint covtest noitprint method=ml; 
  class id;
  model alcuse = age /solution ddfm=bw;
  random  int age /sub=id type=UN g v vcorr;
  repeated / subject = id r;
run;
/* Comparison of step 2 model and step 3 model */
data pvalue;
  df =2; chisq = 647.2 - 636.6 ;
  pvalue = 1 - probchi(chisq, df);run;
proc print data = pvalue noobs;run;
* Centering variable;
data alcohol2; set alcohol; age_c=age-15; run;
proc mixed data=alcohol2 noclprint covtest noitprint method=ml; 
  class id;
  model alcuse = age_c  /solution ddfm=bw ;
  random  int age_c/sub = id type = UN g v vcorr;
  repeated / subject = id r;
run;

/* Step 4 for model building for data  */
* Adding level-2 (adolescent level) explanatory variables in the random intercept equation;
proc mixed data=alcohol2 noclprint covtest noitprint method=ml; 
  class id;
  model alcuse =age_c gender coa peer/solution ddfm=bw;
  random int age_c/sub=id type=UN g v vcorr;
  repeated / subject = id r; 
run;

/* Comparison of step 3 model and step 4 model */
data pvalue;
  df =3; chisq = 636.6-590.7;
  pvalue = 1 - probchi(chisq, df);run;
proc print data = pvalue noobs; run;

/* Step 5 for model building for data  */
* Adding cross-level interaction between level-1 Age_c and level-2 Gender;
proc mixed data=alcohol2 noclprint covtest noitprint method=ml; 
  class id;
  model alcuse = age_c  /solution ddfm=bw ;
  random  int age_c/sub = id type = UN g v vcorr;
  repeated / subject = id r;
run;

/* Comparison of step 4 model and step 5 model */
data pvalue;
  df =1; chisq = 590.7-585.1;
  pvalue = 1 - probchi(chisq, df);run;
proc print data = pvalue noobs;run;
*Assessing the interaction between age_c and COA;
proc mixed data=one noclprint covtest noitprint method=ml; 
  class id;
  model alcuse =age_c|coa gender peer/solution ddfm=bw;
  random int age_c/sub=id type=UN g v vcorr;
  repeated / subject = id r;
run;
*Assessing the interaction between age and peer;
proc mixed data=one noclprint covtest noitprint method=ml; 
  class id;
  model alcuse =age_c|peer coa gender /solution ddfm=bw;
  random int age_c/sub=id type=UN g v vcorr;
  repeated / subject = id r;
run;

/* Comparison of Mixed Model and Single-Level Model */
* Single-level model;
proc glm data=alcohol2; 
  model alcuse = age_c gender age_c*gender coa   
    peer/solution;
run;

/* GEE full model with an unstructured working correlation */
proc genmod data = one  ; 
  class ID ;
  model alcuse = age_c gender age_c*gender peer coa/type3 
    dist=normal;
  repeated subject = ID/type=un corrw ; 
run;


/* Latent Growth Model 1 */

* Gender not included;
data alcohol2; set alcohol; time=age-14; run;
proc mixed data= alcohol2 noclprint covtest noitprint method=ml; 
  class id;
  model alcuse = time /solution ddfm=bw  ;
  random intercept time/sub=id type=UN;
run;
* Gender included;
proc mixed data= alcohol2 noclprint covtest noitprint method=ml; 
  class id;
  model alcuse = time gender time*gender/solution ddfm=bw  ;
  random int time/sub=id type=UN;
run;


