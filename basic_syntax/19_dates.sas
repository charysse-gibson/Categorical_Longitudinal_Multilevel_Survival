/* DATES */
	*A SAS date value is interpreted as the number of 
	days between January 1, 1960, and a specific date.

Examples:

Raw Data Value	Informat	Converted Values
10/29/2001	    MMDDYY10.       15277
10/29/01	     MMDDYY8.       15277
29OCT2001	       DATE9.	    15277
29/10/2001	    DDMMYY10.	    15277
;

data timetrial;
  input 	@1 id 3.
  		@4 date mmddyy8.
		@12 trt $3.
		@15 score 3.
		@18 time 3.;
datalines;
43912/11/00LUX 20137
92112/11/00EFN 20131
11412/12/00LUX 15170
;
run;

/* TWO-DIGIT DATES with YEARCUTOFF */
	*Set 100 year span default to keep last digits from being confused;
OPTIONS YEARCUTOFF=1920;