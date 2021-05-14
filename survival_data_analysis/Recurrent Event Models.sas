/* 
A study of recurrent bladder cancer tumors (Byar, 1980 and Wei, Lin and Weissfeld, 1989). 
The repeated event is the recurrence of bladder cancer tumors after transurethral sugical excision. 
Each recurrence of new tumors was treated by removal at each examination. About 25% of 86 patients experienced four events
ID - subject id
EVENT - presence of bladder cancer tumors
INTERVAL - # episodes of tumors
INTTIME - interval time (STOP-START)
START - time of previous tumor
STOP - time of next tumor
TX - treatment (0=placebo, 1=treatment with thiotepa)
NUM - # of tumors
SIZE - size of tumors (cm)
*/
Data bladder;
  input ID EVENT INTERVAL INTTIME START STOP TX NUM SIZE;
Datalines;
1 0 1 0 0 0 0 1 1
2 0 1 1 0 1 0 1 3
3 0 1 4 0 4 0 2 1
4 0 1 7 0 7 0 1 1
5 0 1 10 0 10 0 5 1
6 1 1 6 0 6 0 4 1
6 0 2 4 6 10 0 4 1
7 0 1 14 0 14 0 1 1
8 0 1 18 0 18 0 1 1
9 1 1 5 0 5 0 1 3
9 0 2 13 5 18 0 1 3
10 1 1 12 0 12 0 1 1
10 1 2 4 12 16 0 1 1
10 0 3 2 16 18 0 1 1
11 0 1 23 0 23 0 3 3
12 1 1 10 0 10 0 1 3
12 1 2 5 10 15 0 1 3
12 0 3 8 15 23 0 1 3
13 1 1 3 0 3 0 1 1
13 1 2 13 3 16 0 1 1
13 1 3 7 16 23 0 1 1
14 1 1 3 0 3 0 3 1
14 1 2 6 3 9 0 3 1
14 1 3 12 9 21 0 3 1
14 0 4 2 21 23 0 3 1
15 1 1 7 0 7 0 2 3
15 1 2 3 7 10 0 2 3
15 1 3 6 10 16 0 2 3
15 1 4 8 16 24 0 2 3
16 1 1 3 0 3 0 1 1
16 1 2 12 3 15 0 1 1
16 1 3 10 15 25 0 1 1
17 0 1 26 0 26 0 1 2
18 1 1 1 0 1 0 8 1
18 0 2 25 1 26 0 8 1
19 1 1 2 0 2 0 1 4
19 1 2 24 2 26 0 1 4
20 1 1 25 0 25 0 1 2
20 0 2 3 25 28 0 1 2
21 0 1 29 0 29 0 1 4
22 0 1 29 0 29 0 1 2
23 0 1 29 0 29 0 4 1
24 1 1 28 0 28 0 1 6
24 1 2 2 28 30 0 1 6
25 1 1 2 0 2 0 1 5
25 1 2 15 2 17 0 1 5
25 1 3 5 17 22 0 1 5
25 0 4 8 22 30 0 1 5
26 1 1 3 0 3 0 2 1
26 1 2 3 3 6 0 2 1
26 1 3 2 6 8 0 2 1
26 1 4 4 8 12 0 2 1
26 0 5 18 12 30 0 2 1
27 1 1 12 0 12 0 1 3
27 1 2 3 12 15 0 1 3
27 1 3 9 15 24 0 1 3
27 0 4 7 24 31 0 1 3
28 0 1 32 0 32 0 1 2
29 0 1 34 0 34 0 2 1
30 0 1 36 0 36 0 2 1
31 1 1 29 0 29 0 3 1
31 0 2 7 29 36 0 3 1
32 0 1 37 0 37 0 1 2
33 1 1 9 0 9 0 4 1
33 1 2 8 9 17 0 4 1
33 1 3 5 17 22 0 4 1
33 1 4 2 22 24 0 4 1
33 0 5 16 24 40 0 4 1
34 1 1 16 0 16 0 5 1
34 1 2 3 16 19 0 5 1
34 1 3 4 19 23 0 5 1
34 1 4 6 23 29 0 5 1
34 0 5 11 29 40 0 5 1
35 0 1 41 0 41 0 1 2
36 1 1 3 0 3 0 1 1
36 0 2 40 3 43 0 1 1
37 1 1 6 0 6 0 2 6
37 0 2 37 6 43 0 2 6
38 1 1 3 0 3 0 2 1
38 1 2 3 3 6 0 2 1
38 1 3 3 6 9 0 2 1
38 0 4 35 9 44 0 2 1
39 1 1 9 0 9 0 1 1
39 1 2 2 9 11 0 1 1
39 1 3 9 11 20 0 1 1
39 1 4 6 20 26 0 1 1
39 0 5 19 26 45 0 1 1
40 1 1 18 0 18 0 1 1
40 0 2 30 18 48 0 1 1
41 0 1 49 0 49 0 1 3
42 1 1 35 0 35 0 3 1
42 0 2 16 35 51 0 3 1
43 1 1 17 0 17 0 1 7
43 0 2 36 17 53 0 1 7
44 1 1 3 0 3 0 3 1
44 1 2 12 3 15 0 3 1
44 1 3 31 15 46 0 3 1
44 1 4 5 46 51 0 3 1
44 0 5 2 51 53 0 3 1
45 0 1 59 0 59 0 1 1
46 1 1 2 0 2 0 3 2
46 1 2 13 2 15 0 3 2
46 1 3 9 15 24 0 3 2
46 1 4 6 24 30 0 3 2
46 0 5 31 30 61 0 3 2
47 1 1 5 0 5 0 1 3
47 1 2 9 5 14 0 1 3
47 1 3 5 14 19 0 1 3
47 1 4 8 19 27 0 1 3
47 0 5 37 27 64 0 1 3
48 1 1 2 0 2 0 2 3
48 1 2 6 2 8 0 2 3
48 1 3 4 8 12 0 2 3
48 1 4 1 12 13 0 2 3
48 0 5 51 13 64 0 2 3
49 0 1 1 0 1 1 1 3
50 0 1 1 0 1 1 1 1
51 1 1 5 0 5 1 8 1
52 0 1 9 0 9 1 1 2
53 0 1 10 0 10 1 1 1
54 0 1 13 0 13 1 1 1
55 1 1 3 0 3 1 2 6
55 0 2 11 3 14 1 2 6
56 1 1 1 0 1 1 5 3
56 1 2 2 1 3 1 5 3
56 1 3 2 3 5 1 5 3
56 1 4 2 5 7 1 5 3
56 0 5 10 7 17 1 5 3
57 0 1 18 0 18 1 5 1
58 1 1 17 0 17 1 1 3
58 0 2 1 17 18 1 1 3
59 1 1 2 0 2 1 5 1
59 0 2 17 2 19 1 5 1
60 1 1 17 0 17 1 1 1
60 1 2 2 17 19 1 1 1
60 0 3 2 19 21 1 1 1
61 0 1 22 0 22 1 1 1
62 0 1 25 0 25 1 1 3
63 0 1 25 0 25 1 1 5
64 0 1 25 0 25 1 1 1
65 1 1 6 0 6 1 1 1
65 1 2 6 6 12 1 1 1
65 1 3 1 12 13 1 1 1
65 0 4 13 13 26 1 1 1
66 1 1 6 0 6 1 1 1
66 0 2 21 6 27 1 1 1
67 1 1 2 0 2 1 2 1
67 0 2 27 2 29 1 2 1
68 1 1 26 0 26 1 8 3
68 1 2 9 26 35 1 8 3
68 0 3 1 35 36 1 8 3
69 0 1 38 0 38 1 1 1
70 1 1 22 0 22 1 1 1
70 1 2 1 22 23 1 1 1
70 1 3 4 23 27 1 1 1
70 1 4 5 27 32 1 1 1
70 0 5 7 32 39 1 1 1
71 1 1 4 0 4 1 6 1
71 1 2 12 4 16 1 6 1
71 1 3 7 16 23 1 6 1
71 1 4 4 23 27 1 6 1
71 0 5 12 27 39 1 6 1
72 1 1 24 0 24 1 3 1
72 1 2 2 24 26 1 3 1
72 1 3 3 26 29 1 3 1
72 1 4 11 29 40 1 3 1
73 0 1 41 0 41 1 3 2
74 0 1 41 0 41 1 1 1
75 1 1 1 0 1 1 1 1
75 1 2 26 1 27 1 1 1
75 0 3 16 27 43 1 1 1
76 0 1 44 0 44 1 1 1
77 1 1 2 0 2 1 6 1
77 1 2 18 2 20 1 6 1
77 1 3 3 20 23 1 6 1
77 1 4 4 23 27 1 6 1
77 0 5 17 27 44 1 6 1
78 0 1 45 0 45 1 1 2
79 1 1 2 0 2 1 1 4
79 0 2 44 2 46 1 1 4
80 0 1 46 0 46 1 1 4
81 0 1 49 0 49 1 3 3
82 0 1 50 0 50 1 1 1
83 1 1 4 0 4 1 4 1
83 1 2 20 4 24 1 4 1
83 1 3 23 24 47 1 4 1
83 0 4 3 47 50 1 4 1
84 0 1 54 0 54 1 3 4
85 1 1 38 0 38 1 2 1
85 0 2 16 38 54 1 2 1
86 0 1 59 0 59 1 1 3
;
run;

