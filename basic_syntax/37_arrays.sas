/* Arrays */

	*You can use arrays to simplify programs that:
		- perform repetitive calculations
		- create many variables with the same attributes
		- read data
		- rotate SAS data sets by making variables into observations or observations into variables
		- compare variables
		- perform a table lookup;
		
	* Each value in an array is called an element identified by a subscript that represents the position of the element in the array.

	* The ARRAY statement
		- must contain all numeric or all character elements
		- must be used to define an array before the array name can be referenced
		- creates variables if they do not already exist in the PDV (Program Data Vector)

 	 Syntax:
   		* ARRAY array-name [subscript] <$> <length> <array-elements> <(initial-value-list)>; 
   		* DO index-variable=1 TO number-of-elements-in-array; 
   		  *additional SAS statements using array-name[index-variable] 
 		  END;
 		  
 	* Notes:
 		You can use the keyword _TEMPORARY_ in an ARRAY statement to indicate that the elements are not needed in the output data set.;


/* Example */
data reverse;
  input name $ q1-q10;
  array q[*] q1-q10;
  do i=1,3,5,6,8,10;
    q[i]=6-q[i];
  end;
  average=mean(of q1-q10);
  drop i;
datalines;
John 5 5 5 5 5 1 1 1 1 1
Ron 1 1 1 1 1 5 5 5 5 5 
;
run;
proc print data=reverse;
run;

/* Performing a Table Lookup */
data compare(drop=i);
   set prog2.donate;
   array Contrib[4] Qtr1-Qtr4;
   array Diff[4];
   array Goal[4] _temporary_ (10,15,5,10);
   do i=1 to 4;
      Diff[i]=Contrib[i]-Goal[i];
   end;
run;
proc print data=compare noobs;
run;

/* Example of repetitive calculations */
DATA avgcelsius;
    input City $ 1-17 jan feb mar apr may jun 
                      jul aug sep oct nov dec;
DATALINES;
Scheoct Square   -2 -2  2  8 14 19 21 20 16 10  4 -1
Upper North Yoad 20 20 22 23 26 27 28 28 27 26 23 20
Lower Yarcesk    -1  1  6 13 18 23 26 25 21 15  7  1
Dashoc South     11 13 16 20 23 27 27 27 26 21 16 12
East Swiollam    -8 -5  0  7 14 19 22 20 16 10  2 -5
Upper Slullus    10 12 16 20 23 27 28 28 26 21 16 12
Lower Dalin      12 14 16 21 26 31 33 32 30 23 16 12
Little Suhect     5  6  7 10 13 16 18 18 16 12  8  6
Treammatmid      10 12 12 13 14 15 15 16 17 16 14 11
Sluggaccult      13 14 15 16 17 19 21 22 21 19 16 14
;
RUN;

/* No Using Arrays */
DATA avgfahrenheit;
    set avgcelsius;
    janf = 1.8*jan + 32;    
    febf = 1.8*feb + 32;
    marf = 1.8*mar + 32;  
    aprf = 1.8*apr + 32;
    mayf = 1.8*may + 32;  
    junf = 1.8*jun + 32;
    julf = 1.8*jul + 32;  
    augf = 1.8*aug + 32;
    sepf = 1.8*sep + 32;  
    octf = 1.8*oct + 32;
    novf = 1.8*nov + 32;  
    decf = 1.8*dec + 32;
    drop jan feb mar apr may jun 
    jul aug sep oct nov dec;
RUN;

/* Using Arrays */
DATA avgfahrenheit1;
    set avgcelsius;
      array fahr(12) jan feb mar apr may jun
                   jul aug sep oct nov dec;
      do i = 1 to 12;
            fahr(i) = 1.8*fahr(i) + 32;      
    end;
RUN;

/* Using * */

		*An alternate syntax uses an asterisk instead of a subscript. 
		SAS determines the subscript by counting the variables in the 
		element-list. The element-list must be included.;

DATA avgfahrenheit2;
    set avgcelsius;
      array fahr(*) jan feb mar apr may jun
                   jul aug sep oct nov dec;
      do i = 1 to 12;
            fahr(i) = 1.8*fahr(i) + 32;      
    end;
RUN;


/* using numbered range list */
DATA avgcelsius_new;
    input City $ 1-17 m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12;
    DATALINES;
Scheoct Square   -2 -2  2  8 14 19 21 20 16 10  4 -1
Upper North Yoad 20 20 22 23 26 27 28 28 27 26 23 20
Lower Yarcesk    -1  1  6 13 18 23 26 25 21 15  7  1
Dashoc South     11 13 16 20 23 27 27 27 26 21 16 12
East Swiollam    -8 -5  0  7 14 19 22 20 16 10  2 -5
Upper Slullus    10 12 16 20 23 27 28 28 26 21 16 12
Lower Dalin      12 14 16 21 26 31 33 32 30 23 16 12
Little Suhect     5  6  7 10 13 16 18 18 16 12  8  6
Treammatmid      10 12 12 13 14 15 15 16 17 16 14 11
Sluggaccult      13 14 15 16 17 19 21 22 21 19 16 14
;
RUN;
DATA avgfahrenheit3;
    set avgcelsius_new;
      array fahr(*) m1-m12;
      do i = 1 to 12;
            fahr(i) = 1.8*fahr(i) + 32;      
    end;
RUN;

DATA avgfahrenheit4;
    set avgcelsius;
      array fahr(*) _NUMERIC_;
      do i = 1 to 12;
            fahr(i) = 1.8*fahr(i) + 32;      
    end;
RUN;


/* DIM Function */
	*The DIM function returns the number of elements in an array. 
	 This value is often used as the stop value in a DO loop.;

data survey;
   INPUT subj q1 q2 q3 q4 q5 q6;
   DATALINES;
   1001 1 2 1 2 1 1
   1002 2 1 2 2 2 1
   1003 2 2 2 1 . 2
   1004 1 . 1 1 1 2
   1005 2 1 2 2 2 1
   ;
run;

/*array bounds */
DATA survey1 (DROP = i);
set survey;
   ARRAY qxs(4) q3-q6;
   DO i = 1 to dim(qxs);
      qxs(i) = qxs(i) - 1;
   END;
RUN;

DATA survey3 (DROP = i);
set survey;
   ARRAY qxs(*) q3-q6;
   DO i = lbound(qxs) to hbound(qxs);
      qxs(i) = qxs(i) - 1;
   END;
RUN;


/* Creating Variables with Arrays */
data percent(drop=i);              
   set bst5030.employee_donations;
   array Contrib{4} qtr1-qtr4;
   array Percent{4};
   Total=sum(of contrib{*});           
   do i=1 to 4;     
      percent{i}=contrib{i}/total;
   end;                               
run; 

proc print data=percent noobs;
   var Employee_ID percent1-percent4;
   format percent1-percent4 percent6.;
run;

