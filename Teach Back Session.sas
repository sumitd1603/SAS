/* What Is SAS?
SAS is a data analytic enterprise software. It is not an open source where any user can contribute to the 
program at a granular level. All functions are predefined and there is restrictions to use. However, the syntax 
SAS uses is much simpler English as compared to other softwares. SAS was incepted in 1976 by a bunch of 
American Statisticians Jim Goodnight, Jim Barr, Jane Helwig and John Sall. SAS helps in analyzing data and 
creating statistical models for better inferences on the data analyzed.
*/

/* How does SAS work?
SAS no exception when it comes to following rules in any language. It mainly depends on accuracy of grammar
and logic of the statement being asked to act upon. There are only 2 major functions in SAS:-
1) Data:-
* It creates and manipulates data for working.
* Creates a blank dataset.
* Default library is "Work" library which is temporary library unless specified a particular library.
* Input is a vital statement in creating and manipulating a data. The following process happens in an Input statement under the hoot:-
 # It creates 2 slots in the memory:
  - Progrgram Data Vector: SAS creates multiples slots (Specifically; No. of variables +2). 
                           Apart from variables the two additional slots SAS creates to perform quality check to read the data are:-
  						  ! _n_: An internal counter for data while reading the number of records mentioned.
  						  ! _error_: A binary flag (0,1) raised to "1" in case of an error for that particular line, irrespective of 
  						            number of lines.
  						  ! Example: if an error occurs in line 55 then _n_= 55 & _error_=1.
  - Descriptor: Where all the attributes of a SAS variables are stored.
2) Proc:-
* Procedure step helps us to analayze the data.
* It helps us in getting more understanding the data variables 

Inside working of any statement follows these broad steps:
1) Processes from left to right in a serial order.
2) Reads each line unless Highlighted.
3) Checks for statement following proper grammar (syntax) and logic (semantic).
4) Displays the output or error based upon the findings.
*/

/* What are the Methods of creating a SAS Dataset? 
A SAS Dataset can be created in 3 ways:-
a) By creating from scratch a raw data set feeding values using Datalines statemnt
b) By importing a flatfile of various formats, Eg. CSV, XLS, TXT.
c) By altering an existing dataset.
 */

/* What is the importance of Log?
The log section in SAS program acts as guidelines. It helps us to understand where and what type of error has been committed.
It even informs us about the time and resources of our machine being used to carry out a statement/ set of statements.*/


/* What are the Attributes of SAS Variables?
SAS attributes helps in defining a SAS variable. Following are the list of attributes:-
# Name:
	- It should start with either an English Alphabet or an '_'
	- It can contain numbers except the first position
	- It can not have any special character except an '_' not even space
	- It cannot exceed 32 characters; default 8 bytes.
	Note: Same rules apply while naming a SAS data set.
# Type:
    - Character: having alphabets and is denoted by a "$". To refer a character variable in some statements we use -> ""
    - Numeric: Having number which requires no denoting symbol. By default all Variables are numeric.
# Length: 
    - The range under which name should be. By default it is 8 Bytes -> 7-8 characters or 13-14 numbers
    - However it can be increased to 32 Bytes
    - In order to increase length use -> Length statement after data statement and before SET statement. 
      As once the attributes are set in the blank dataset they cannot be overwritten.
    - If the length of any variable name exceeds the predefined length then output will omit the remaining characters
      EG.:
      Data cars;
      length model $32. ;
      input model $ origin $ price;
      datalines;
      hyundai asia 325000
      maruti  asia 250000
      ;
      run;
# Label: 
    - Contains information about the variable it's been associated with.
    - None of the rules pertaining to naming a SAS variable is applicable to Label.
      Eg.
      data wrestling;
      length name $20.;
      input name $ ht wt rank;
      label ht = "height in feets"
            wt = "weight in kgs";
      datalines;
      hulk 6 150 3
      rock 6 140 2
      goldberg 6 145 1
      ;
      run;
      
      proc contents data = wrestling;
      run;
# Informat:
   - This attribute defines how the variables are to be read by the PDV in SAS software. For eg. Date, currency etc
   # Note-> in any case, informat requires a width to be set.
   Eg. Date
   Data date;
   input id dob mmddyy10.;
   datalines;
   101 01/01/2001
   # Note -> In the above instance we will get the date output as calculated number of days from default value "01-Jan-1960" "MMDDYYYY" format.
          -> For dates 01-01-1960 = 0; 01-02-1960=2; 12/31/1959= -1.
          -> In case of currency for instance if we set the width to 8 then it will read 8 places before decimal point. 
   Eg. Currency
   Data dollar;
   input id & salary dollar8.;
   datalines;
   001 50000000
   ;
   run;
   
   Note -> in the above eg. we have set the width to 8 and no decimal value
# Format:
  - Format helps in delivering a customized output format for better human readability.
  Eg: Date
  Data Date;
  input id dob mmddyy10.;
  format dob mmddyy10.;
  datalines;
  101 01/01/2021
  ;
  run;
  
  Eg: Date 2
  Data Date_2;
  input id dob mmddyyyy10.;
  format dob ddmmyyyy10.;
  datalines;
  102 02/02/2020
  ;
  run;
  Note -> Format statement is for the delivering the output so it can be customized as per the user.
  
  EG: Currency
  Data Dollar;
  input job_id $ Salary dollar8.2;
  format Salary dollar8.2;
  Datalines;
  001 51000000
  ;
  run;
  Note -> In the currency example it displays value in total of 8 characters but last 2 positions are reserved for decimals.
  
  <Revision>
  Eg. Creating a dataset with all attributes.
  Data revision;
  length name $32. place$20. pet $10. cars $10.;
  input name  place  dob mmddyy10. pet cars salary dollar10.2;
  format dob date9. salary dollar10.2;
  Label salary = "Monthly Salary";
  datalines;
  Maninder Goa 01/02/1995 dog Honda 35000.00
  Josh Trichy 10/10/1992 cat Toyota 30000.00
  Anna Delhi 03/28/1998 rabbit Maruti 45000.00
  Emma Surat 04/12/1999 bear Tata 51000.00
  ;
  run;
  
  Proc contents data=revision;
  run;
  
 */