*Counting Process (CP) Model;
proc phreg data=bladder;
   model (START STOP)*EVENT(0) = TX NUM SIZE / ties=exact rl;
   title1 'Analysis of Repeated Events';
   title2 'A Pooled CP Model Ignoring Dependence';
run;

*Counting Process Model with Robust Estimation;
proc phreg data=bladder covsandwich(aggregate) covm;
   Class TX;
   model (START STOP)*EVENT(0) = TX NUM SIZE / ties=exact rl;
   id ID;
   title1 'Analysis of Repeated Events';
   title2 'A CP Model the Robust Variance Estimation';
run;

** Conditional Model 1: Stratified CP model;
**Specify the use of the robust sandwich estimatefor the covariance matrix.****************; 
** Also include the interactions between the predictor variables and the stratum variable.*;
**Time since beginning of the study;
proc phreg data=bladder covs(aggregate) covm;
   class INTERVAL(param=ref ref='1') TX(param=ref ref='0');
   model (START STOP)*EVENT(0) = TX NUM SIZE TX|INTERVAL / ties=exact covb rl;
   strata INTERVAL;
   id ID;
   HAZARDRATIO "1st event" TX /at (INTERVAL='1') cl=both ;
   HAZARDRATIO "2nd event" TX /at (INTERVAL='2') cl=both ;
   HAZARDRATIO "3rd event" TX /at (INTERVAL='3') cl=both ;
   HAZARDRATIO "4th event" TX /at (INTERVAL='4') cl=both ;
   HAZARDRATIO "5th event" TX /at (INTERVAL='5') cl=both ;
   title1 'Analysis of Repeated Events';
   title2 'Statified CP Model with robust estimation';
   title3 'Time since Beginning of Study';
