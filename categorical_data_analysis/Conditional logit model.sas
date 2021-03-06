options nodate ps=200 ls=80 formdlim=' ';
title "McNemar's Test";
data surgery;
input self surgical count @@;
datalines;
1 1 69 1 0 28
0 1 5  0 0 63 
;;
run;
proc freq order=data; weight count; tables self*surgical/agree;
run;

***Reconstruct 2x2 table to paired data format for common odds ratio;
title "CMH Common OR";
Data implantpairs;
   input selfruptr surgicalruptr count @@; 
id+1;  *1. add a subject id;
Datalines;
1 1 69  1 0 28
0 1  5   0 0 63 
;
run;
*2. Reshape the data;
Proc transpose data=implantpairs out=implant_long 
(rename=(_name_=record col1=rupture));
var selfruptr surgicalruptr;
  by id;
run;
*3. Merge with count that is not transposed;
Data implant_indiv;
   merge implant_long 
          implantpairs (keep=id count); by id;
run;
Proc print data=implant_indiv;
run;
proc freq data=implant_indiv order=data;  
  tables  id*record*rupture/cmh relrisk; 
  weight count;
run; 


Title 'Conditional logit model';
/*Researchers studied women in a retirement community in the 1970s to determine if there was an association between the use of estrogen (est) 
and the incidence of endometrial cancer (case) (Mack et al. 1976). Cases were matched to controls who were within a year of the same age 
had the same marital status, and were living in the same community at the time of the diagnosis of the case. Information was also collected 
on hypertension (hyper), gallbladder disease history (Gall), and non-estrogen drug use (nonest). The data used here is a subset of the actual data. 
There are 63 matched pairs, with the variable CASE=1 indicating a case and CASE=0 indicating a control. 

There are 63 matched pairs, each consisting of a case of endometrial cancer (Outcome=1) and a control (Outcome=0). 
The case and corresponding control have the same ID. Two prognostic factors are included: Gall (an indicator variable for gall bladder disease) 
and Hyper (an indicator variable for hypertension). The goal of the case-control analysis is to determine the relative risk for gall bladder disease, 
controlling for the effect of hypertension. 
*/
option nodate nocenter;
data endometrialcancer;
  input IndID case age est Gall Hyper nonest @@;
