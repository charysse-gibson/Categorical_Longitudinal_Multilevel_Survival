/* GEE Models */
* Also called:
population average model or 
marginal model;

data one;
set "/folders/myfolders/Multilevel and Longitudinal Data Analysis/school.sas7bdat"; 
run;

/* GEE using Exchangeable Correlation Structure */
proc genmod data = one; 
  class school;
  model mathach = ses female sector minority /
        type3 dist=normal;
  repeated subject = school/type=exch corrw ;
run; 

/* GEE using Auto Regression Correlation Structure */
proc genmod data = one; 
  class school;
  model mathach = ses female sector minority /
        type3 dist=normal;
  repeated subject = school/type=ar(1) corrw;
run; 

*Compare models using Quasi Information Citerion (QIC);
*smaller is better;

/* GEE using TOEP Correlation Structure */
proc genmod data = one; 
  class school;
  model mathach = ses female sector minority /type3 dist=normal;
  repeated subject = school/type=toep corrw;
run;  

/* Mixed Model */
proc mixed data = one noclprint covtest noitprint method=ml; 
  class school  ;
  model mathach = ses female sector minority/solution ddfm=bw;
  random intercept/subject = school type=UN;
run; 

/* Tradional Linear Regression Model */
/* Conventional Single-Level Analysis */
proc glm data=one;
 model mathach = ses female sector minority/solution;
run;


/* GEE  model using exchangeable correlation for Homework1  */
data a1;
set "/folders/myfolders/Multilevel and Longitudinal Data Analysis/hospital.sas7bdat"; 
run;

proc genmod data = a1; 
  class hospital;
  model stress = experience /type3 dist=normal;
  repeated subject = hospital/type=exch corrw;
run;  

/* Mixed  model using random intercept and slope*/
proc mixed data = a1 noclprint covtest noitprint method=ml;
  class hospital;
  model stress= experience / solution ddfm = bw;
  random intercept experience / subject = hospital type = UN;
run;
/* Log Notes: 
 NOTE: Estimated G matrix is not positive definite.
 NOTE: PROCEDURE MIXED used (Total process time):
       real time           0.30 seconds
       cpu time            0.29 seconds  */