/* LOGISTIC REGRESSION */
	*For dicotomous outcome variables;

libname project '/folders/myfolders/Project Data Sets';

data lipid;
set project.lipid_ext;
	if HeartDisease = 'none' then HD = 0;
	else HD = 1;
run;

proc logistic data=lipid descending;
	class smoking alcohol;
	model HD = age exercise smoking alcohol;
run;

*use proc freq to see issue with categorical group (alcohol > 6) has empty value;

data lipid;
set project.lipid_ext;
	where alcohol ~= '> 6';
	if HeartDisease = 'none' then HD = 0;
	else HD = 1;
run;

proc logistic data=lipid descending;
	class smoking alcohol;
	model HD = age exercise smoking alcohol;
run;