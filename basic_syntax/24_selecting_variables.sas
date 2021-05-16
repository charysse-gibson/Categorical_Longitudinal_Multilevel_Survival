/* Selecting Variables */
* To select variables use: DROP and KEEP;

data lipid_base(keep=name age bmi cholesterol hdl ldl smoking);
  set bst5030.lipid;
  bmi = round((weight/(height**2))*703,.1);
run;
/* equivalent to */
data lipid_base(drop= alcohol cholesterol3 cholesterolLoss coffee);
  set bst5030.lipid;
  bmi = round((weight/(height**2))*703,.1);
run;
/* equivalent to */
data lipid_base;
  set bst503.lipid;
  bmi = round((weight/(height**2))*703,.1);
  keep name age bmi cholesterol hdl ldl smoking;
run; 
/* equivalent to */
data lipid_base;
  set bst503.lipid;
  bmi = round((weight/(height**2))*703,.1);
  drop alcohol cholesterol3 cholesterolLoss coffee;
run; 

proc print data=lipid_base noobs;
run;


/* Example */
data LA_Depression;
   length ID $ 3 Gender $ 3 Age 3 Marital $ 3 
   		  Education $ 3 Employment $ 3 Income 3 
   		  Religion $ 3 Statement1-Statement20 3 
   		  Drink $ 3 Health $ 3 RegDoctor $ 3 Treat $ 3 
   		  BedDays $ 3 AcuteIll $ 3 ChronicIll $ 3;
   infile '/folders/myfolders/Project Data Sets/DepressionData0.dat' dlm=' ';
   input ID $ Gender $ Age Marital $ Education $ 
   		 Employment $ Income Religion $ Statement1-Statement20 
   		 Drink $ Health $ RegDoctor $ Treat $ BedDays $ 
   		 AcuteIll $ ChronicIll $;
   		 CESD = sum(of Statement1--Statement20);
   	drop ID Gender Drink Health ChronicIll;
run;
proc print data=la_depression;
run;