Datalines;
    1 1 74 1 0 0  1  1 0 75 0 0 0  0
    2 1 67 1 0 0  1  2 0 67 0 0 1  1
    3 1 76 1 0 1  1  3 0 76 1 0 1  1
    4 1 71 1 0 0  0  4 0 70 1 1 0  1
    5 1 69 1 1 0  1  5 0 69 1 0 1  1
    6 1 70 1 0 1  1  6 0 71 0 0 0  0
    7 1 65 1 1 0  1  7 0 65 0 0 0  0
    8 1 68 1 1 1  1  8 0 68 0 0 1  1
    9 1 61 0 0 0  1  9 0 61 0 0 0  1
   10 1 64 1 0 0  1 10 0 65 0 0 0  0
   11 1 68 1 1 0  1 11 0 69 1 1 0  0
   12 1 74 1 0 0  1 12 0 74 1 0 0  0
   13 1 67 1 1 0  1 13 0 68 1 0 1  1
   14 1 62 1 1 0  1 14 0 62 0 1 0  0
   15 1 71 1 1 0  1 15 0 71 1 0 1  1
   16 1 83 1 0 1  1 16 0 82 0 0 0  0
   17 1 70 0 0 0  1 17 0 70 0 0 1  1
   18 1 74 1 0 0  1 18 0 75 0 0 0  0
   19 1 70 1 0 0  1 19 0 70 0 0 0  0
   20 1 66 1 0 1  1 20 0 66 1 0 0  1
   21 1 77 1 0 0  1 21 0 77 1 1 1  1
   22 1 66 1 0 1  1 22 0 67 0 0 1  1
   23 1 71 1 0 1  0 23 0 72 0 0 0  0
   24 1 80 1 0 0  1 24 0 79 0 0 0  0
   25 1 64 1 0 0  1 25 0 64 1 0 0  1
   26 1 63 1 0 0  1 26 0 63 1 0 1  1
   27 1 72 0 1 0  1 27 0 72 0 0 1  0
   28 1 57 1 0 0  0 28 0 57 1 0 1  1
   29 1 74 0 1 0  1 29 0 74 0 0 0  1
   30 1 62 1 0 1  1 30 0 62 1 0 0  1
   31 1 73 1 0 1  1 31 0 72 1 0 0  1
   32 1 71 1 0 1  1 32 0 71 1 0 1  1
   33 1 64 0 0 1  1 33 0 65 1 0 0  1
   34 1 63 1 0 0  1 34 0 64 0 0 0  1
   35 1 79 1 1 1  1 35 0 78 1 1 1  1
   36 1 80 1 0 0  1 36 0 81 0 0 1  1
   37 1 82 1 0 1  1 37 0 82 0 0 0  1
   38 1 71 1 0 1  1 38 0 71 0 0 1  1
   39 1 83 1 0 1  1 39 0 83 0 0 0  1
   40 1 61 1 0 1  1 40 0 60 0 0 0  1
   41 1 71 1 0 0  1 41 0 71 0 0 0  0
   42 1 69 1 0 1  1 42 0 69 0 1 0  1
   43 1 77 1 0 0  1 43 0 76 1 0 1  1
   44 1 64 1 0 0  0 44 0 64 1 0 0  0
   45 1 79 0 1 0  0 45 0 82 1 0 0  1
   46 1 72 1 0 0  1 46 0 72 1 0 0  1
   47 1 82 1 1 1  1 47 0 81 0 0 0  0
   48 1 73 1 0 1  1 48 0 74 1 0 0  1
   49 1 69 1 0 0  1 49 0 68 0 0 0  1
   50 1 79 1 0 1  1 50 0 79 0 0 0  1
   51 1 72 1 0 0  0 51 0 71 1 0 1  1
   52 1 72 1 0 1  1 52 0 72 1 0 1  1
   53 1 65 1 0 1  1 53 0 67 0 0 0  0
   54 1 67 1 0 1  1 54 0 66 1 0 0  1
   55 1 64 1 1 0  1 55 0 63 0 0 0  1
   56 1 62 1 0 0  0 56 0 63 0 0 0  0
   57 1 83 0 1 1  1 57 0 83 0 1 0  0
   58 1 81 1 0 0  1 58 0 79 0 0 0  0
   59 1 67 1 0 0  1 59 0 66 1 0 1  1
   60 1 73 1 1 1  1 60 0 72 1 0 0  1
   61 1 67 1 1 0  1 61 0 67 1 1 0  1
   62 1 74 1 0 1  1 62 0 75 0 0 0  1
   63 1 68 1 1 0  1 63 0 69 1 0 0  1
;
proc logistic data=endometrialcancer;
   strata IndID;
   model case(event='1')=age est Gall Hyper nonest/
            selection=stepwise;
run;

Data flu;
  input matchid flu lungdisease vaccine @@;
