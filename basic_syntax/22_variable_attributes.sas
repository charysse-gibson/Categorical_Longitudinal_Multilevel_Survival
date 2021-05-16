/* Variable Attributes */
*Use LABEL and FORMAT statements in the following steps: 
PROC step to temporarily assign the attributes (for the duration of the step only)
DATA step to permanently assign the attributes (stored in the data set descriptor portion);


/* TEMPORARY Variable Attributes */
proc print data=timetrial label split=' ';
   format Date mmddyy10.;
   label Trt=‘Treatment'
         Score=‘Test Score'
         Time='Trial Time';
run;

/* PERMANENT Variable Attributes */
libname reslib ‘/folder/myshortcuts/drugtrialtime';  
data reslib.timetrial;
   infile ‘timetrial.dat';
   input @1 ID 3. @4 Date mmddyy8.
         @12 Trt $3. @15 Score 3.
         @18 Time 3.;
   format Date mmddyy10.;
   label Trt=‘Treatment'
         Score=‘Test Score'
         Time='Trial Time';
run;

proc contents data=reslib.timetrial;
run;

proc print data=reslib.timetrial label;
run;

/* Override Permanent Attributes */
*Use a FORMAT statement in a PROC step to temporarily 
override the format stored in the data set descriptor.;

proc print data=reslib.timetrial label;
   format Date date9.;
run;
