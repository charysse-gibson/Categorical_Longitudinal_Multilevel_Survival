*SAS PROCEDURES

Proc Print – used for printing lines of a data set.  
	You can print entire files or portions of files.
;
		PROC PRINT DATA=drug NOOBS;
        VAR variable(s);
        run;

		proc print data=drug noobs (obs=10);
		run;
		
		proc print data=drug(firstobs=10 obs=20);
		run;

/*To enhance a list report even more, the following statements can be added to the PROC PRINT step:
	TITLE statement(s)
	FOOTNOTE statement(s)
	LABEL statement
	FORMAT statement.
	Other functions added to the report such as SUM or MEAN and then the variables desired
	  
	TITLEn 'text ';
	FOOTNOTEn 'text ';
	e.g.
		title1 ‘Study Subject';
		footnote2 ‘Confidential';
		label variable='new label'*/

proc print data=westernrates label;
 	var city state housing crime;
 	label housing="Housing Score" crime="Crime Score";
 	title1 'Western Cities and Their Scores';
 	title2 'Housing and Crime';
	footnote1 'Lower Scores are Better';
 run;

*
Proc Contents – used to confirm the descriptor portion of data set is correct 
	and that proper formats, variables have been added to a data set.

Proc Means – for computing means for continuous variables overall 
	and by categorical variables of interest
	
Proc Univariate – similar to proc means, but provides many more diagnostics 
	and tests of the distributions of variables (skew, etc)

Proc Ttest – Similar to Proc Means, but conducts both paired and independent t-tests

Proc Sort –used to sort data sets prior to processing in other procedures or data sets.  
	Can be used to create a new data set that has been sorted by key variables

Proc Freq – for computing counts and percents overall and by various categorical variables.
	Can also be used to conduct various chi-squared tests, compute odds ratios, and conduct McNemar’s test.

;
