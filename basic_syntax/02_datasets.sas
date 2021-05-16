*A DATA step can 
	1. Import
	2. Infile
	3. Set
	4. Datalines options

*DATA step starts with DATA and ends with RUN statement;
	*can process multiple steps at once or one at a time to check for errors;
	*always end with semicolon;
*PROC step allows you to run procedures;
	*PROC CONTENTS will give you the desciptor portion of a SAS dataset;

* (1) IMPORT - READING AN EXISTING FILE;

Proc import out=SAS-data-set
	Datafile='external-file-name'
	<DBSM=file-type> <REPLACE>;

/* proc import out=work.dfwlax  */
/*             datafile=“/folders/myfolders/DallasLA.xls"  */
/*             dbms=excel2000 replace; */
/*    mixed=yes; */
/* run; */
/* proc print data =work.dfwlaw; */
/* run; */

proc import out=week1dataset 
            datafile="/folders/myfolders/Data for Classes 1 and 2/week1dataset.xlsx"
            dbms=xlsx replace;
run;
proc print data=week1dataset;
run;

*REPLACE means to write over the file type
	*DBMS=data-source-identifier
	 DBMS the file type, i.e. xlsx or Access;
*MIXED=YES converts numeric data values into character data values for a column that contains mixed data types.;

*In excel sheet='' allows you to import selected sheets;



* (2) INFILE - ALREADY EXISTING DATASETS IN SAS;
	*LENGTH tells SAS you want to read a dataset and how many spaces the variables takes up;
	*INFILE grabs data from another dataset;
		*dlm is what separates the different columns and rows;
	*INPUT is what variables you want to use;

data work.NewSalesEmps;
   length First_Name $ 12 
          Last_Name $ 18 Job_Title $ 25;
   infile 'newemps.csv' dlm=',';
   input First_Name $ Last_Name $  
         Job_Title $ Salary;
run;
	*DSD option can be used treat consecutive delimiters as missing values;
		*Also treat letters as characters;	
	*MISSOVER option prevents SAS from loading a new record when the end of the current record is reached;

data dfwlax;
   infile 'newemps.csv' DSD;
   input flight data $ dest $ firstclass economy;
run;

*to print dataset;
proc print data=work.NewSalesEmps;
run;



*COLUMN INPUT;
data pilotdata;
	infile '/folders/myfolders/pilot.dat';
	input ID    	     $  1 - 6
	      FirstName		$  7 - 19
	      LastName		$ 20 - 34
	      Jobcode 		$ 35 - 41
	      Income 		  42 - 47
	      Intervention	$ 48 - 50;
run;



*(3) SET - you can subset data or set datasets from your permanent SAS library;
/* Libname BST5030 '	/folders/myfolders/Data for Classes 3 to 6'; */
/* Data work.ratdata;  <- creates temp dataset: ratdata */
/*  set BST5030.rats;    <- uses rats.sas7bdat data */
/* run; */

/* LIBRARIES */
libname BST5030 '/folders/myfolders/Data for Classes 3 to 6';

data bonus;
	set bst5030.fltattnd;
	BonusAmt = Salary + Salary*.08;
run;

/* SUBSETTING DATA */

*bloodpressure example;
data bldpress2;
	set bloodprssr;
	where age>50;
run;

*westrates example;
data westrates;
  infile '/folders/myfolders/Data for Classes 3 to 6/westernrates.dat';
  input  	city $ 				1-30 
	   		state $ 			31-33 
	   		HealthCareEnvironment 	45-49 
	   		Crime 				50-54;
run;
proc print data=westrates;
run;
data westrates;
  set westrates;
  where state="AZ" or state="CA";
run;
proc print data=westrates;
run;
	


* (4) DATALINES - you can input your own raw data into SAS;
	*INPUT then variables;
	*datalines then raw data;

*IMPORTANT!!! DATALINES CANNOT BE INDENTED!;
data payment;
	input amount_paid age sex $;
	
datalines;
100 20 male
200 30 female
300 25 male
;
	
run;

proc print data=payment;
run;