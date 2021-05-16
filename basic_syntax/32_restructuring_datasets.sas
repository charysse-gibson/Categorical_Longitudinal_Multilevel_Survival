/* RESTRUCTURING DATASETS */

/* Concatenating SAS Datasets (Merging) */
DATA SAS-data-set ;
    SET SAS-data-set1 SAS-data-set2 . . . ;
	<additional SAS statements>
	RUN;

/* examples */
data work.qtr1;
	set work.jan work.feb work.mar;
run;

data newdx;
   set ra1 ra2;
run;

/* class example */
data ra1;
	input ID time $ Diagnos $;
datalines;
1087 Q1 RA
1324 Q1 RA
1789 Q1 RA
;
run;

data ra2;
	input ID time $ Diagnos $;
datalines;
1521 Q2 RA
1859 Q2 RA
;
run;

data nexdx;
	set ra1 ra2;
run;

/* PROC APPEND */
PROC APPEND BASE=<libref.>SAS-data-set 	
	DATA=<libref.>SAS-data-set <options>;
RUN; 

Proc append base=ra1 data=ra2 force;
Run;

/* INTERLEAVING SAS DATASETS */
		*Interleaving SAS data sets simply concatenates SAS data sets so 
		that the observations in the resulting data set are in order;
		
DATA SAS-data-set;
	SET SAS-data-set1 SAS-data-set2 . . . ;
	BY BY-variable;
     	<other SAS statements>
RUN;

/* example */
data ra1;
	input ID time $ Diagnos $;
datalines;
1087 Q1 RA
1324 Q1 RA
1789 Q1 RA
;
run;

data ra2;
	input ID time $ Diagnos $;
datalines;
1521 Q2 RA
1859 Q2 RA
;
run;
data ordered_newdx;
   set ra1 ra2;
   by ID;
run;

*May need to rename variables before interleaving;
proc sort data=cases;
   by name;
run;
proc sort data=control;
   by name;
run;
data all;
   set cases control(rename=(Grp=Group));
   by Name;
run;

/* MERGING DATASETS */
*You can merge to calculate at the same time;
data total;
   merge demo drugs discharge outpat;
   by Month;
run;

data ia.compare;
	merge hosp.discharge hosp.drugs;
	by Month;
	Total = ProcCosts + MedCosts;
run;

*Special notes on merging;
- There is no limit to the number of data sets that can be merged
- Data sets that are going to be merged based on a key or subject id must first be sorted by that id
- You should always print out a portion of the merged data file, or access it via the SAS output data 
  tab to see if the number of cases/variables matches your expectation;

/* IN OPTION */
Data gercrew;
  Input EmpId $ 1-6 LastName $ 8-20;
Datalines;
E00632 STRAUSS
E01483 SCHELL-HAUNGS
E01996 WELLHAEUSSER
E04064 WASCHK
;
RUN;

Data gersched;
 Input  EmpId $ 1-6 FlightNum 8-12;
Datalines;
E00632 5250
E01996 5501
E04064 5105
;
RUN;

data nextweek;
   merge gercrew gersched;
   by EmpId;
run;

data nextweek;
   merge gercrew (in=InCrew)
         gersched(in=InSched);
   by EmpID;
   if Insched = 1;
run;