/* What constitues a skeleton of any SAS program?
The skeleton or the template of a SAS program is mainly predefined. The nature of the template is based on the "Data" or the "Proc".
The key codes are predefined as SAS is a blackbox coding analytic platform which does not empower a user to create new codes.
Each line of code needs to end with ";".
Each program needs to end with a "run;" statement.
For Data Step:
- Start with "Data" followed by dataname (you provide)
- Incase of an existing data we use "Set" followed by the (libraryname.dataname)
-
*/
 
 
/* Analogy (Course of teaching)
Consider you(SAS program) have been given an errand (codes) by your mother(USER) to buy groceries from a local supermarket.
You have been given the complete list of products & money(resources) that you require to buy. So now you enter the supermarket. 
Take a cart and see that first item on your list is a dozen Granny Smith variant of Apple to be bought. So you move to the fruits 
section. Check for apples and browse closely for Granny Smith's type. You pick a dozen and put them in your cart. 
So if I was to relate with SAS code functioning here:
You entered the supermarket -> Create a blank data
You take a cart -> input step
You looked at your list of items to be purchased -> program data vector step
You go to fruit section and check for the Specific apples -> Descriptor step
You pick the apples and put them in your cart -> Output display
All thinking and action you carry out mentally -> log entries


/* LIBRARY
Library is a very important element in order to store and recall a data we work with. It is primary set of alphabets we give before naming 
the data. It is followed by -"."
By default our data is saved in "WORK" library and it is temporary in nature. By temporary I mean once we have finished the 
session and logout from the environment we will lose the data.
There are two ways to create a library:
Method I:
- Right Click on the Folder you wish to create a Library under Server Files and Folders drop down menu to the left of the screen
- Select create then click on Library
- Name the library
- Check the "Re-Create this library at startup" to make the library permanent.
- Click OK.

Method II
- Type "libname" followed by (library name) and in single quotes (adress where you want the library to be) followed by ";"
- Type "run;"

EG:
libname sumit '/home/u57898555';
run;

Note: In Method II library created is temporary. One needs to save data for it to re-appear on startup.
*/

/* Folder
Folders are the sub-section under library where you save your. It helps to recall the data or program you save.
To create a folder:
- Right click on the library you want the folder to be in
- Select "Create"
- Select "Folder"
- Click Ok
*/
 
*/ Comments
Comment are notes we type for our reference which the software overlooks while running the program.
It can be done in the following manners:
- press -> ctrl + /
- type -> /* */
*/

/* Retain Function
The purpose of a Retain Function is to maintain a particular order.
Eg.
data employee;
retain job_id name $ age experience;
length name $32.;
input job_id name $ age experience;
datalines;
AD001 Andy 27 2
CA002 Djovak 35 5
;
run;
*/
 
/* "Keep" & "Drop" Functions
Keep & Drop Functions helps us to select variables either to include or exclude in the output respectively.
It does not have to do anything with the order.
The use of this function depends on the number of variables to include or exclude.
Keep & Drop function can be used as an independent statement or even as an option depending on the use.
Eg. KEEP as a Satement

 Data keep_stat;
 length name $20. place $15.;
 retain name age place country;
 keep name place;
 input name $ place $ country $ age;
 datalines;
 Suraj Mumbai India 35
 Sam Hongkong China 38
 Martha Colombo Sri_Lanka 40
 Betty Brisbane Australia 28
 ;
 run;

Eg. KEEP as an option

Data cars;
set sashelp.cars (keep= origin msrp);
run;

Eg.DROP as a Satement

data tourist;
retain name place Date_Of_Journey cost;
length name $30. place $20.;
label cost = "Cost per trip";
drop age;
input name $ age place $ Date_Of_Journey ddmmyy10. cost dollar8.;
format Date_of_Journey ddmmyy10. cost dollar8.;
datalines;
Rita 40 Paris 11/04/2021 25000
Marcos 35 London 12/05/2021 35000
Ansari 25 Cairo 02/05/2019 20000
;
run;

Eg. DROP as an option

Data class;
set sashelp.class (drop= age);
run;
*/


/* Adding data to an existing dataset
There are different methods depending on the number of information one needs to add to an existing dataset.
Method I
When you want to feed less number of data to the end of the file.

data add_class;
set sashelp.class end= eof;
output;
if eof then do;
Name = 'Jason';
Sex = 'M';
Age = 12;
Height = 56;
Weight = 85;
output;
end;
run;

Method II
If there are multiple data records stored in different data sets
data empployee;
length id $3. name $30. department $30. ;
input id $ name $ age department $ salary dollar8.;
format salary dollar8.;
datalines;
001 Aaron 35 Accounts 20000
002 Maria 28 HR 18000
003 Rosy 30 Marketing 25000
;
run;

data employee_2;
length id $3. name $30. department $30.;
input id $ name $ age department $ salary dollar8.;
format salary dollar8.;
datalines;
004 Andrew 40 Research 40000
005 Gweyn 45 Administration 35000
;
run;

proc datasets;
append  base=empployee
        data=employee_2 appendver=v6;
       
run;

proc print data= employee_2;
run;

# Note
- The input variables attributes information needs to be the same.
- Use "If....Then" conditional statement to add new columns to data pertaining to particular set of records.

Method III
Using SQL to add data

 Data keep_stat;
 length name $20. place $15.;
 retain name age place country;
 input name $ place $ country $ age;
 datalines;
 Suraj Mumbai India 35
 Sam Hongkong China 38
 Martha Colombo Sri_Lanka 40
 Betty Brisbane Australia 28
 ;
 run;
 
proc sql;
insert into work.keep_stat
		set	name= "Madison",
			place= "Michigan" ,
			country= "USA" ,
			age= 55;
quit;

proc print data= work.keep_stat;
run;

*/
 
/* Creating a new Variable
Many a times we might need to create a part of findings from the data provided to us. With SAS it is very much possible.
By default the length will be decided by the number of characters in the variable but less than 32.
Eg:
data cars_discount;
set sashelp.cars;
Format Discount dollar8.2;
Discount = MSRP - Invoice;
run;
  */

/* Conditional Statements
Conditional statements are used for automation and quick facilitation of the output.
# DO loop
- This type of conditional statement checks if the condition is satisfied otherwise continues to perform the function till 
  the condition is satisfied.
- We need to provide "End" statement to break the loop.
- Output of each step is optional.
Eg.
data class_do;
set sashelp.class;
do wt_kg = weight*0.45;
output;
end;
run;

# If .. Else
This conditional statement is for cause and action statement. In other when one condition is satisfied then a particular outcome
is given and if the same condition is not satisfied then other output is given.

Eg:
data class_if;
set sashelp.class;
if height = 62 then Remarks= "Average";
else if height lt 62 then Remarks = "Short";
else Remarks = "Tall";
run;

Note -> The main difference between a "DO" loop and an "If...Else" statement is in "Do" loop the automation recursively occurs facilitating a 
        gradual progression of the initial condition till the desired output is provided. Whereas in "If.. Else" statement there is immediate 
        deciding output of the condition given.
*/
 
