
/* Creating Multiple Datasets */
*With OUTPUT and conditional execution;

proc contents data=prog2.military;
run;

data airforce army navy marines; 
   drop Type; 
   set prog2.military;    
   if Type eq 'Air Force' then
      output airforce;
   else if Type eq 'Army' then 
      output army;
   else if Type eq 'Naval' then
      output navy;
   else if Type eq 'Marine' then
      output marines;     
run;

*Note:  drop/keep statements cannot be used in the output statement!;
