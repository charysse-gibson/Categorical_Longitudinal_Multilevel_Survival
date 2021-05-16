/* ANOVA */
libname PJS '/folders/myfolders/Project Data Sets';

*Is there a statistically significant difference between alcohol groups for cholesterol loss?;
proc anova data=pjs.lipid_ext;
	class alcohol;
	model cholesterolloss=alcohol;
run;

/* TTest */
*How would you copare the means of baseline cholesterol between people 
who are at the median age and younger vs older than the median age?;
proc means data=pjs.lipid_ext median;
	var age;
run;
data project;
	set pjs.lipid_ext;
	if age <= 23 then
		split='low';
	else if age > 23 then		
		split='high';
run;
proc ttest data=project;
	class split;
	var cholesterol;
run;

*How would you divide age into tertiles, and test the 
relationship between these categories and baseline cholesterol?;
proc rank data=project out=project1 groups=3;
	var age;
	ranks rank1;
run;
proc anova data=project1;
	class rank1;
	model cholesterol=rank1;
run;

