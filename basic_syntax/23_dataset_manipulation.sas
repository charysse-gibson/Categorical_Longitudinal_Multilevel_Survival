/* PROC DATASETS */
	*A very useful tool to:
		Manage, 
		Manipulate
		Modify your SAS datasets, 
	more efficient than preforming the same tasks with a Data Step.

You can use the DATASETS procedure to modify the following attributes of a variable:
name
label
format
informat
;

/* Syntax */
PROC DATASETS LIBRARY=libref ; 
        MODIFY SAS-data-set ;
        RENAME old-name1=new-name1 
                <. . . old-name-n=new-name-n>;
        LABEL variable1='label-1'
        		<. . . variable-n='label-n'>; 
        FORMAT variable-list1 format1 
        		<. . . variable-list-n format-n>; 
        INFORMAT variable-list1 informat1 
        		<. . . variable-list-n informat-n>; 
RUN;
QUIT;

*STEP 1: Look at the original attributes of the variables in the reslib.timetrial data set.;
proc contents data=reslib.timetrial;
run;

*Step 2: Use the DATASETS procedure to rename the variable Trt to Treatment.;
proc datasets library=reslib;
   modify timetrial;
   rename Trt=Treatment;
run;
quit;

*Step 3: Look at the attributes of the variables in the reslib.timetrial data set after you run PROC DATASETS.;
proc contents data=reslib.timetrial;
run;

/* EXAMPLE */
data class;
	set sashelp.class;
run;

data classfit;
	set sashelp.classfit;
run;

proc datasets lib=work memtype=data;
contents data=class;
run;
quit;

*memtype = to reduce the output with proc Datasets, to show only datasets, you can add the memtype option and specify data in the proc datsets step.;

/* Class Exercise Example */
libname BST5030 '/folders/myfolders/Data for Classes 3 to 6';

data passngrs2;
	set BST5030.passngrs;
run;

proc datasets;
	modify passngrs2;
	rename FClass=FirstClass;
	label FirstClass='First Class Passengers'
		  Depart='Departure Date';
	format depart Date9.;
run;
quit;

proc contents data=passngrs2;
run;