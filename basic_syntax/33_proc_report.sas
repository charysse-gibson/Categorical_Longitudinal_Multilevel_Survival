/* Start */

Data Lipid_Ext;
set '/folders/myfolders/Project Data Sets/lipid_ext.sas7bdat';
run;
proc contents data=lipid_ext;
run;

/* Proc Print */

proc Print data=lipid_ext;
Var Name Gender Age Weight Cholesterol Triglycerides HDL LDL PercentIdeal Height Skinfold SystolicBP DiastolicBP Exercise Coffee Smoking Alcohol HeartDisease;
Title 'Lipid_Ext Data Display Using Proc Print';
RUN;

/* Proc Report */

proc report data=lipid_ext;
columns Name Gender Age Weight Cholesterol Triglycerides HDL LDL PercentIdeal Height Skinfold SystolicBP DiastolicBP Exercise Coffee Smoking Alcohol HeartDisease;
Title 'Lipid_Ext Data Display Using Proc Report';
RUN;

/* Proc Report Group Across */

proc report data=lipid_ext (obs=15);
columns Name Gender Age Weight Cholesterol Triglycerides HDL LDL PercentIdeal Height Skinfold SystolicBP DiastolicBP Exercise Coffee Smoking Alcohol HeartDisease;
define Gender / Across;
define Age / Group;
Title 'Lipid_Ext Data Display Using Proc Report (Gender Across, Age Group)';
RUN;

/* Proc Report Lineskip after group */

proc report data=lipid_ext (obs=15);
columns Name Gender Age Weight Cholesterol Triglycerides HDL LDL PercentIdeal Height Skinfold SystolicBP DiastolicBP Exercise Coffee Smoking Alcohol HeartDisease;
define Gender / Across;
define Age / Group;
Compute after Age;
Line ''; 
endcomp;
Title 'Lipid_Ext Data Display Using Proc Report (Age Lineskip with Compute and Endcomp)';
RUN;

/* Proc Report Lineskip with Summary */

proc report data=lipid_ext (obs=15);
columns Name Gender Age Weight Cholesterol Triglycerides HDL LDL PercentIdeal Height Skinfold SystolicBP DiastolicBP Exercise Coffee Smoking Alcohol HeartDisease;
define Gender / Across;
define Age / Group;
Break after Age / Summarize;
Title 'Lipid_Ext Data Display Using Proc Report (Lineskip with Summary)';
RUN;

/* Proc Report Color Coded */

proc report data=lipid_ext (obs=15)
Style(Report)=[Backgroundcolor=Purple]
Style(Column)=[Backgroundcolor=GreenYellow]
Style(Header)=[Backgroundcolor=Brpk];
columns Name Gender Age Weight Cholesterol Triglycerides HDL LDL PercentIdeal Height Skinfold SystolicBP DiastolicBP Exercise Coffee Smoking Alcohol HeartDisease;
define Gender / Across;
define Age / Group;
Break after Age / Summarize;
Title 'Lipid_Ext Data Display Using Proc Report (Output Color Coded)';
RUN;

/* Proc Report ODS environment */

proc report data=lipid_ext (obs=15)
Style(Report)=[Backgroundcolor=Purple]
Style(Column)=[Backgroundcolor=GreenYellow]
Style(Header)=[Backgroundcolor=Brpk];
columns Name Gender Age Weight Cholesterol Triglycerides HDL LDL PercentIdeal Height Skinfold SystolicBP DiastolicBP Exercise Coffee Smoking Alcohol HeartDisease;
define Gender / Across;
define Age / Group;
Break after Age / Summarize;
Title 'Lipid_Ext Data Display Using Proc Report (Output Color Coded)';
RUN;
ods html close;
ods pdf close;
ods rtf close;