run;

** Conditional Model 2: Gap time model;
proc sort data=bladder;
   by ID INTERVAL;
run;

data bladder1;
   set bladder;
   first_time=0;
run;

proc print data=bladder1(obs=20);
   var ID first_time START STOP INTTIME;
   title1 'Analysis of Repeated Events';
   title2 'Using Conditional Model2';
   title3 'Time since Last Event';
run;

proc phreg data=bladder1 covs(aggregate) covm;
   class INTERVAL(param=ref ref='1') TX(param=ref ref='0');
   model (first_time INTTIME)*EVENT(0) = TX NUM SIZE TX|INTERVAL / ties=exact covb rl;
   strata INTERVAL;
   id ID;
   HAZARDRATIO "1st event" TX /at (INTERVAL='1') cl=wald ;
   HAZARDRATIO "2nd event" TX /at (INTERVAL='2') cl=wald ;
   HAZARDRATIO "3rd event" TX /at (INTERVAL='3') cl=wald ;
   HAZARDRATIO "4th event" TX /at (INTERVAL='4') cl=wald ;
   HAZARDRATIO "5th event" TX /at (INTERVAL='5') cl=wald ;
   title1 'Analysis of Repeated Events';
   title2 'Using Gap Time Model';
   title3 'Time since Last Event';
run;

**A WLW marginal model;
*The DATA step outputs all of the records and uses BY-group processing to identify;
*which subjects have fewer than 5 records. The DO loop outputs the necessary number;
*of records for subjects with fewer than 5 records. Therefore, all subjects will have 
*5 records regardless of how many events they experienced.;
**Duplicate  the last record for each subject with fewer than 5 intervals;
proc sort data=bladder1; 
	by ID INTERVAL;
run;

data bladder2;
   set bladder1;
   by ID;
   output;
   if last.ID=1 and interval<5 then
      do;
             do until (INTERVAL=5);
            INTERVAL+1;
            EVENT=0; *the duplicated cases are treated censored;
            output;
         end;
      end;
run;

proc print data=bladder2 (obs=20);
   var ID START STOP EVENT INTERVAL;
run;

*Fit marginal model. Specify the use of the robust sandwich estimate.*************;
*Include the interactions between the predictor variables and the stratum variable.*;
proc phreg data=bladder2 covs(aggregate) covm;
	class INTERVAL(param=ref ref="1") TX(param=ref ref='0');
   model (first_time STOP)*EVENT(0)= TX NUM SIZE TX|INTERVAL /  covb rl; *Conditional model 1
   *model STOP*EVENT(0)= TX NUM SIZE TX|INTERVAL /  covb rl; *equivalent syntax; *Marginal model;
   strata INTERVAL;
   id ID;
   HAZARDRATIO TX /at (INTERVAL='1' '2' '3' '4' '5') cl=pl; 
   title1 'Analysis of Repeated Events';
   title2 'Using WLW Marginal Model with treatment by interval interaction';
run;
