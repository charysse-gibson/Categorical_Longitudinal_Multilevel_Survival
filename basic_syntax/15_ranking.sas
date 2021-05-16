/* RANKING DATA */
	*Can by used for descriptive or nonparametric stats;
	
/* General Format */
PROC RANK  DATA=SAS_data_set_name          
		   OUT=NEW_SAS_data_set_name;
    VAR <vars to be used for ranking the data set>;
    RANKS <names of variables to store the ranks>;
    BY <specifies grouping variable where ranking is 
           performed separately within groups>;
RUN;

*NOTES on PROC RANK:
- requires numeric variables to rank
- ranks the data in ASCENDING order
- to rank the data from highest to lowest, use DESCENDING in the PROC RANK statement;
		Proc RANK data=bloodprssr DESCENDING;
* missing observations have the lowest rank (1) assigned.  
- if two observations have the same value, an average rank value is assigned to both;

/* Examples */
proc sort data=bst5030.lipid 
		  out=lipid_sort;
	by gender;
run;
proc rank data=lipid_sort 
		  out=lipid_rank;
	var hdl;
	ranks hdl_rank;
	by gender;
run;
proc sort data=lipid_rank;
	by gender hdl_rank;
run;
proc print data=lipid_rank(obs=10);
	var name gender hdl hdl_rank;
run;