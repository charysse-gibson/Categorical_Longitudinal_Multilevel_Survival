/* Homework 3 */

data p1q1;
   input program$ result$ count;
   
datalines;
Diet Yes 850
Diet No 150
Exercise Yes 860
Exercise No 280
;
run;

proc freq order=data data=p1q1;
     weight    count;
     tables    program*result / relrisk;
run;


data p1q2;
   input bmi$ program$ result$ count;
   
datalines;
30-40 Diet Yes 30
30-40 Diet No 70
30-40 Exercise Yes 260
30-40 Exercise No 240
>=40 Diet Yes 820
>=40 Diet No 80
>=40 Exercise Yes 600
>=40 Exercise No 40
;
run;
proc freq order=data data=p1q2;
     weight    count;
     tables    bmi*program*result / chisq relrisk CMH;
run;

/* Problem 2 */
data p2q1;
   input smoking$ breathing$ count;

datalines;
Current NotNormal 131 
Current Normal 927
Never NotNormal 38
Never Normal 741
;
run;
proc freq order=data data=p2q1;
     weight    count;
     tables    smoking*breathing / relrisk;
run;

data p2q2;
   Input age$ smoking$ breathing$ count;
   
datalines;
<=40 Current NotNormal 57 
<=40 Current Normal 682
<=40 Never NotNormal 34
<=40 Never Normal 577
>40 Current NotNormal 74
>40 Current Normal 245
>40 Never NotNormal 4
>40 Never Normal 164
;
run;

proc freq order=data data=p2q2;
     weight    count;
     tables    age*smoking*breathing / chisq relrisk CMH;
run;
