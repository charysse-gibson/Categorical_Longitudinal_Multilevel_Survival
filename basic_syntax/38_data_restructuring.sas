/* Data Restructuring (using arrays and do loops) */

/* From WIDE to LONG */
data rotate(drop=Qtr1-Qtr4);  
   set bst5030.donate;          
   array Contrib[4] Qtr1-Qtr4;
   do Qtr=1 to 4;             
      Amount=Contrib[Qtr];    
      output;                 
   end;                       
run; 

/* From LONG to WIDE */
data visit;
  set visit;
  by patient;
  retain date1-date6;
  array date[6] date1-date6;
  date[visit] = date_visit;
run;

*only want 6 visits;
data visit;
  set visit;
  by patient;
  retain date1-date6;
  array date[6] date1-date6;
  if first.patient then do i = 1 to 6;
    date[i] = .;
  end;
  date[visit] = date_visit;
run; 

/* Homework Example */
data ques(drop=i);    
	input ID $ Reason1-Reason4;        
	array Contrib[4] Qtr1-Qtr4;
	do i=1 to 20;             
		Amount=Contrib[Qtr];    
		output;                 
	end;    
datalines; 
001 3 6 13 17 
002 8 3 4 . 
003 20 2 . . 
004 8 4 20 19 
; 
run; 
proc print data=ques;
run;


/* 16.4  */
data THIN;
	input ID $ Time X @@;
datalines;
001 1 10  001 2 12  001 3 15 
004 1 17 
003 1 14  003 2 18  003 3 22  003 4 28 
002 1 18  004 2 28 
; 
run;

proc sort data=THIN;
	by ID Time;
run;

data WIDE (drop=i);
	set THIN;
	by ID;
	retain X1-X4;
	array record[4] X1-X4;
	if first.ID then do i= 1 to 4;
		record(i) = .;
	end;
	record(Time)= X;
	if last.ID then output;
	drop Time X;
run;

proc print data=WIDE noobs;
run;

/* Example */
libname Final '/folders/myfolders/Data for Final Exam'; 
data dose1;  
	set final.dose;  
	by patientid;  
	retain date1-date5;  
	array date[5] date1-date5;  
	retain iron1-iron5;  
	array ironlevels[5] iron1-iron5;  
	if first.patientid then do i = 1 to 5;  
    	date[i] = .;  
    	ironlevels[i] = .;  
  	end;  
  	date[time] = date_visit;  
  	ironlevels[time] = iron;  
  	if last.patientid then output;  
  	drop time date_visit iron i;  
  	format date1-date5 MMDDYY10.;  
run;  
proc print data=dose1; 
run;