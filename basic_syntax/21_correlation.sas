/* Data Set Input */
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
run;

/* Pearson & Spearman R */
ods graphics on;
title "LA Depression (Age & CESE)";
Proc Corr data=LA_Depression spearman plots=scatter (ellipse=none);
	var age CESD; 
run;
ods graphics off;

/* Cronbach's Alpha */
Proc corr data=LA_Depression alpha;
	var Statement1-Statement20;
run;

*NOTES:
Statement1-Statement20 (for same prefix of variables)
Age -- Cities (to use group of variables in order of variables);