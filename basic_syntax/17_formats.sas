/* FORMATS*/
	*A format is an instruction that SAS uses to write data values.
	- used to make display data correctly
	 SAS formats have the following form: <$>format<w>.<d>;

/* Already made format in SAS example*/
data pilotdata;
   infile '/folders/myfolders/Data for Classes 1 and 2/pilot.dat';
   input EmployeeID $  1 - 6
         FirstName  $  7 - 19
         LastName   $ 20 - 34
         JobCode    $ 35 - 41
         Salary       42 - 47
         Category   $ 48 - 50;
run;
proc print data=pilotdata;
   format Salary dollar7.;
run;

/* WIDTH, DECIMAL, DOLLAR SIGNS, COMMAS: */*
w.d		  standard numeric format
8.2		  Width=8, 2 decimal places:	12234.21

$w.		  standard character format
$5.		  Width=5:	KATHY

COMMAw.d     commas in a number
COMMA9.2     Width=9, 2 decimal places:	12,234.21

DOLLARw.d    dollar signs and commas in a number 
DOLLAR10.2	 Width=10, 2 decimal places:     $12,234.21
;

*STORED AND DISPLAYED VALUE FORMATS:
Stored Value	Format	Displayed Value
27134.2864	COMMA12.2	27,134.29
27134.2864	12.2		27134.29
27134.2864	DOLLAR12.2	$27,134.29
27134.2864	DOLLAR9.2	$27134.29
27134.2864	DOLLAR8.2	27134.29
27134.2864	DOLLAR5.2	27134
27134.2864	DOLLAR4.2	27E3
;

*DATE FORMATS:
SAS dates are stored as the number of days 
between 01JAN1960 and the specified date.

MMDDYYw.
Format     Displayed Value
MMDDYY6.	 101601
MMDDYY8.     10/16/01
MMDDYY10.	 10/16/2001

DATEw.
Format	Displayed Value
DATE7.	   16OCT01
DATE9.	   16OCT2001
;


/* Example */
data pilotdata;
   infile '/folders/myfolders/Data for Classes 1 and 2/pilot.dat';
   input EmployeeID $  1 - 6
         FirstName  $  7 - 19
         LastName   $ 20 - 34
         JobCode    $ 35 - 41
         Salary       42 - 47
         Category   $ 48 - 50;
run;
proc format;
	value $codefmt 'PILOT1' = 'exp1'
				   'PILOT2' = 'exp2'
				   'PILOT3' = 'exp3';
run;
proc print data=pilotdata;
	format jobcode $codefmt.;
run;


/* Homework Example*/
data BLOOD;
	do I = 1 to 500;
		WBC = INT(RANNOR(1368)*2000 + 5000);
		X = RANUNI(0);
		if X lt 0.05 then WBC = .;
		else if X lt 0.1 then WBC = WBC - 3000;
		else if X lt 0.15 then WBC = WBC + 4000;
		output;
	end;
	drop I X;
run;

proc format;
	value WBCCounts 3000-4000 = "Low"
					4001-6000 = "Medium"
					6001-12000 = "High"
					low-3000 = "Abnormally Low"
					12000-high = "Abnormally High"
					. = "Not Available";
run;

proc freq data=blood;
	table WBC / nocum missing;
	format WBC WBCCounts.;
run;

*REMINDER NOTES ON THE FORMAT NAME 
- names the format that you are creating 
- cannot be more than 32 characters
- for character values, must have a dollar sign ($) as  the first character, and a letter or underscore as the second character
- for numeric values, must have a letter or underscore as the first character
- cannot end in a number
- cannot be the name of an existing SAS format
- does not end with a period in the VALUE statement;

/* CHANGING FORMAT IN DATA STEP example*/
data empdata;
   infile ‘emplist.dat';
   input LastName $ 1-20 FirstName $ 21-30
         JobCode $ 36-43 Salary 54-59;
   format JobCode $codefmt. Salary money.;
   label Lastname=‘Last Name'
         FirstName='First Name'
         Salary=‘Annual Salary’;
run;
