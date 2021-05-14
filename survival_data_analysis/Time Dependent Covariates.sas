/*A study was conducted to investigate the differences in survival experience between two methadone treatment programs* 
**(Clinic 1 versus 2). The outcome variable is the number of days patients spend in a methadone treatment program.***** 
**The event (0=censored, 1=departed from clinic) is dropping out of the program and the observation is censored *******
**if the patient transferred to another program or survived to the end of the study . The predictor variables that are** 
**believed to affect survival time are prison record (0=no, 1=yes) and methadone dose (mg/day). ***********************/
data methadone;
   input PatientID Clinic Status Time Prison Dose ;
datalines;
1      1      1      428      0      50
2      1      1      275      1      55
3      1      1      262      0      55
4      1      1      183      0      30
5      1      1      259      1      65
6      1      1      714      0      55
7      1      1      438      1      65
8      1      0      796      1      60
9      1      1      892      0      50
10     1      1      393      1      65
11     1      0      161      1      80
12     1      1      836      1      60
13     1      1      523      0      55
14     1      1      612      0      70
15     1      1      212      1      60
16     1      1      399      1      60
17     1      1      771      1      75
18     1      1      514      1      80
19     1      1      512      0      80
21     1      1      624      1      80
22     1      1      209      1      60
23     1      1      341      1      60
24     1      1      299      0      55
25     1      0      826      0      80
26     1      1      262      1      65
27     1      0      566      1      45
28     1      1      368      1      55
30     1      1      302      1      50
31     1      0      602      0      60
32     1      1      652      0      80
33     1      1      293      0      65
34     1      0      564      0      60
36     1      1      394      1      55
37     1      1      755      1      65
38     1      1      591      0      55
39     1      0      787      0      80
40     1      1      739      0      60
41     1      1      550      1      60
42     1      1      837      0      60
43     1      1      612      0      65
44     1      0      581      0      70
45     1      1      523      0      60
46     1      1      504      1      60
48     1      1      785      1      80
49     1      1      774      1      65
50     1      1      560      0      65
51     1      1      160      0      35
52     1      1      482      0      30
53     1      1      518      0      65
54     1      1      683      0      50
55     1      1      147      0      65
57     1      1      563      1      70
58     1      1      646      1      60
59     1      1      899      0      60
60     1      1      857      0      60
61     1      1      180      1      70
62     1      1      452      0      60
63     1      1      760      0      60
64     1      1      496      0      65
65     1      1      258      1      40
66     1      1      181      1      60
67     1      1      386      0      60
68     1      0      439      0      80
69     1      0      563      0      75
70     1      1      337      0      65
71     1      0      613      1      60
72     1      1      192      1      80
73     1      0      405      0      80
74     1      1      667      0      50
75     1      0      905      0      80
76     1      1      247      0      70
77     1      1      821      0      80
78     1      1      821      1      75
79     1      0      517      0      45
80     1      0      346      1      60
81     1      1      294      0      65
82     1      1      244      1      60
83     1      1      95       1      60
84     1      1      376      1      55
85     1      1      212      0      40
86     1      1      96       0      70
87     1      1      532      0      80
88     1      1      522      1      70
89     1      1      679      0      35
90     1      0      408      0      50
91     1      0      840      0      80
92     1      0      148      1      65
93     1      1      168      0      65
94     1      1      489      0      80
95     1      0      541      0      80
96     1      1      205      0      50
97     1      0      475      1      75
98     1      1      237      0      45
99     1      1      517      0      70
100    1      1      749      0      70
101    1      1      150      1      80
102    1      1      465      0      65
103    2      1      708      1      60
104    2      0      713      0      50
105    2      0      146      0      50
106    2      1      450      0      55
109    2      0      555      0      80
110    2      1      460      0      50
111    2      0      53       1      60
113    2      1      122      1      60
114    2      1      35       1      40
118    2      0      532      0      70
119    2      0      684      0      65
120    2      0      769      1      70
121    2      0      591      0      70
122    2      0      769      1      40
123    2      0      609      1      100
124    2      0      932      1      80
125    2      0      932      1      80
126    2      0      587      0      110
127    2      1      26       0      40
128    2      0      72       1      40
129    2      0      641      0      70
131    2      0      367      0      70
132    2      0      633      0      70
133    2      1      661      0      40
134    2      1      232      1      70
135    2      1      13       1      60
137    2      0      563      0      70
138    2      0      969      0      80
143    2      0      1052     0      80
144    2      0      944      1      80
145    2      0      881      0      80
146    2      1      190      1      50
148    2      1      79       0      40
149    2      0      884      1      50
150    2      1      170      0      40
153    2      1      286      0      45
156    2      0      358      0      60
158    2      0      326      1      60
159    2      0      769      1      40
160    2      1      161      0      40
161    2      0      564      1      80
162    2      1      268      1      70
163    2      0      611      1      40
164    2      1      322      0      55
165    2      0      1076     1      80
166    2      0      2        1      40
168    2      0      788      0      70
169    2      0      575      0      80
170    2      1      109      1      70
171    2      0      730      1      80
172    2      0      790      0      90
173    2      0      456      1      70
175    2      1      231      1      60
176    2      1      143      1      70
177    2      0      86       1      40
178    2      0      1021     0      80
179    2      0      684      1      80
180    2      1      878      1      60
181    2      1      216      0      100
182    2      0      808      0      60
183    2      1      268      1      40
184    2      0      222      0      40
186    2      0      683      0      100
187    2      0      496      0      40
188    2      1      389      0      55
189    1      1      126      1      75
190    1      1      17       1      40
192    1      1      350      0      60
193    2      0      531      1      65
194    1      0      317      1      50
195    1      0      461      1      75
196    1      1      37       0      60
197    1      1      167      1      55
198    1      1      358      0      45
199    1      1      49       0      60
200    1      1      457      1      40
201    1      1      127      0      20
202    1      1      7        1      40
203    1      1      29       1      60
204    1      1      62       0      40
205    1      0      150      1      60
206    1      1      223      1      40
207    1      0      129      1      40
208    1      0      204      1      65
209    1      1      129      1      50
210    1      1      581      0      65
211    1      1      176      0      55
212    1      1      30       0      60
213    1      1      41       0      60
214    1      0      543      0      40
215    1      0      210      1      50
216    1      1      193      1      70
217    1      1      434      0      55
218    1      1      367      0      45
219    1      1      348      1      60
220    1      0      28       0      50
221    1      0      337      0      40
222    1      0      175      1      60
223    2      1      149      1      80
224    1      1      546      1      50
225    1      1      84       0      45
226    1      0      283      1      80
227    1      1      533      0      55
228    1      1      207      1      50
229    1      1      216      0      50
230    1      0      28       0      50
231    1      1      67       1      50
232    1      0      62       1      60
233    1      0      111      0      55
234    1      1      257      1      60
235    1      1      136      1      55
236    1      0      342      0      60
237    2      1      41       0      40
238    2      0      531      1      45
239    1      0      98       0      40
240    1      1      145      1      55
241    1      1      50       0      50
242    1      0      53       0      50
243    1      0      103      1      50
244    1      0      2        1      60
245    1      1      157      1      60
246    1      1      75       1      55
247    1      1      19       1      40
248    1      1      35       0      60
249    2      0      394      1      80
250    1      1      117      0      40
251    1      1      175      1      60
252    1      1      180      1      60
253    1      1      314      0      70
254    1      0      480      0      50
255    1      0      325      1      60
256    2      1      280      0      90
257    1      1      204      0      50
258    2      1      366      0      55
259    2      0      531      1      50
260    1      1      59       1      45
261    1      1      33       1      60
262    2      1      540      0      80
263    2      0      551      0      65
264    1      1      90       0      40
266    1      1      47       0      45
;
run;