/* ARRAY 

Array is another automation tool for a seriess of variables to carry out same program. 
In array the input and output order of variable is very crucial.
What happens in the backend is:
- We define the array
- We provide the sequence of input variables
- The variables are processed 
- The output follows the same sequence as the input.

Eg:
Data log_price;
set sashelp.cars;
array log_in{2} MSRP Invoice;
array log_out{2} log_MSRP log_Invoice;
do i= 1 to 2;
log_out{i}= log(log_in{i});
end;
Keep Make Model MSRP Invoice log_MSRP log_Invoice;
run;

Eg: When we do not know the number of variables for array
data class_cap;
set sashelp.class;
array cap_in {*} _character_;
do i = 1 to dim(cap_in);
cap_in{i}= upcase(cap_in{i});
end;
drop i;
run;
*/


/* MACROS
Macros is an automation program used either for number of variables or for series of functions as per our choice.
Hence Macros can be of two types depending upon our utility.
Type I:
Macros Variable:
In this type we define a particular variable and store the recurring value into it. Then we recall the 
variable for faster processing of the data.
Eg:   Macro Variable Data & Class
%let data = sashelp.class;
%let class = sex;

proc freq data= &data;
tables &class;
run;

Type II:
Macro Function:
In this type we define variables and functions template. Then later we input values to variables which 
in return empowers us to automate the routine steps.
Eg:
Exploratory Data Analysis

%macro eda(input=  ,
           class= ,
           var  = );

proc contents data= &input;
run;

proc means data= &input nmiss;
run;

proc freq data= &input;
tables &class;
run;

proc univariate data= &input plots;
var &var;
run;

%mend;

%eda( input= sashelp.demographics ,
      class= region,
      var  = CONT);
*/
 
/* SAS SQL
SQL is a database management program. SQL stands for Structured Query Language. It is a relational database management tool which
has got it's own environment for doman specific language. In SAS we can consider it as a software within a software. SQL is used to
maintain a structured data. Eg: Excel

# To import a data
proc sql;
select * from sashelp.class;
quit;
run;
Note -> '*' defines all number of vasriable. We can limit number of variables as per our convenience by punching a value instead of '*'

# Limiting number of observations
proc sql outobs=10;
select * from sashelp.class;
quit;
run;

# Selecting a particular type from variables
proc sql;
select * from sashelp.class 
where Sex = "F" ;
quit;

run;
Note -> Where is a conditional statement when we want the output of a particular value.

# Creating a dataset from an existing dataset for a particular value group

proc sql;
create table class_age as
select Name, Sex, Age from sashelp.class 
where Sex = "F" ;
quit;
run;

# Adding a new variable to an existing Dataset
proc sql;
create table ratio as
select * from sashelp.class;
quit;
run;

proc sql;
alter table ratio add Ratio Num(4);
quit;
run;

proc sql;
update ratio set Ratio = Weight/Height;
select * from ratio;
Quit;
run;
Note -> For this example we have added a new variable "ratio" which is the ratio between Weight & Height.

/* VISUALIZATION
Visualization is a key tool for any data analyst to analyze data to comprehend better.
Eg: Box Plot
proc sgplot data=sashelp.fish;
vbox weight;
run;

Eg: Scatter Plot
proc sgplot data=sashelp.fish;
scatter x= species y=height;
run;

Eg: Line Graph
proc sgplot data=sashelp.fish;
title "Species By Height";
vline species/ response=height stat=mean markers;
keylegend ;
run;
*/

/* Saving results in pdf or other formats for future hardcopy/referncing
With this SAS command we can download reports and findings in desired format for future refernces and attachments.
Eg: 
ods pdf file='Summary univariate.pdf';
proc univariate data=sashelp.cars plots;
run;
ods pdf close;
*/


