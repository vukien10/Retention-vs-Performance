/*** 398 Project Construction.do***
Created by Kien Vu
Date: 4/20/2020
Written for Stata/IC 16.0, 64-bit, for Windows
*/

clear
set more off
capture log close
graph drop _all
*********************** 398 Project Data Construction **************************

cd "Command-Files"
use "..\Original-Data\base-file.dta"

keep if _merge1==3 & _merge2==3 & _merge3==3 & _merge4==3 & _merge5==3 & _merge6==3 & _merge7==3 //Keeping the matched observations throughout the process
drop _merge1 _merge2 _merge3 _merge4 _merge5 _merge6 _merge7 //Drop the merge variables

bysort distcode (year): drop if year[1]!= 2013 //Discard districts that doesn't have 2013 data
bysort distcode (year): drop if year[2]!= 2014 //Discard districts that doesn't have 2014 data
bysort distcode (year): drop if year[3]!= 2015 //Discard districts that doesn't have 2015 data
bysort distcode (year): drop if year[4]!= 2016 //Discard districts that doesn't have 2016 data
order distname distcode year 

save "..\Original-Data\base-file-clean.dta", replace //Save a cleaned base file

gen discp = discpnum/stnum*100 //Generate the disciplinary rates variables
gen sdiscp = (discpnum-ndiscpnum)/stnum*100
gen lwage = log(teachwage) //Generate log values for monetary variables
gen lin_exppp = log(in_exppp)
gen ltot_exppp = log(tot_exppp)
gen poor = 0
replace poor = 1 if poorperc>= 18.5

label variable discp "% of students disciplined any offenses"  //Label the variables
label variable sdiscp "% of students disciplined for drugs, violent or criminal-related offenses"
label variable lwage "Log of Average Teacher Salary"
label variable lin_exppp "Log of In-District Expenditures per Pupil"
label variable ltot_exppp "Log of Total Expenditures per Pupil"
label variable cpi "CPI for MCAS Math"
label variable sgpmed "Median SGP for MCAS Math"
label variable poor "Dummy indicate whether percent of poor students in Math Class is greater than median"

drop discpnum stnum ndiscpnum //Drop the raw discipline data as the used data obtained
drop subject //Drop the subject indicator for MCAS

save "..\Analysis-Data\analysis-file.dta", replace //Save the finished analysis file

exit
