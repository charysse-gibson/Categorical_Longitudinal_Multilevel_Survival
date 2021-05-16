/* FISHER'S EXACT TEST */

Data CVD;
    Input cvd $ highsalt count @@; 
Datalines; 
cvd        1  5    cvd        0  30  
noncvd  1  2  noncvd 0  23 
; 
proc freq order=data; weight count; 
        tables cvd*highsalt / fisher;   
run;



Data tea;
    Input poured guess count @@; 
Datalines; 
1  1  3      1  2  1  
2  1  1      2  2  3 
; 
proc freq; weight count; 
        tables poured*guess / fisher;   
run;