/* STATISTICAL TEST

“Rule is to use statistics for conversion of business problem to mathematical problem and the result obtained in mathematical form to be converted into business understanding.”
1)	Statistical Modelling -> data distribution
2)	Predictive Modelling -> 1. Regression 2. Classification. How outcome shapes up.
a)	Quantitative: Regression (Statistical Model)
b)	Categorical: Classification (Machine Learning)
3)	Model: Regression etc. A prototype or equation for relation between variables and defining rule for prediction purpose
4)	Metric: Standard Deviation, Mean etc. Metric measures.
5)	Machine Learning: learns from the data
a)	Abstraction
b)	Generalization
6)	Data Mining – Pattern recognition from the data
7)	Artificial Intelligence is automation -> neural network -> deep learning
8)	Data Science is cumulative process from acquiring data to deployment of model
9)	Data:
a)	Categorical – Continuous. 
i)	Nominal Data:  Based on specific attributes. Eg, ethnicity, gender, food habit, age group
ii)	Ordinal Data: Ranked Data. Eg, Likert Scale (Very Happy to Very Unhappy), semantic differential scale (On a scale of 1 to 5 rate)
b)	Quantitative  
i)	Discrete-
•	count data (easily counted), 
•	unit free, 
•	whole number
•	probability mass function -> Probability at a particular point.
ii)	Continuous- 
•	measured data, 
•	have units generally, without unit- percentage or ratio
•	can take decimal values
•	Probability density function -> for a range
10)	Parameters are Population variable
11)	Estimations are transition from statistics to parameters
12)	Statistics are sample variable
13)	Descriptive Statistics – summarizing data: measure of central tendency and measure of dispersion. Five points: minimum, first quartile, median, third quartile, maximum. Pertaining to Sample only
a)	Measure of central tendency: center or location of a distribution. Eg. Mean, Media or mode
b)	Measure of dispersion: Scattering of data. Distribution from the center of data. Eg. Standard Deviation, Variance, IQR
14)	Mean: Simple Average. Holistic Picture but affected by extreme values. Formula- sum of values/ number of values
15)	Median: Positional Average. Not a holistic picture but not affected by extreme values. Arrange the data in chronological order then N+1/2
16)	Mode: Maximum frequency
17)	Inter-Quartile range: Q3 -Q1
18)	Threshold: IQR*1.5 or IQR*3,12 from Q3 upper, 12 from less than Q1 lower.
19)	Standard Deviation: 3*SD=99.7% data in Normal distribution and 18*SD in case data does not follow a normal distribution (Using Chebyshev’s Theorem). Sum (x1-population mean)2 / n-1, where X1 Only continuous data.
20)	Variance: (standard deviation)2 . Sum of squared distances of data from the center of the data. Only continuous data.
21)	Values outside Threshold are outliers. Generally, 0.3%
22)	Inferential Statistics – statistics -> estimation and hypothesis testing -> population
23)	Statistical Tests:
-> Hypothesis testing is a very pivotal measure in establishing the fitness of a model. In this we benchmark a condition and check
   (Level of Significance => 0.05)
   if the model meets that particular condition or the converse of it.
   There are two types of Hypothesis tests:
   * Parametric - Involving population mean. Data should follow a normal distribution.
   * Non-Parametric- Involving Sample mean
   Eg: H0 (null hypothesis): The average weight of boys is more than average weight of girls in the class.
Note - In NULL Hypothesis the statement maintains it's status quo and no action needs to be taken once the result is significant
	   HA (Alternate Hypothesis): The average weight of boys is not more than average weight of girls in the class.
Note - In Alternate Hypothesis the statement does not maintains it's status quo and an action needs to be taken once the result
       is significant
-> The Errors arising out of faulty inferences of Hypothesis Testing:
- Type I error: Accepting False NULL Hypothesis (Controlled)
- Type II error: Rejecting True NULL Hypothesis (Not Controlled)
Note -> The gravity of these errors depends on situation of the problem.
a)	T-Test: 
i)	 Data Follows Normal Distribution. Pooled Method.
ii)  If data does not follow a normal distribution then Setterthwaite method
iii) one continuous variable and one categorical variable with 2 categories
iv)  one sample t-test : test our sample against the benchmark to check  whether the sample belongs to the same population or not
v)	 two samples independent t-test : to check whether both the samples belong to the same population
vi)  paired samples t-test : to check between before and after state
#    By Hand:
-    Calculate the mean from the data groups
-    Calculate sample standard deviation for the groups
-    Find the sample size or number of observations
-    Calculate the difference between the means of the groups
-    Calculate: Diff/{sqrt(s1^2/n1 + s2^/n2)} = t value
-    Degree of freedom : n1 + n2 - 2
-    Alpha value is 0.05 (Level of significance)
-    Look into t-distribution table to find the benchmarked value of t for df & aplha
-    If the value in the table is more than the acquired value then h0 is significant and we should go with the null hypothesis
Note -> In SAS we should get p-value more than 0.05 and by hand the acquired t value should be less than the t value from the table
        to accept the null hypothesis
     -> The main drawbacks of conducting multiple t-test are time taken and decrease in accuracy of the result enabling one's 
        chances to increase for committing Type-I error.
     EG: T-Test with one categorical variable having two categories and one continuous variable
        proc ttest data= sashelp.class;
        class sex;
		var age;
		run;
		
b)	Anova: Analysis of Variance
i)	 Data Follows Normal Distribution check 
ii)	 Data Doesn’t follow a normal distribution
iii) Continuous variable + one catgorical variable > 2 categories (one way)
iv)	 Continuous variable + two catgorical variables > 2 categories (two way)
# Calculating Anova by Hand:
- Calculate the means of the groups individually & overall
- Check for the total number of observations
- Get degree of freedom : n-1 & g-1
- Calculate the overall variance
- Calculate between group variance (Variance of the controlled group)
- Calculate Within group variance: Total variance - Between Group variance
- Sum Between group variance
- Divide Sum of between group variance by degree of freedom of groups
- Degree of freedom for Within group
- Divide within group variance with degree of freedom for within group: n-g
- Take the ratio of between group variance & Within group variance
- We get acquired F value
Note-> F value acquired should be less than the table value.
    -> We divivde Variance with degree of freedom to average out the effect caused due to number of observations.
    EG.
      proc anova data= sashelp.cars;
	  class type;
	  model msrp=type;
	  run;

c) MANOVA : Multiple Analysis Of Variance  
i)   Data follows normal distribution
ii)  Data doesn't follow a normal distribution
iii) MORE THAN ONE CONTINUOUS VARIABLE + ONE CATEGORICAL VAR > 2 CATEGORIES (ONE WAY)
iv)  MORE THAN ONE CONTINUOUS VARIABLE + TWO CATEGORICAL VAR > 2 CATEGORIES (TWO WAY)  
     EG.
        proc glm data= sashelp.cars;
		class type;
		model msrp=type;
		run;

d) CONTINUOUS - CONTINUOUS : CORRELATION
   Eg:
      
e) CATEGORICAL - CATEGORICAL : CHI-SQ TEST OF ASSOCIATION  */
24) R-square: It helps us understand how well the variables in contrlled group explain the model
25) Adjusted R-square: It helps us to understand accurately 
Note-> The lesser the difference between Adj. R-sq & R-sq better is the model.
    -> Adj. R-sq penalizes the model for the addition of any insignificant variable & subtraction of a significant variable
    -> Adj. R-sq rewards the model for the subtraction of any insignificant variable & addition of a significant variable
25) Sum of the Squares: Defines the spread of the distance between each data point and mean
26) Ordinary least square method: Estimates Parameters in a linear regression model by minimizing the sum of squares of the residual.
                                  This Value draws a line through the data points that minimizes the sum of squared differences between
                                  the observed value and corresponding fitted value
27) Maximum Likelihood method: 
28) POST-HOC Test: After test of hypothesis we conduct post-hoc test in order to determine which variable is more significant.
    Note-> Tukey's HSD, Scheffe, Bonferroni & R-E-G-W-Q
    Eg:
        proc glm data= sashelp.cars;
		class type;
		model msrp=type;
		means type/tukey;
		run;

*/

/* Dummy Variables
To assign a specific attribute to the data variable. Value of dummy variables is binary.
Eg:
/* What Is SAS?
SAS is a data analytic enterprise software. It is not an open source where any user can contribute to the 
program at a granular level. All functions are predefined and there is restrictions to use. However, the syntax 
SAS uses is much simpler English as compared to other softwares. SAS was incepted in 1976 by a bunch of 
American Statisticians Jim Goodnight, Jim Barr, Jane Helwig and John Sall. SAS helps in analyzing data and 
creating statistical models for better inferences on the data analyzed.
*/

/* How does SAS work?
SAS no exception when it comes to following rules in any language. It mainly depends on accuracy of grammar
and logic of the statement being asked to act upon. There are only 2 major functions in SAS:-
1) Data:-
* It creates and manipulates data for working.
* Creates a blank dataset.
* Default library is "Work" library which is temporary library unless specified a particular library.
* Input is a vital statement in creating and manipulating a data. The following process happens in an Input statement under the hoot:-
 # It creates 2 slots in the memory:
  - Progrgram Data Vector: SAS creates multiples slots (Specifically; No. of variables +2). 
                           Apart from variables the two additional slots SAS creates to perform quality check to read the data are:-
  						  ! _n_: An internal counter for data while reading the number of records mentioned.
  						  ! _error_: A binary flag (0,1) raised to "1" in case of an error for that particular line, irrespective of 
  						            number of lines.
  						  ! Example: if an error occurs in line 55 then _n_= 55 & _error_=1.
  - Descriptor: Where all the attributes of a SAS variables are stored.
2) Proc:-
* Procedure step helps us to analayze the data.
* It helps us in getting more understanding the data variables 

Inside working of any statement follows these broad steps:
1) Processes from left to right in a serial order.
2) Reads each line unless Highlighted.
3) Checks for statement following proper grammar (syntax) and logic (semantic).
4) Displays the output or error based upon the findings.
*/