Datalines;
    1 1 0 0  1 0 1 0  1 0 0 0  2 1 0 0  2 0 0 0  2 0 1 0
    3 1 0 1  3 0 0 1  3 0 0 0  4 1 1 0  4 0 0 0  4 0 1 0
    5 1 1 0  5 0 0 1  5 0 0 1  6 1 0 0  6 0 0 0  6 0 0 1
    7 1 0 0  7 0 0 0  7 0 0 1  8 1 1 1  8 0 0 0  8 0 0 1
    9 1 0 0  9 0 0 1  9 0 0 0 10 1 0 0 10 0 1 0 10 0 0 0
   11 1 1 0 11 0 0 1 11 0 0 0 12 1 1 1 12 0 0 1 12 0 0 0
   13 1 0 0 13 0 0 1 13 0 1 0 14 1 0 0 14 0 0 0 14 0 0 1
   15 1 1 0 15 0 0 0 15 0 0 1 16 1 0 1 16 0 0 1 16 0 0 1
   17 1 0 0 17 0 1 0 17 0 0 0 18 1 1 0 18 0 0 1 18 0 0 1
   19 1 1 0 19 0 0 1 19 0 0 1 20 1 0 0 20 0 0 0 20 0 0 0
   21 1 0 0 21 0 0 1 21 0 0 1 22 1 0 1 22 0 0 0 22 0 1 0
   23 1 1 1 23 0 0 0 23 0 0 0 24 1 0 0 24 0 0 1 24 0 0 1
   25 1 1 0 25 0 1 0 25 0 0 0 26 1 1 1 26 0 0 0 26 0 0 0
   27 1 1 0 27 0 0 1 27 0 0 0 28 1 0 1 28 0 1 0 28 0 0 0
   29 1 0 0 29 0 0 0 29 0 1 1 30 1 0 0 30 0 0 0 30 0 0 0
   31 1 0 0 31 0 0 0 31 0 0 1 32 1 1 0 32 0 0 0 32 0 0 0
   33 1 0 1 33 0 0 0 33 0 0 0 34 1 0 0 34 0 1 0 34 0 0 0
   35 1 1 0 35 0 1 1 35 0 0 0 36 1 0 1 36 0 0 0 36 0 0 1
   37 1 0 1 37 0 0 0 37 0 0 1 38 1 1 1 38 0 0 1 38 0 0 0
   39 1 0 0 39 0 0 1 39 0 0 1 40 1 0 0 40 0 0 0 40 0 1 1
   41 1 1 0 41 0 0 0 41 0 0 1 42 1 1 0 42 0 0 0 42 0 0 0
   43 1 0 0 43 0 0 1 43 0 0 0 44 1 1 0 44 0 0 0 44 0 0 0
   45 1 1 0 45 0 0 0 45 0 0 0 46 1 1 0 46 0 1 1 46 0 0 0
   47 1 0 1 47 0 0 0 47 0 0 1 48 1 0 0 48 0 0 0 48 0 0 0
   49 1 1 0 49 0 1 0 49 0 1 1 50 1 1 1 50 0 0 0 50 0 0 1
   51 1 1 0 51 0 0 1 51 0 0 1 52 1 0 1 52 0 0 0 52 0 0 0
   53 1 0 1 53 0 0 1 53 0 0 1 54 1 1 0 54 0 0 0 54 0 0 0
   55 1 0 0 55 0 0 1 55 0 0 0 56 1 0 0 56 0 0 0 56 0 1 0
   57 1 1 1 57 0 1 0 57 0 0 0 58 1 1 0 58 0 0 1 58 0 0 1
   59 1 0 0 59 0 0 0 59 0 1 1 60 1 0 0 60 0 0 0 60 0 0 1
   61 1 0 1 61 0 0 0 61 0 0 1 62 1 0 0 62 0 0 0 62 0 0 1
   63 1 0 0 63 0 0 1 63 0 0 0 64 1 0 0 64 0 1 0 64 0 0 0
   65 1 1 1 65 0 0 0 65 0 1 0 66 1 1 1 66 0 0 1 66 0 1 0
   67 1 0 0 67 0 0 0 67 0 0 1 68 1 0 0 68 0 0 1 68 0 0 1
   69 1 1 1 69 0 0 1 69 0 0 1 70 1 0 0 70 0 0 1 70 0 1 1
   71 1 0 0 71 0 0 0 71 0 0 1 72 1 1 0 72 0 0 0 72 0 0 0
   73 1 1 0 73 0 0 1 73 0 0 0 74 1 0 0 74 0 0 0 74 0 0 1
   75 1 0 0 75 0 0 1 75 0 0 0 76 1 0 0 76 0 0 0 76 0 0 0
   77 1 0 1 77 0 0 0 77 0 0 1 78 1 0 0 78 0 0 1 78 0 0 0
   79 1 1 0 79 0 0 1 79 0 0 1 80 1 0 1 80 0 0 0 80 0 0 0
   81 1 0 0 81 0 1 1 81 0 0 1 82 1 1 1 82 0 1 0 82 0 0 0
   83 1 0 1 83 0 0 0 83 0 0 1 84 1 0 0 84 0 0 0 84 0 0 1
   85 1 1 0 85 0 0 0 85 0 0 0 86 1 0 0 86 0 1 1 86 0 1 0
   87 1 1 1 87 0 0 0 87 0 0 0 88 1 0 0 88 0 0 0 88 0 0 0
   89 1 0 0 89 0 0 1 89 0 1 1 90 1 0 0 90 0 0 0 90 0 0 0
   91 1 0 1 91 0 0 0 91 0 0 1  92 1 0 0  92 0 1 1  92 0 0 0
   93 1 0 1 93 0 0 0 93 0 1 0  94 1 1 0  94 0 0 0  94 0 0 0
   95 1 1 1 95 0 0 1 95 0 0 0  96 1 1 0  96 0 0 1  96 0 0 1
   97 1 1 1 97 0 0 0 97 0 0 1  98 1 0 0  98 0 0 0  98 0 1 1
   99 1 0 1 99 0 1 1 99 0 0 1 100 1 1 0 100 0 0 0 100 0 0 0
   101 1 0 0 101 0 0 0 101 0 0 0 102 1 0 1 102 0 0 0 102 0 0 0
   103 1 0 1 103 0 0 0 103 0 0 0 104 1 1 0 104 0 0 1 104 0 1 0
   105 1 1 0 105 0 1 0 105 0 0 0 106 1 0 0 106 0 0 0 106 0 0 1
   107 1 0 0 107 0 0 1 107 0 0 1 108 1 1 1 108 0 0 0 108 0 0 1
   109 1 0 1 109 0 0 0 109 0 0 0 110 1 0 0 110 0 0 0 110 0 0 0
   111 1 1 0 111 0 0 1 111 0 0 1 112 1 0 0 112 0 0 1 112 0 0 0
   113 1 0 1 113 0 0 0 113 0 1 0 114 1 1 1 114 0 0 1 114 0 0 1
   115 1 1 1 115 0 0 1 115 0 0 1 116 1 0 0 116 0 0 1 116 0 1 0
   117 1 0 1 117 0 0 0 117 0 0 0 118 1 1 0 118 0 1 0 118 0 0 0
   119 1 1 0 119 0 0 0 119 0 0 0 120 1 1 0 120 0 0 0 120 0 0 1
   121 1 0 0 121 0 0 1 121 0 0 0 122 1 0 1 122 0 0 0 122 0 0 0
   123 1 1 0 123 0 0 0 123 0 1 1 124 1 0 0 124 0 0 1 124 0 0 0
   125 1 1 0 125 0 1 0 125 0 0 0 126 1 1 1 126 0 0 0 126 0 0 0
   127 1 1 0 127 0 0 1 127 0 0 0 128 1 0 1 128 0 1 0 128 0 0 0
   129 1 0 0 129 0 0 0 129 0 1 1 130 1 0 0 130 0 0 0 130 0 0 0
   131 1 0 0 131 0 0 0 131 0 0 1 132 1 1 0 132 0 0 0 132 0 0 1
   133 1 0 1 133 0 0 0 133 0 0 0 134 1 0 0 134 0 1 0 134 0 0 1
   135 1 1 0 135 0 1 1 135 0 0 0 136 1 0 0 136 0 0 0 136 0 0 0
   137 1 0 0 137 0 0 0 137 0 0 1 138 1 1 0 138 0 0 0 138 0 0 0
   139 1 0 0 139 0 0 0 139 0 0 0 140 1 0 0 140 0 0 1 140 0 1 1
   141 1 1 1 141 0 0 0 141 0 0 1 142 1 1 0 142 0 0 0 142 0 0 0
   143 1 0 0 143 0 0 1 143 0 1 1 144 1 1 1 144 0 0 1 144 0 0 1
   145 1 1 0 145 0 0 1 145 0 0 0 146 1 1 0 146 0 1 0 146 0 0 0
   147 1 0 1 147 0 0 0 147 0 0 1 148 1 0 0 148 0 0 1 148 0 0 0
   149 1 1 0 149 0 1 0 149 0 1 0 150 1 1 1 150 0 0 0 150 0 0 1
   ;
run;
proc logistic data=flu;
   strata matchID;
   model flu(event='1')=lungdisease vaccine lungdisease*vaccine/aggregate expb;
run;
proc logistic data=flu;
   strata matchID;
   model flu(event='1')=lungdisease/expb;
run;

title "Kappa Statistic";
data beefconsumption;
input survey1 $ survey2 $ count @@;
datalines;
less less 136 less more  92
more less  69 more more 240 
;;
proc freq order=data; weight count; tables survey1*survey2/agree;
run;


