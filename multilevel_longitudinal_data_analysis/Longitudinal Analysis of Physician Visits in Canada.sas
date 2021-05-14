/* Final Project */

data final;  
	set "/folders/myfolders/Multilevel and Longitudinal Data Analysis/FinalProjectData_bst5220.sas7bdat";   
run; 
 
*histogram;
proc univariate data = final noprint;  
	histogram visit/normal cfill=ltgray barlabel=percent; 
	inset N='N of visits within a year' Median Mean STD='Standard Deviation'
		/position =ne;
run; 

*Step 1 : Intercept-only model; 
proc glimmix data=final noitprint noclprint; 
	class ID family_ID; 
	model visit = / solution dist = poisson link = log; 
	random int / subject=family_ID type=UN; 
	random int / subject=ID(family_ID) type=UN; 
	covtest / wald; 
run; 
*highest level not sig;

*Step 1 : Intercept only model (remove highest level); 
proc glimmix data=final noitprint noclprint; 
	class ID family_ID; 
	model visit = / solution dist = poisson link = log; 
	random int / subject=ID(family_ID) type=UN; 
	covtest / wald; 
run; 
*overdispersion, needs scale parameter;

*Step 1: Add a scale parameter to intercept-only model; 
proc glimmix data=final noitprint noclprint; 
	class ID family_ID; 
	model visit = / solution dist = poisson link = log; 
	random int / subject=ID(family_ID) type=UN; 
	random _residual_ /subject=ID(family_ID); 
	covtest / wald;
run; 

*Step 2: Adding level-1 variable (year); 
proc glimmix data=final noitprint noclprint; 
	class ID family_ID; 
	model visit = year / solution dist = poisson link = log; 
	random int / subject=ID(family_ID) type=UN; 
	random _residual_ /subject=ID(family_ID); 
	estimate 'year' year 1 /exp cl; 
	covtest / wald; 
run; 

*Step 3 : Add Random  Slope Of Level-1 Variable; 
proc glimmix data=final noitprint noclprint; 
	class ID family_ID; 
	model visit = year / solution dist = poisson link = log; 
	random int year / subject=ID(family_ID) type=UN; 
	random _residual_ /subject=ID(family_ID); 
	estimate 'year' year 1 /exp cl; 
	covtest / wald; 
run; 


*Step 4 : Adding Level-2 Variable (gender, chronic, education, age_base ); 
proc glimmix data=final noitprint noclprint; 
	class ID family_ID gender (ref=first) education (ref=first) ; 
	model visit = year gender chronic education age_base / solution dist = poisson link = log; 
	random int / subject=ID(family_ID) type=UN; 
	random _residual_ /subject=ID(family_ID); 
	estimate 'year' year 1 /exp cl; 
	estimate 'F vs M' gender 1 -1 /exp cl; 
	estimate 'chronic' chronic 1 /exp cl; 
	estimate 'high school vs less than high school' education 1 0 0 -1 /exp cl; 
	estimate 'university graduate vs less than high school' education 0 1 0 -1 /exp cl; 
	estimate 'post graduate vs less than high school' education 0 0 1 -1 /exp cl; 
	estimate 'age_base' age_base 1 /exp cl; 
	covtest / wald; 
run; 