/* What are the Methods of creating a SAS Dataset? 
A SAS Dataset can be created in 3 ways:-
a) By creating from scratch a raw data set feeding values using Datalines statemnt
b) By importing a flatfile of various formats, Eg. CSV, XLS, TXT.
c) By altering an existing dataset.
 */

/* What is the importance of Log?
The log section in SAS program acts as guidelines. It helps us to understand where and what type of error has been committed.
It even informs us about the time and resources of our machine being used to carry out a statement/ set of statements.*/


/* What are the Attributes of SAS Variables?
SAS attributes helps in defining a SAS variable. Following are the list of attributes:-
# Name:
	- It should start with either an English Alphabet or an '_'
	- It can contain numbers except the first position
	- It can not have any special character except an '_' not even space
	- It cannot exceed 32 characters; default 8 bytes.
	Note: Same rules apply while naming a SAS data set.
# Type:
    - Character: having alphabets and is denoted by a "$". To refer a character variable in some statements we use -> ""
    - Numeric: Having number which requires no denoting symbol. By default all Variables are numeric.
# Length: 
    - The range under which name should be. By default it is 8 Bytes -> 7-8 characters or 13-14 numbers
    - However it can be increased to 32 Bytes
    - In order to increase length use -> Length statement after data statement and before SET statement. 
      As once the attributes are set in the blank dataset they cannot be overwritten.
    - If the length of any variable name exceeds the predefined length then output will omit the remaining characters
      EG.:
      Data cars;
      length model $32. ;
      input model $ origin $ price;
      datalines;
      hyundai asia 325000
      maruti  asia 250000
      ;
      run;
# Label: 
    - Contains information about the variable it's been associated with.
    - None of the rules pertaining to naming a SAS variable is applicable to Label.
      Eg.
      data wrestling;
      length name $20.;
      input name $ ht wt rank;
      label ht = "height in feets"
            wt = "weight in kgs";
      datalines;
      hulk 6 150 3
      rock 6 140 2
      goldberg 6 145 1
      ;
      run;
      
      proc contents data = wrestling;
      run;
# Informat:
   - This attribute defines how the variables are to be read by the PDV in SAS software. For eg. Date, currency etc
   # Note-> in any case, informat requires a width to be set.
   Eg. Date
   Data date;
   input id dob mmddyy10.;
   datalines;
   101 01/01/2001
   # Note -> In the above instance we will get the date output as calculated number of days from default value "01-Jan-1960" "MMDDYYYY" format.
          ->  For dates 01-01-1960 = 0; 01-02-1960=2; 12/31/1959= -1.
          -> In case of currency for instance if we set the width to 8 then it will read 8 places before decimal point. 
   Eg. Currency
   Data dollar;
   input id & salary dollar8.;
   datalines;
   001 50000000
   ;
   run;
   
   Note -> in the above eg. we have set the width to 8 and no decimal value
# Format:
  - Format helps in delivering a customized output format for better human readability.
  Eg: Date
  Data Date;
  input id dob mmddyy10.;
  format dob mmddyy10.;
  datalines;
  101 01/01/2021
  ;
  run;
  
  Eg: Date 2
  Data Date_2;
  input id dob mmddyyyy10.;
  format dob ddmmyyyy10.;
  datalines;
  102 02/02/2020
  ;
  run;
  Note -> Format statement is for the delivering the output so it can be customized as per the user.
  
  EG: Currency
  Data Dollar;
  input job_id $ Salary dollar8.2;
  format Salary dollar8.2;
  Datalines;
  001 51000000
  ;
  run;
  Note -> In the currency example it displays value in total of 8 characters but last 2 positions are reserved for decimals.
  
  <Revision>
  Eg. Creating a dataset with all attributes.
  Data revision;
  length name $32. place$20. pet $10. cars $10.;
  input name  place  dob mmddyy10. pet cars salary dollar10.2;
  format dob date9. salary dollar10.2;
  Label salary = "Monthly Salary";
  datalines;
  Maninder Goa 01/02/1995 dog Honda 35000.00
  Josh Trichy 10/10/1992 cat Toyota 30000.00
  Anna Delhi 03/28/1998 rabbit Maruti 45000.00
  Emma Surat 04/12/1999 bear Tata 51000.00
  ;
  run;
  
  Proc contents data=revision;
  run;
  
 */

/* What constitues a skeleton of any SAS program?
The skeleton or the template of a SAS program is mainly predefined. The nature of the template is based on the "Data" or the "Proc".
The key codes are predefined as SAS is a blackbox coding analytic platform which does not empower a user to create new codes.
Each line of code needs to end with ";".
Each program needs to end with a "run;" statement.
For Data Step:
- Start with "Data" followed by dataname (you provide)
- Incase of an existing data we use "Set" followed by the (libraryname.dataname)
-


  */
 
 
/* Analogy (Course of teaching)
Consider you(SAS program) have been given an errand (codes) by your mother(USER) to buy groceries from a local supermarket.
You have been given the complete list of products & money(resources) that you require to buy. So now you enter the supermarket. 
Take a cart and see that first item on your list is a dozen Granny Smith variant of Apple to be bought. So you move to the fruits 
section. Check for apples and browse closely for Granny Smith's type. You pick a dozen and put them in your cart. 
So if I was to relate with SAS code functioning here:
You entered the supermarket -> Create a blank data
You take a cart -> input step
You looked at your list of items to be purchased -> program data vector step
You go to fruit section and check for the Specific apples -> Descriptor step
You pick the apples and put them in your cart -> Output display
All thinking and action you carry out mentally -> log entries


/* LIBRARY
Library is a very important element in order to store and recall a data we work with. It is primary set of alphabets we give before naming 
the data. It is followed by -"."
By default our data is saved in "WORK" library and it is temporary in nature. By temporary I mean once we have finished the 
session and logout from the environment we will lose the data.
There are two ways to create a library:
Method I:
- Right Click on the Folder you wish to create a Library under Server Files and Folders drop down menu to the left of the screen
- Select create then click on Library
- Name the library
- Check the "Re-Create this library at startup" to make the library permanent.
- Click OK.

Method II
- Type "libname" followed by (library name) and in single quotes (adress where you want the library to be) followed by ";"
- Type "run;"

EG:
libname sumit '/home/u57898555';
run;

Note: In Method II library created is temporary. One needs to save data for it to re-appear on startup.
*/

/* Folder
Folders are the sub-section under library where you save your. It helps to recall the data or program you save.
To create a folder:
- Right click on the library you want the folder to be in
- Select "Create"
- Select "Folder"
- Click Ok
*/
 
*/ Comments
Comment are notes we type for our reference which the software overlooks while running the program.
It can be done in the following manners:
- press -> ctrl + /
- type -> /* */
*/