data methadone1;
   set methadone;
   cliniccens=compress(clinic||status);
   *some combinations caused by the missing values in the two variables;
   if cliniccens= ".2" or cliniccens eq ".1" then delete; 
run;

proc format;
   value $cliniccensor 10='Clinic 1 Censored'
                 11='Clinic 1 Event'
                 20='Clinic 2 Censored'
                 21='Clinic 2 Event';
run;

***Practice exercise 1;
proc phreg data=methadone1; 
   model time*status(0) = clinic dose prison /ties=efron;
   output out=methadone2 ld=likedisp lmax=lmaxdisp survival=surv;
   title 'Detecting Outliers and Influential Observations';
run;

proc sgplot data=methadone2;
	scatter y=likedisp x=surv /group=cliniccens;
	format cliniccens $cliniccensor.;
	yaxis label='LD' grid;
	refline 0 /axis=y;
	title 'Assessment Plot of the LD Statistic by Survival Probabilities';
run;

proc sort data=methadone2; 
	by descending likedisp;
run;

proc print data=methadone2 (obs=10); 
	var patientid likedisp dose clinic prison; *id=1;
run;

proc sort data=methadone2; 
	by descending lmaxdisp;
run;

proc sgplot data=methadone2;
	scatter y=lmaxdisp x=surv /group=cliniccens;
	format cliniccens $cliniccensor.;
	yaxis label='L-Max' grid;
	refline 0 /axis=y;
	title 'Assessment Plot of the LMAX Statistic by Survival Probabilities';
