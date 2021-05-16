/* GAMMA & KENDALL'S TAU-B */

Data injury;
input seatbelt $ @@;
do i=1 to 4;      input injury $ count @@;  output;  end;
datalines;
yes none 75  minor 160 major 100 death 15
no  none 65  minor 175 major 135 death 25
;
proc freq order=data; weight count; tables seatbelt*injury/nocol norow nopercent measures; 
Test gamma kentb;
run;