/* Retain Function
The purpose of a Retain Function is to maintain a particular order.
Eg.
data employee;
retain job_id name $ age experience;
length name $32.;
input job_id name $ age experience;
datalines;
AD001 Andy 27 2
CA002 Djovak 35 5
;
run;
*/
 
/* "Keep" & "Drop" Functions
Keep & Drop Functions helps us to select variables either to include or exclude in the output respectively.
It does not have to do anything with the order.
The use of this function depends on the number of variables to include or exclude.
Keep & Drop function can be used as an independent statement or even as an option depending on the use.
Eg. KEEP as a Satement

 Data keep_stat;
 length name $20. place $15.;
 retain name age place country;
 keep name place;
 input name $ place $ country $ age;
 datalines;
 Suraj Mumbai India 35
 Sam Hongkong China 38
 Martha Colombo Sri_Lanka 40
 Betty Brisbane Australia 28
 ;
 run;

Eg. KEEP as an option

Data cars;
set sashelp.cars (keep= origin msrp);
run;

Eg.DROP as a Satement

data tourist;
retain name place Date_Of_Journey cost;
length name $30. place $20.;
label cost = "Cost per trip";
drop age;
input name $ age place $ Date_Of_Journey ddmmyy10. cost dollar8.;
format Date_of_Journey ddmmyy10. cost dollar8.;
datalines;
Rita 40 Paris 11/04/2021 25000
Marcos 35 London 12/05/2021 35000
Ansari 25 Cairo 02/05/2019 20000
;
run;

Eg. DROP as an option

Data class;
set sashelp.class (drop= age);
run;
*/


/* Adding data to an existing dataset
There are different methods depending on the number of information one needs to add to an existing dataset.
Method I
When you want to feed less number of data to the end of the file.

data add_class;
set sashelp.class end= eof;
output;
if eof then do;
Name = 'Jason';
Sex = 'M';
Age = 12;
Height = 56;
Weight = 85;
output;
end;
run;

Method II
If there are multiple data records stored in different data sets
data empployee;
length id $3. name $30. department $30. ;
input id $ name $ age department $ salary dollar8.;
format salary dollar8.;
datalines;
001 Aaron 35 Accounts 20000
002 Maria 28 HR 18000
003 Rosy 30 Marketing 25000
;
run;

data employee_2;
length id $3. name $30. department $30.;
input id $ name $ age department $ salary dollar8.;
format salary dollar8.;
datalines;
004 Andrew 40 Research 40000
005 Gweyn 45 Administration 35000
;
run;

proc datasets;
append  base=empployee
        data=employee_2 appendver=v6;
       
run;

proc print data= employee_2;
run;

# Note
- The input variables attributes information needs to be the same.
- Use "If....Then" conditional statement to add new columns to data pertaining to particular set of records.

Method III
Using SQL to add data

 Data keep_stat;
 length name $20. place $15.;
 retain name age place country;
 input name $ place $ country $ age;
 datalines;
 Suraj Mumbai India 35
 Sam Hongkong China 38
 Martha Colombo Sri_Lanka 40
 Betty Brisbane Australia 28
 ;
 run;
 
proc sql;
insert into work.keep_stat
		set	name= "Madison",
			place= "Michigan" ,
			country= "USA" ,
			age= 55;
quit;

proc print data= work.keep_stat;
run;

*/
 
/* Creating a new Variable
Many a times we might need to create a part of findings from the data provided to us. With SAS it is very much possible.
By default the length will be decided by the number of characters in the variable but less than 32.
Eg:
data cars_discount;
set sashelp.cars;
Format Discount dollar8.2;
Discount = MSRP - Invoice;
run;
  */

/* Conditional Statements
Conditional statements are used for automation and quick facilitation of the output.
# DO loop
- This type of conditional statement checks if the condition is satisfied otherwise continues to perform the function till 
  the condition is satisfied.
- We need to provide "End" statement to break the loop.
- Output of each step is optional.
Eg.
data class_do;
set sashelp.class;
do wt_kg = weight*0.45;
output;
end;
run;

# If .. Else
This conditional statement is for cause and action statement. In other when one condition is satisfied then a particular outcome
is given and if the same condition is not satisfied then other output is given.

Eg:
data class_if;
set sashelp.class;
if height = 62 then Remarks= "Average";
else if height lt 62 then Remarks = "Short";
else Remarks = "Tall";
run;

Note -> The main difference between a "DO" loop and an "If...Else" statement is in "Do" loop the automation recursively occurs facilitating a 
        gradual progression of the initial condition till the desired output is provided. Whereas in "If.. Else" statement there is immediate 
        deciding output of the condition given.
*/
 
/* ARRAY 

Array is another automation tool for a seriess of variables to carry out same program. 
In array the input and output order of variable is very crucial.
What happens in the backend is:
- We define the array
- We provide the sequence of input variables
- The variables are processed 
- The output follows the same sequence as the input.

Eg:
Data log_price;
set sashelp.cars;
array log_in{2} MSRP Invoice;
array log_out{2} log_MSRP log_Invoice;
do i= 1 to 2;
log_out{i}= log(log_in{i});
end;
Keep Make Model MSRP Invoice log_MSRP log_Invoice;
run;

Eg: When we do not know the number of variables for array
data class_cap;
set sashelp.class;
array cap_in {*} _character_;
do i = 1 to dim(cap_in);
cap_in{i}= upcase(cap_in{i});
end;
drop i;
run;
*/


/* MACROS
Macros is an automation program used either for number of variables or for series of functions as per our choice.
Hence Macros can be of two types depending upon our utility.
Type I:
Macros Variable:
In this type we define a particular variable and store the recurring value into it. Then we recall the 
variable for faster processing of the data.
Eg:   Macro Variable Data & Class
%let data = sashelp.class;
%let class = sex;

proc freq data= &data;
tables &class;
run;

Type II:
Macro Function:
In this type we define variables and functions template. Then later we input values to variables which 
in return empowers us to automate the routine steps.
Eg:
Exploratory Data Analysis

%macro eda(input=  ,
           class= ,
           var  = );

proc contents data= &input;
run;

proc means data= &input nmiss;
run;

proc freq data= &input;
tables &class;
run;

proc univariate data= &input plots;
var &var;
run;

%mend;

%eda( input= sashelp.demographics ,
      class= region,
      var  = CONT);
*/
 
