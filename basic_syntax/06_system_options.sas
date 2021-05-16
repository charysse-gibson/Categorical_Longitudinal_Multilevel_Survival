*SYSTEM OPTIONS

to change the appearance of a report;

Options _____;

*Types of options include:
	DATE (default) - specifies to print the date and time the SAS session began at top of SAS output
	NODATE - specifies not to print the date and time
	LINESIZE= width - specifies the ilne size for the SAS log and SAS output
		or LS= width
	PAGESIZE= n - specifies the number of lines (n) that can be printed per page of SAS output
		or PS= n
	NUMBER (default) - page number printed on each page of output
	NONUMBER - page numbers not printed
	PAGENO= n - specifies beginning page number (n) fr the next page of SAS output
;
		
options nodate nonumber ls=72;
