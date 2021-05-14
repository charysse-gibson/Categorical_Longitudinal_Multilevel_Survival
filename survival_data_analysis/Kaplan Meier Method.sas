/* KAPLAN MEIER METHOD */
DATA AIDSCENR;
    INPUT agegrp id month death @@;
DATALINES;
1  1  2 1 1  2  3 0 1 3  6  1 1 4 6 1 1 5  7  1
1  6 10 0 1  7 15 1 1 8 15 1 1 9 16 1 1 10 27 1 
1 11 30 1 1 12 32  1  2 21 1 1 2 22 1 1  2 23 1 1   2 24 1 1  2 25 2 1  2 26 3 1  2  27  3 1  2 28 9 1  2 29  22 1
;
PROC LIFETEST PLOTS=s (ATRISK cl);
     TIME month*death(0);  where agegrp=1;
     TITLE 'K-M method for 12 patients who were at most 40 years old censored observations';
RUN;

* ATRISK shows risk set
* cl (pointwise) or cb=ep (simultaneous) gives 95% confidence interval


/* HOMEWORK */
Data kmhomework;
 input subject time event;
 datalines;
1 1 1
2 2 0
3 3 1
4 3 1
5 4 0
6 5 0
7 6 1
8 6 1
9 7 0
10 8 1
;
proc lifetest plots=s(atrisk);
 time time*event(0);
 run;

*PRACTICE II

Data acute_leukemia;
 input group $ wktime status @@;
 datalines;
 T 6 1 T 6 1 T 6 1 T 7 1 T 10 1 T 13 1 T 16 1 T 22 1 T 23 1 T 6 0 T 9 0 T 10 0 T 11 0 T 17 0 
 T 19 0 T 20 0 T 32 0 T 32 0 T 32 0 T 34 0 T 35 0
 P 1 1 P 1 1 P 2 1 P 2 1 P 3 1 P 4 1 P 4 1 P 5 1 P 5 1 P 8 1 P 8 1 P 8 1 P 8 1 P 11 1 P 11 1 
 P 12 1 P 12 1 P 15 1 P 17 1 P 22 1 P 23 1
 ;
Proc Freq; run;


proc lifetest plots=s(cb=hw);
 time wktime*status(0);
  Title "Kapan-Meier curve with Hall-Wellner simultaneous CI";
 run;
proc sort; by group;
proc lifetest plots=s(cb=hw);
 Time wktime*status(0); by group;
 Title "Kaplan-Meier curve by group";
run;

proc lifetest plots=s(atrisk cb=hw);
 Time wktime*status(0);
 Title "K-M curve in the full sample (At risk)";
run;

proc lifetest plots=s(atrisk cb=hw) notable;
 Time wktime*status(0);
 Title "K-M curve in the full sample (At risk)";
run;

*PRACTICE III
Data acute_leukemia;
 input group $ wktime status @@;
 datalines;
 T 6 1 T 6 1 T 6 1 T 7 1 T 10 1 T 13 1 T 16 1 T 22 1 T 23 1 T 6 0 T 9 0 T 10 0 T 11 0 T 17 0 
 T 19 0 T 20 0 T 32 0 T 32 0 T 32 0 T 34 0 T 35 0
 P 1 1 P 1 1 P 2 1 P 2 1 P 3 1 P 4 1 P 4 1 P 5 1 P 5 1 P 8 1 P 8 1 P 8 1 P 8 1 P 11 1 P 11 1 
 P 12 1 P 12 1 P 15 1 P 17 1 P 22 1 P 23 1
 ;
Proc Freq; run;

proc lifetest method=life plots=s intervals=0 TO 36 BY 1;
	time wktime*status(0);
	title "Lifetable method in full sample";
run;

proc sort; by group;
proc lifetest method=life plots=s intervals=0 TO 36 BY 1;
	time wktime*status(0); by group;
	title "Lifetable method by group";
run;
