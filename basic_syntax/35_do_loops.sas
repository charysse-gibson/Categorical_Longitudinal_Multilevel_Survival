/* Do Loops */
	*DATA statement
	   <additional SAS statements>
	   DO statement
	      iterated SAS statements
	   END statement
	   <additional SAS statements>
	RUN statement;

/* Example 1 */
data mis;
	pop=36000;
	rate=0.002924;
	N_mi=0;
	newpop=pop-N_mi;
	N_mi=round(newpop*rate) + N_mi;
	newpop=pop-N_mi;
	N_mi=round(newpop*rate) + N_mi;
	newpop=pop-N_mi;
	N_mi=round(newpop*rate) + N_mi;
	newpop=pop-N_mi;
	N_mi=round(newpop*rate) + N_mi;
	newpop=pop-N_mi;
run;

data mis (drop=i);
	pop=36000;
	Rate=0.002924;
	N_mi=0;
	newpop=pop-N_mi;
	do i=1 to 20;
		N_mi=round(newpop*rate) + N_mi;
		newpop=pop-N_mi;
	output;
	end;
run;


/* example 2 */
data kidspop;
   kidpop=6000;
   do Year=2005 to 2010;
      kidpop+(kidpop*.075);
      output;
   end;
run;

proc print data=kidspop noobs;
run;


/* NESTED LOOP */
data nested;
do i=1 to 5;
	do j= 1 to 4;
	output;
	end;
end;
run;

data kidspop;
  do ChildTaxCut = 'NO ', 'YES'; 
    kidpop=6000;
    do Year=2005 to 2010;	
	    if ChildTaxCut = 'NO ' then 	  
       kidpop+(kidpop*.075);
	    else kidpop+(kidpop*.08);
     output;
    end;
  end;
run;

/* Class Exercises for Do Loops */
data future_expenses; 
   drop start stop;  
   Wages=12874000; 
   Retire=1765000; 
   Medical=649000; 
   start=year(today())+1; 
   stop=start+9; 
		do year = start to stop; 
		wages = wages*1.06; 
		retire = retire*1.014; 
		medical = medical* 1.095; 
		total_cost = wages + retire + medical; 
	output; 
	end; 
run; 
proc print data=future_expenses; 
   format wages retire medical total_cost comma14.2; 
   var year wages retire medical total_cost; 
run; 

data future_expenses;
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   Income=50000000;
   year=year(today())+1;
		do until (total_cost > income);
		wages = wages*1.06;
		retire = retire*1.014; 
		medical = medical*1.095;
		income = income*1.01;
		total_cost = wages+retire+medical;
		output;
		year+1;
	end;
run;

proc print data=future_expenses;
   format income total_cost comma14.2;
   var year income total_cost;
run;