run;

proc sort data=methadone2; 
	by descending lmaxdisp;
run;

proc print data=methadone2 (obs=10); 
	var patientid lmaxdisp dose clinic prison; *id=1;
run;

/***Practice exercise 2  NOT USED;
proc phreg data=methadone1; 
   model time*status(0) = clinic dose prison /ties=efron;
   output out=methadone2 		
            resdev=deviance xbeta=Xb;	
   title 'Detecting Outliers and Influential Observations';
run;
proc sgplot data=methadone2;
	scatter  y=deviance  x=Xb /group=cliniccens;
	format cliniccens $cliniccensor.;
	yaxis label='Deviance Residuals of Linear Predictors' grid;
	refline 0 /axis=y;
	title 'Assessment Plot of Deviance Residuals';
run;
proc sort data=methadone2; by deviance;
proc print data=methadone2 (obs=10); var patientid deviance dose clinic prison; where deviance ne .; 
run;
proc sort data=methadone2; by descending deviance;
proc print data=methadone2 (obs=10); var patientid deviance dose clinic prison;  
run;
*/

***Practice exercise 2;
proc phreg data=methadone1; 
   	model time*status(0) = dose /ties=efron;
   	output out=methadone2 		
    ressco= scoredose 
	dfbeta= dfdose;		
   	title 'Detecting Outliers and Influential Observations';
run;

proc sgplot data=methadone2;
	scatter  y=scoredose  x=dose /group=cliniccens;
	format cliniccens $cliniccensor.;
	yaxis label='Score Residuals of dose' grid;
	refline 0 /axis=y;
	title 'Assessment Plot of Score Residuals';
run;

*look at most extreme from both sides (ascending & descending);
proc sort data=methadone2; 
	by scoredose;
run;

proc print data=methadone2 (obs=5); 
	var patientid scoredose dose; 
	where scoredose ne . ; *id=1;
run;

proc sort data=methadone2; 
	by descending scoredose;
run;

proc print data=methadone2 (obs=5); 
	var patientid scoredose dose; *id=1;
run;

**DFBETA: specifies the approximate change in the parameter estimates (b � bj ) when the jth observation is omitted. 
**a negative sign for a DFBETA means that the estimate increases when the observation is removed; 
proc sort data=methadone2;
	by dfdose;
run;

proc print data=methadone2 (obs=5); 
	var patientid dfdose dose; 
	where dfdose ne . ; 
	title 'Assessment Plot of DFBETA';
run;

proc sort data=methadone2; 
	by descending dfdose;
run;

proc print data=methadone2 (obs=5); 
	var patientid dfdose dose; 
	title 'Assessment Plot of DFBETA';
run;

***Practice exercise 3***;
***Finding 95th percentile of the distribution;
proc phreg data=methadone1; 
   model time*status(0) = clinic dose prison /ties=efron;
   output out=methadone2 lmax=lmax survival=surv;
   title 'Detecting Outliers and Influential Observations';
run;

proc rank data=methadone2 groups=20 out=ranks; *Bin the ranks into 20 groups, 5% in each;
   var lmax;
   ranks lmaxgroup; *Assign new names to var of maxdisp; 
run;

proc sort data=ranks; 
   by descending lmaxgroup decending lmax; 
run;

proc print data=ranks;
   where lmaxgroup=19; **Print top 5% patients in each var;
   var PatientID lmax time status surv clinic dose prison;
   id lmaxgroup;
   title 'Observations with Possible Outlying Covariate Patterns';
run;
