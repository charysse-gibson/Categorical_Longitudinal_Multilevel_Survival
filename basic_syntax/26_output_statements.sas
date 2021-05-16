/* OUTPUT Statement */
*Pick what will be shown in the output.;


/* Syntax */
data forecast;
   set prog2.growth;
   <additional SAS
      statements>;
   OUTPUT <SAS-data-set-1 …SAS-data-set-n>;
run;


/* Example */
data forecast;
   drop NumKPOP;
   set prog2.growth;
   Year=1;
   NewTotal=NumKPOP*(1+Increase);
   output;
   Year=2;
   NewTotal=NewTotal*(1+Increase);
   output;
   Year=3;
   NewTotal=NewTotal*(1+Increase);
   output;
run;