/* SAS SQL
SQL is a database management program. SQL stands for Structured Query Language. It is a relational database management tool which
has got it's own environment for doman specific language. In SAS we can consider it as a software within a software. SQL is used to
maintain a structured data. Eg: Excel

# To import a data
proc sql;
select * from sashelp.class;
quit;
run;
Note -> '*' defines all number of vasriable. We can limit number of variables as per our convenience by punching a value instead of '*'

# Limiting number of observations
proc sql outobs=10;
select * from sashelp.class;
quit;
run;

# Selecting a particular type from variables
proc sql;
select * from sashelp.class 
where Sex = "F" ;
quit;

run;
Note -> Where is a conditional statement when we want the output of a particular value.

# Creating a dataset from an existing dataset for a particular value group

proc sql;
create table class_age as
select Name, Sex, Age from sashelp.class 
where Sex = "F" ;
quit;
run;

# Adding a new variable to an existing Dataset
proc sql;
create table ratio as
select * from sashelp.class;
quit;
run;

proc sql;
alter table ratio add Ratio Num(4);
quit;
run;

proc sql;
update ratio set Ratio = Weight/Height;
select * from ratio;
Quit;
run;
Note -> For this example we have added a new variable "ratio" which is the ratio between Weight & Height.

/* VISUALIZATION
Visualization is a key tool for any data analyst to analyze data to comprehend better.
Eg: Box Plot
proc sgplot data=sashelp.fish;
vbox weight;
run;

Eg: Scatter Plot
proc sgplot data=sashelp.fish;
scatter x= species y=height;
run;

Eg: Line Graph
proc sgplot data=sashelp.fish;
title "Species By Height";
vline species/ response=height stat=mean markers;
keylegend ;
run;
*/

/* Saving results in pdf or other formats for future hardcopy/referncing
With this SAS command we can download reports and findings in desired format for future refernces and attachments.
Eg: 
ods pdf file='Summary univariate.pdf';
proc univariate data=sashelp.cars plots;
run;
ods pdf close;
*/


/* STATISTICAL TEST

“Rule is to use statistics for conversion of business problem to mathematical problem and the result obtained in mathematical form to be converted into business understanding.”
1)	Statistical Modelling -> data distribution
2)	Predictive Modelling -> 1. Regression 2. Classification. How outcome shapes up.
a)	Quantitative: Regression (Statistical Model)
b)	Categorical: Classification (Machine Learning)
3)	Model: Regression etc. A prototype or equation for relation between variables and defining rule for prediction purpose
4)	Metric: Standard Deviation, Mean etc. Metric measures.
5)	Machine Learning: learns from the data
a)	Abstraction
b)	Generalization
6)	Data Mining – Pattern recognition from the data
7)	Artificial Intelligence is automation -> neural network -> deep learning
8)	Data Science is cumulative process from acquiring data to deployment of model
9)	Data:
a)	Categorical – Continuous. 
i)	Nominal Data:  Based on specific attributes. Eg, ethnicity, gender, food habit, age group
ii)	Ordinal Data: Ranked Data. Eg, Likert Scale (Very Happy to Very Unhappy), semantic differential scale (On a scale of 1 to 5 rate)
b)	Quantitative  
i)	Discrete-
•	count data (easily counted), 
•	unit free, 
•	whole number
•	probability mass function -> Probability at a particular point.
ii)	Continuous- 
•	measured data, 
•	have units generally, without unit- percentage or ratio
•	can take decimal values
•	Probability density function -> for a range
10)	Parameters are Population variable
11)	Estimations are transition from statistics to parameters
12)	Statistics are sample variable
13)	Descriptive Statistics – summarizing data: measure of central tendency and measure of dispersion. Five points: minimum, first quartile, median, third quartile, maximum. Pertaining to Sample only
a)	Measure of central tendency: center or location of a distribution. Eg. Mean, Media or mode
b)	Measure of dispersion: Scattering of data. Distribution from the center of data. Eg. Standard Deviation, Variance, IQR
14)	Mean: Simple Average. Holistic Picture but affected by extreme values. Formula- sum of values/ number of values
15)	Median: Positional Average. Not a holistic picture but not affected by extreme values. Arrange the data in chronological order then N+1/2
16)	Mode: Maximum frequency
17)	Inter-Quartile range: Q3 -Q1
18)	Threshold: IQR*1.5 or IQR*3,12 from Q3 upper, 12 from less than Q1 lower.
19)	Standard Deviation: 3*SD=99.7% data in Normal distribution and 18*SD in case data does not follow a normal distribution (Using Chebyshev’s Theorem). Sum (x1-population mean)2 / n-1, where X1 Only continuous data.
20)	Variance: (standard deviation)2 . Sum of squared distances of data from the center of the data. Only continuous data.
21)	Values outside Threshold are outliers. Generally, 0.3%
22)	Inferential Statistics – statistics -> estimation and hypothesis testing -> population
23)	Statistical Tests:
-> Hypothesis testing is a very pivotal measure in establishing the fitness of a model. In this we benchmark a condition and check
   (Level of Significance => 0.05)
   if the model meets that particular condition or the converse of it.
   There are two types of Hypothesis tests:
   * Parametric - Involving population mean. Data should follow a normal distribution.
   * Non-Parametric- Involving Sample mean
   Eg: H0 (null hypothesis): The average weight of boys is more than average weight of girls in the class.
Note - In NULL Hypothesis the statement maintains it's status quo and no action needs to be taken once the result is significant
	   HA (Alternate Hypothesis): The average weight of boys is not more than average weight of girls in the class.
Note - In Alternate Hypothesis the statement does not maintains it's status quo and an action needs to be taken once the result
       is significant
-> The Errors arising out of faulty inferences of Hypothesis Testing:
- Type I error: Accepting False NULL Hypothesis (Controlled)
- Type II error: Rejecting True NULL Hypothesis (Not Controlled)
Note -> The gravity of these errors depends on situation of the problem.
a)	T-Test: 
i)	 Data Follows Normal Distribution. Pooled Method.
ii)  If data does not follow a normal distribution then Setterthwaite method
iii) one continuous variable and one categorical variable with 2 categories
iv)  one sample t-test : test our sample against the benchmark to check  whether the sample belongs to the same population or not
v)	 two samples independent t-test : to check whether both the samples belong to the same population
vi)  paired samples t-test : to check between before and after state
#    By Hand:
-    Calculate the mean from the data groups
-    Calculate sample standard deviation for the groups
-    Find the sample size or number of observations
-    Calculate the difference between the means of the groups
-    Calculate: Diff/{sqrt(s1^2/n1 + s2^/n2)} = t value
-    Degree of freedom : n1 + n2 - 2
-    Alpha value is 0.05 (Level of significance)
-    Look into t-distribution table to find the benchmarked value of t for df & aplha
-    If the value in the table is more than the acquired value then h0 is significant and we should go with the null hypothesis
Note -> In SAS we should get p-value more than 0.05 and by hand the acquired t value should be less than the t value from the table
        to accept the null hypothesis
     -> The main drawbacks of conducting multiple t-test are time taken and decrease in accuracy of the result enabling one's 
        chances to increase for committing Type-I error.
     EG: T-Test with one categorical variable having two categories and one continuous variable
        proc ttest data= sashelp.class;
        class sex;
		var age;
		run;
		
b)	Anova: Analysis of Variance
i)	 Data Follows Normal Distribution check 
ii)	 Data Doesn’t follow a normal distribution
iii) Continuous variable + one catgorical variable > 2 categories (one way)
iv)	 Continuous variable + two catgorical variables > 2 categories (two way)
# Calculating Anova by Hand:
- Calculate the means of the groups individually & overall
- Check for the total number of observations
- Get degree of freedom : n-1 & g-1
- Calculate the overall variance
- Calculate between group variance (Variance of the controlled group)
- Calculate Within group variance: Total variance - Between Group variance
- Sum Between group variance
- Divide Sum of between group variance by degree of freedom of groups
- Degree of freedom for Within group
- Divide within group variance with degree of freedom for within group: n-g
- Take the ratio of between group variance & Within group variance
- We get acquired F value
Note-> F value acquired should be less than the table value.
    -> We divivde Variance with degree of freedom to average out the effect caused due to number of observations.
    EG.
      proc anova data= sashelp.cars;
	  class type;
	  model msrp=type;
	  run;

c) MANOVA : Multiple Analysis Of Variance  
i)   Data follows normal distribution
ii)  Data doesn't follow a normal distribution
iii) MORE THAN ONE CONTINUOUS VARIABLE + ONE CATEGORICAL VAR > 2 CATEGORIES (ONE WAY)
iv)  MORE THAN ONE CONTINUOUS VARIABLE + TWO CATEGORICAL VAR > 2 CATEGORIES (TWO WAY)  
     EG.
        proc glm data= sashelp.cars;
		class type;
		model msrp=type;
		run;

d) CONTINUOUS - CONTINUOUS : CORRELATION
   Eg:
      
e) CATEGORICAL - CATEGORICAL : CHI-SQ TEST OF ASSOCIATION  */
24) R-square: It helps us understand how well the variables in contrlled group explain the model
25) Adjusted R-square: It helps us to understand accurately 
Note-> The lesser the difference between Adj. R-sq & R-sq better is the model.
    -> Adj. R-sq penalizes the model for the addition of any insignificant variable & subtraction of a significant variable
    -> Adj. R-sq rewards the model for the subtraction of any insignificant variable & addition of a significant variable
