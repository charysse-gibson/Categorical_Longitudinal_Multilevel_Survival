*LIBRARIES
Temorary = current programming session
Permanent = saved even after ending session
	Only needs to be submitted once per SAS session;

libname BST5030 '/folders/myfolders/Data for Classes 3 to 6';

proc contents data=BST5030._all_ nods;
run;

/* Using _ALL_ after the library name allows you to see the contents of all the datasets.   */
/* The option NODS just shows you the data directory. */


libname BST5030 '/folders/myfolders/Data for Classes 3 to 6';

proc contents data=BST5030.pilots;
run;

*Reading Data Set from permanent SAS data library;

libname BST5030 '/folders/myfolders/Data for Classes 3 to 6';

data bonus;
	set bst5030.fltattnd;
	BonusAmt = Salary + Salary*.08;
run;

