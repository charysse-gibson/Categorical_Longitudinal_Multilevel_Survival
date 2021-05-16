/* DELETE Observations */
*A way to restrict row...
Using Conditional Execution to Delete Rows;

/* Syntax */
IF expression THEN DELETE;

/* Example */
libname BST5030 '/folders/myfolders/Project Data Sets';
data lipid;
  set bst5030.lipid_ext;
  bmi = round((weight/(height**2))*703,.1);
  if BMI < 25 then DELETE;
run;

proc print data=lipid(obs=8);
  var name age gender weight height BMI;
run;

