/* Retain Statements */

RETAIN variable-name <initial-value> …;

*The RETAIN statement retains the value of the variable in the PDV 
(program data vector) across iterations of the DATA step.  
This means it keeps the same assigned value for all the 
rows that follow, until you reassign the value.;

/* EXAMPLE 1 */
libname BST5030 '/folders/myfolders/Data for Classes 3 to 6';
data mid_q4;
	set bst5030.order_fact;
	where '01nov2004'd <= Order_Date <= '14dec2004'd;
	retain Sales2Dte 0 Num_Orders 0;
	Sales2Dte=Sales2Dte+Total_Retail_Price;
	Num_Orders=Num_Orders+1;
run;

proc print data=mid_q4;
	title 'Orders from 01Nov2004 through 14Dec2004';
 	var Order_ID Order_Date Total_Retail_Price Sales2Dte Num_Orders;
 	format Sales2Dte DOLLAR10.2;
run;

data work.typetotals;
	set bst5030.order_fact (obs=10);
	where '01jan2005'd <= Order_Date <= '31dec2005'd;
	retain TotalRetail 0 TotalCatalog 0 TotalInternet 0;
	if order_type = 1 then TotalRetail=TotalRetail+quantity;
	else if order_type = 2 then TotalCatalog=TotalCatalog+quantity;
	else if order_type = 3 then TotalInternet=TotalInternet+quantity;
run;
proc print data=typetotals;
run;

/* EXAMPLE 2 */
Proc sort data=patientdates;
  by id date;
Run;
Data txDuration;
  set patientdates;
  by id;
  retain firstdate nvisits allvisits 0;
  if first.id then firstdate = date;
  if first.id then nvisits = 0;
  nvisits = nvisits + 1;
  allvisits = allvisits + 1;
  if last.id then duration= date-firstdate;
  format date firstdate mmddyy8.;
Run;
