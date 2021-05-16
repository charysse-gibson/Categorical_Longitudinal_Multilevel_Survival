/* HOMEWORK 2 */

data problem1;
   input treatment response count @@;
   datalines;
   1 1 12     1 2 2
   2 1 3     2 2 14
;
run;
proc freq order=data data=problem1;
     weight    count;
     tables    treatment*response / fisher;
run;
proc freq order=data data=problem1;
     weight    count;
     tables    treatment*response / CMH;
run;

* Problem 2;
data problem2; 
    input gender$ prestige count; 
datalines; 
F 1 22 
F 2 2 
F 3 12 
F 4 11 
F 5 10 
F 6 4 
M 1 3 
M 2 0 
M 3 11 
M 4 6 
M 5 25 
M 6 7 
; 
proc freq order= data data=problem2; 
     weight count; 
     tables gender*prestige /cmh nocol nopercent norow; 
run; 
proc freq order=data data=problem2; 
     weight    count; 
     tables    gender*prestige / cmh; 
run; 

*Problem 3;
data problem3;
   input income satisfaction count;
datalines;
7.5 1 1 
7.5 2 3
7.5 3 10
7.5 4 6
20 1 2
20 2 3
20 3 10
20 4 7
32.5 1 1
32.5 2 6
32.5 3 14
32.5 4 12
41 1 0
41 2 1 
41 3 9
41 4 11
;
run;
proc freq order=data data=problem3;
   weight count;
   tables income*satisfaction/chisq nocol nopercent norow measures scorout scores=ridit;
   test pcorr gamma;
run;
