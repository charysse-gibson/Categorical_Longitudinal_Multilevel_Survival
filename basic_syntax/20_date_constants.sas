/* DATE CONSTANTS */

	*dd = a one- or two-digit value for the day.
 	 MMM = a three-letter abbreviation for the month (JAN, FEB, MAR, and so on).
  	 yyyy = a four-digit value for the year.
  	 d = required to convert the quoted string to a SAS date.

Example;
data icd9data;
  set bst5030.icd9data;
  where date_visit > '14dec2000'd;
run;

proc print data=icd9data;
  format date_visit Date9.;
run;
