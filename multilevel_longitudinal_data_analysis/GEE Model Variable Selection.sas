/* Homework3 GEE Model */

data raw;
set "/folders/myfolders/Multilevel and Longitudinal Data Analysis/DataForHW2.sas7bdat"; 
run;

* check categories;  
proc freq data=raw;  
	tables  ChildGender Meducation ChildRace FamilyStructure	  
			HouseIncome Phealth Region Urban schooltype;  
run;  

* categories collapsed;  
data bmidata;  
	set raw;  
	if 	meducation in('1=<high school','2=high school') then  
		meducation = '1=<college';  
	else 	meducation = '2=college';  
	if 	childrace = '5=white' then  
		childrace = '2=white';  
	else 	childrace = '1=other';  
	if 	houseincome in('5:50000-75000','6:75000-100000','7:>100000') then 		houseincome = '2=high-income';  
	else 	houseincome = '1=middle/low-income';	  
	if 	phealth = '3=Very good/excellen' then  
		phealth = '2=excellent';  
	else 	phealth = '1=<excellent';  
run; 

proc freq data=bmidata;  
	tables  ChildGender Meducation ChildRace FamilyStructure	  
			HouseIncome Phealth Region Urban schooltype;  
run;  

/* Exchangeable vs TOEP correlation structures */

*exchangeable correlation structure;  
proc genmod data = bmidata;   
  class school_ID familystructure childrace houseincome phealth meducation urban schooltype region;  
  model bmipct = familystructure childrace houseincome phealth meducation tv exercisefreetime  
  				 urban schooltype region pctminority pctfreelunch/type3 dist=normal;  
  repeated subject = school_ID/type=exch corrw;  
run;   

*TOEP correlation structure;  
proc genmod data = bmidata;   
  class school_ID familystructure childrace houseincome phealth meducation urban schooltype region;  
  model bmipct = familystructure childrace houseincome phealth meducation tv exercisefreetime  
  				 urban schooltype region pctminority pctfreelunch/type3 dist=normal;  
  repeated subject = school_ID/type=toep corrw;  
run;  

/* Exchangeable correlation structure vs Single-level analysis */

*exchangeable correlation structure;   
proc genmod data = bmi;   
  class school_ID familystructure childrace houseincome phealth meducation urban schooltype region;  
  model bmipct = familystructure childrace houseincome phealth meducation tv exercisefreetime  
  				urban schooltype region pctminority pctfreelunch/type3 dist=normal;  
  repeated subject = school_ID/type=exch corrw;  
run;  

*single-level analysis;  
proc glm data = bmi;  
  class school_ID familystructure childrace houseincome phealth meducation urban schooltype region;  
  model bmipct = familystructure childrace houseincome phealth meducation tv exercisefreetime  
  				urban schooltype region pctminority pctfreelunch/solution;  
run; 


/* Backward selection procedure */

*model 1 - all variables;  
proc genmod data = bmi;   
  class school_ID familystructure childrace houseincome phealth meducation urban schooltype region;  
  model bmipct = familystructure childrace houseincome phealth meducation tv exercisefreetime  
  				urban schooltype region pctminority pctfreelunch/type3 dist=normal;  
  repeated subject = school_ID/type=exch corrw;  
run;  
*QIC = 9989.1044;  
*QICu = 9983.0000;  

*model 2 - remove houseincome;  
proc genmod data = bmi;   
  class school_ID familystructure childrace phealth meducation urban schooltype region;  
  model bmipct = familystructure childrace phealth meducation tv exercisefreetime  
  				urban schooltype region pctminority pctfreelunch/type3 dist=normal;  
  repeated subject = school_ID/type=exch corrw;  
*QIC = 9987.9282;  
*QICu = 9982.0000;  

*model 3 - remove exercisefreetime;  
proc genmod data = bmi;   
  class school_ID familystructure childrace phealth meducation urban schooltype region;  
  model bmipct = familystructure childrace phealth meducation tv   
  				urban schooltype region pctminority pctfreelunch/type3 dist=normal;  
  repeated subject = school_ID/type=exch corrw;  
run; 
*QIC = 10021.9098;  
*QICu = 10016.0000;  
* don’t remove “exercisefreetime” as QIC &QICu values larger than model 2;  

*model 4 - remove meducation;  
proc genmod data = bmi;   
  class school_ID familystructure childrace phealth urban schooltype region;  
  model bmipct = familystructure childrace phealth tv exercisefreetime  
  				urban schooltype region pctminority pctfreelunch/type3 dist=normal;  
  repeated subject = school_ID/type=exch corrw; 
run; 
*QIC = 9986.8714;  
*QICu = 9981.0000; 

*model 5 - remove familystructure;  
proc genmod data = bmi;   
  class school_ID childrace phealth urban schooltype region;  
  model bmipct = childrace phealth tv exercisefreetime  
  				urban schooltype region pctminority pctfreelunch/type3 dist=normal;  
  repeated subject = school_ID/type=exch corrw; 
*QIC = 9985.6717;  
*QICu = 9980.0000;  
  

*model 6 - remove childrace;  
proc genmod data = bmi;   
  class school_ID phealth urban schooltype region;  
  model bmipct = phealth tv exercisefreetime  
  				urban schooltype region pctminority pctfreelunch/type3 dist=normal;  
  repeated subject = school_ID/type=exch corrw; 
run;
*QIC = 9984.7314;  
*QICu = 9979.0000; 

*model 7 - remove schooltype;  
proc genmod data = bmi;   
  class school_ID phealth urban region;  
  model bmipct = phealth tv exercisefreetime  
  				urban region pctminority pctfreelunch/type3 dist=normal;  
  repeated subject = school_ID/type=exch corrw;  
run;  
*QIC = 9983.1851;  
*QICu = 9978.0000;  

*model 8 - remove pctfreelunch;  
proc genmod data = bmi;   
  class school_ID phealth urban region;  
  model bmipct = phealth tv exercisefreetime  
  				urban region pctminority/type3 dist=normal;  
  repeated subject = school_ID/type=exch corrw;  
run;  
*QIC = 15308.3733;  
*QICu = 15303.0000;  
* don’t remove “exercisefreetime” as QIC &QICu values larger than model 7;
*model 7 is the best fit; 