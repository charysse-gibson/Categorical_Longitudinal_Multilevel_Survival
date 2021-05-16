/* EXTENDED COCHRAN-MANTEL-HAENSZEL TEST */

*Row mean score test
	- Nominal row variable and ordinal column variable
Non-zero correlation test
	- Both row and column variables are ordinal;

/* Row Mean Score Test */
* When a column variable is ordinally scaled response measure and row variable is nominally scaled;

Title ‘Row Mean Score Test and Correlation Test’;
Data pain;
	input treatment $ hours  count @@;
Datalines;
Placebo  0  6  Placebo 1 9 Placebo  2 6 Placebo   3 3 Placebo   4 1
Standard 0 1 Standard 1 4 Standard 2 6 Standard 3 6 Standard 4 8 
Test        0 2  Test        1 5 Test         2 6 Test         3 8 Test        4 6 
;
Proc freq;  weight count;
        Tables treatment*hours/ cmh nocol nopct;
Run;


* using ranks instead of the original data;
Title ‘Row Mean Score Test: Rank’;
Data pain;
	input treatment $ hours  count @@;
Datalines;
Placebo  0  9.5  Placebo 1 15 Placebo  2 9.5 Placebo   3 4 Placebo   4 1.5
Standard 0 1.5 Standard 1 5 Standard 2 9.5 Standard 3 9.5 Standard 4 13.5 
Test         0  3   Test         1 6 Test         2 9.5 Test         3 13.5 Test        4 9.5 
;
Proc freq;  weight count;
        Tables treatment*hours/ cmh nocol nopct;  Run;


options nocenter;
data water;
input water $ @@;
do i=1 to 3;
   input wash $ count @@;  
output;
end;
datalines;
water       low 27 medium 14 high 5
standard  low 10 medium 17 high 26
super      low 5   medium 12 high 50
;
proc print;
proc freq order=data; weight count; 
     tables water*wash/nocol norow nopercent cmh scorout; run;

*Two Ordinal Variables
options nocenter;
data water;
input water $ @@;
do i=1 to 3;
   input wash $ count @@;  output;
end;
datalines;
water       low 27 medium 14 high 5
standard  low 10 medium 17 high 26
super      low 5   medium 12 high 50
;
proc print;
proc freq order=data; weight count; 
tables water*wash/nocol norow nopercent scores=rank cmh      scorout; 
run;


DATA infants;
input malform $ alcohol $ count @@;
datalines;
  absent  0  17066    absent 0-1 14464    absent 1-2 788
  absent 3-5 126      absent >5 37       
  present 0  48         present 0-1 38          present 1-2 5    
  present 3-5 1         present >5 1 
;
proc freq data=infants; weight count; 
    tables alcohol*malform / cmh scorout;  *equal space (0,1…, 4); 
run;


DATA infants2;  
input malform alcohol count @@;
datalines;   **recoding alcohol consumption with midpoint;
    1 0  17066   1 0.5 14464   1 1.5 788   1 4.0 126    1 7.0 37       
    2 0  48         2 0.5 38         2 1.5 5       2 4.0 1        2 7.0 1 
;
proc freq data=infants2; weight count; 
tables alcohol*malform / cmh scores=table scorout; run;  

