/* Chi-Square Test */

*format;
Data chi;
chi = 1 - probchi(x2 value, df);
Put chi;
Run;
Proc Print data=chi; var chi;

*Example 1;
Data party;
    Input gender $ party $ count @@;
datalines;
female democrat 762 
female independent 327 
female republican 468
male   democrat 484 
male   independent 239 
male   republican 477
;;
proc freq; 
	weight count; 
	tables gender*party/chisq expected; run;

*Example 2;
Data smoke;
	Input gender $ smoking $ count;
Datalines;
female smoking 435 
female nonsmoking 147
male   smoking 375 
male   nonsmoking 134 
;;
proc freq; 
	weight count; 
	tables gender*smoking/ or chisq expected; 
run;

/* HOMEWORK */
Data Smoking_BirthWeight;
	input smoking $ birthweight $ count @@;

Datalines;
nonsmoking NBW 8526
nonsmoking LBW 1081
smoking NBW 1305
smoking LBW 249
;

proc freq order=data data=smoking_birthweight; 
	weight count;
	tables smoking*birthweight/or chisq expected;

run;