25) Sum of the Squares: Defines the spread of the distance between each data point and mean
26) Ordinary least square method: Estimates Parameters in a linear regression model by minimizing the sum of squares of the residual.
                                  This Value draws a line through the data points that minimizes the sum of squared differences between
                                  the observed value and corresponding fitted value
27) Maximum Likelihood method: 
28) POST-HOC Test: After test of hypothesis we conduct post-hoc test in order to determine which variable is more significant.
    Note-> Tukey's HSD, Scheffe, Bonferroni & R-E-G-W-Q
    Eg:
        proc glm data= sashelp.cars;
		class type;
		model msrp=type;
		means type/tukey;
		run;

*/

/* Dummy Variables
To assign a specific attribute to the data variable. Value of dummy variables is binary.
Eg:
   data dummy_cars;
   set sashelp.cars (keep= model make origin);

   if origin = "USA" then do;
   grp_u = 1;
   grp_e = 0;
   end;

   else if origin = "Europe" then do;
   grp_u = 0;
   grp_e = 1;
   end;

   else do;
   grp_u = 0;
   grp_e = 0;
   end;

   run;
*/

/* REGRESSION
- Regression is a unique model which shows traits of both machine learning and statistics.
- The variables are classified under controlled and target.
- Regression formula:
  y'(predicted value) = a (intercept) + b1(slope)x1(first controlled variable) + b2x2 + ...+ bnxn + u(error)
- Mean Absolute Error:It is a metric for model accuracy.
#  To calculate Mean Absolute error we should:
-> Find Residual= Actual - Predicted
-> Take Absolute Value of the residuals
-> Take the mean of Absolute Residuals
- Root Mean Square Error: It is a metric for model accuracy.
#  To calculate Mean Absolute error we should:
-> Find Residual= Actual - Predicted
-> Square the Residuals
-> Take Mean of the Squares of the Residuals
-> Find the Square root of the mean of the squared residuals
Note:Lesser the values better is the model
     Closer the value of Mean Absolute Error & Root Mean Square Error more accurate the model is.

Assumptions
1. The regression model is linear in parameters. 
   The curve would not have a straight line denoting it can be a gausian mixture 
   To check this assumption we can use graph plotting
2. The independent variable values are fixed in repeated sampling
3. Zero mean value of the residuals 
   If not the distribution of data is not normal but skewed showing presence of extreme values. ui~N(0,sigma)
   To check this assumptions we should plot graph for residuals
4. Residuals should be identically and independently distributed
   Residuals should not have any autocorrelation. which means observation of same variable is autocorrelated with other variable.
   A property of time-series data because variables are linked.
   To check this assumption DW ~ 1.5 to 4 (Durbin watson statistics)
   proc reg data=sashelp.cars;
   model msrp= EngineSize Cylinders Mpg_City / dw;
   run;
5. Regression model is specified in the correct manner
   If we think out of 10 variables we omit important variables
   
6. Number of Samples is more than number of parameters/variables
7. X value or Value of independent variables can not be the same throughout.
8. Independent Variables are truely independent.
   If independent variables are highly associated with each other then we will have a multi-collinearity, hampering the 
   B.L.U.E. property (Best Linear Unbiased Estimators). It will create difficulty in estimating impact of independent variables.
   To check this assmuption we use VIF (Variance Inflation Factor)
   proc reg data=sashelp.cars;
   model msrp = enginesize mpg_city horsepower/ vif;
   run;
# How to derive VIF
  vif= 1/ tolerence for a particular variable
  tolerence of that variable = 1 - R-Square(of that variable)
  If VIF of any variable is 1 then the variable is totally unrelated to rest of the variables (0%)
  If VIF of any variable is 2 then the variable is moderately related to rest of the variables (50%)
  If VIF of any variable is =>5 then the variable is highly related to rest of the variables (=>80%)
  If VIF of any variable is =>10 then the variable is highly related to rest of the variables (=>90%)
  General practice is to accept VIF of variables should be less than 5.
  We should drop variables high multicollinear variable in general circumstances.
  
9. Homoscedacity of the residuals
   The residuals should have constant variance.
   Lack of constant variance between the residuals is known as Heteroscedacity
   Focusses on placement of residuals.
   Checking homoscedacity of the residuals.
   proc reg data=sashelp.cars;
   model msrp= enginesize cylinders horsepower mpg_city/ spec;
   run;
   Corrective action:
   One reason for high heteroscedacity is high internal variance among the feature variables. 
   Use some transformation Eg. Log transformation.
   
Eg: Regression
   proc reg data=sashelp.cars;
   model msrp= EngineSize Horsepower Mpg_highway;
   run;
*/
