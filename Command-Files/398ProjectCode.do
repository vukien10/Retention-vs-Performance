/*** 398 Project Code - Teacher Retention and Student Performance ***
Created by Kien Vu
Date: 3/2/2020
Written for Stata/IC 16.0, 64-bit, for Windows
*/

clear
set more off
capture log close
graph drop _all
********************** 398 Project Initial Processing **************************

cd "../Vu-398-Project/Command-Files"
use "../Original-Data/Imported-Data/staffretain12_clean.dta"


append using "../Original-Data/Imported-Data/staffretain13_clean.dta" //Merging the retention dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/staffretain14_clean.dta" //Merging the retention dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/staffretain15_clean.dta" //Merging the retention dataset with its equivalent in another year.

save "../Original-Data/base_staffretain.dta", replace //Save the matched data as the base file

clear
use "../Original-Data/Imported-Data/classsize13.dta"

append using "../Original-Data/Imported-Data/classsize14.dta" //Merging the class dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/classsize15.dta" //Merging the class dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/classsize16.dta" //Merging the class dataset with its equivalent in another year.

save "../Original-Data/base_clsize.dta", replace //Save the matched data as the base file

clear
use "../Original-Data/Imported-Data/mcas13_clean.dta"

append using "../Original-Data/Imported-Data/mcas14_clean.dta" //Merging the MCAS dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/mcas15_clean.dta" //Merging the MCAS dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/mcas16_clean.dta" //Merging the MCAS dataset with its equivalent in another year.

save "../Original-Data/base_mcas.dta", replace //Save the matched data as the base file

clear
use "../Original-Data/Imported-Data/teachwage1213_clean.dta"

append using "../Original-Data/Imported-Data/teachwage1314_clean.dta" //Merging the salaries dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/teachwage1415_clean.dta" //Merging the salaries dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/teachwage1516_clean.dta" //Merging the salaries dataset with its equivalent in another year.

save "../Original-Data/base_teachwage.dta", replace //Save the matched data as the base file

clear
use "../Original-Data/Imported-Data/teachdat1213.dta"

append using "../Original-Data/Imported-Data/teachdat1314.dta" //Merging the teacher quality dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/teachdat1415.dta" //Merging the teacher quality dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/teachdat1516.dta" //Merging the teacher quality dataset with its equivalent in another year.

save "../Original-Data/base_teachdat.dta", replace //Save the matched data as the base file

clear
use "../Original-Data/Imported-Data/discp1213.dta"

append using "../Original-Data/Imported-Data/discp1314.dta" //Merging the discp dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/discp1415.dta" //Merging the discp dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/discp1516.dta" //Merging the discp dataset with its equivalent in another year.

save "../Original-Data/base_discp.dta", replace //Save the matched data as the base file

clear
use "../Original-Data/Imported-Data/discp1213n.dta"

append using "../Original-Data/Imported-Data/discp1314n.dta" //Merging the non-drugs/violent discp dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/discp1415n.dta" //Merging the non-drugs/violent discp dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/discp1516n.dta" //Merging the non-drugs/violent discp dataset with its equivalent in another year.

save "../Original-Data/base_ndiscp.dta", replace //Save the matched data as the base file

clear
use "../Original-Data/Imported-Data/expen12_clean.dta"

append using "../Original-Data/Imported-Data/expen13_clean.dta" //Merging the expenditure dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/expen14_clean.dta" //Merging the expenditure dataset with its equivalent in another year.
append using "../Original-Data/Imported-Data/expen15_clean.dta" //Merging the expenditure dataset with its equivalent in another year.

save "../Original-Data/base_expen.dta", replace //Save the matched data as the base file

clear
use "../Original-Data/base_staffretain.dta"

merge 1:m distcode year using "../Original-Data/base_clsize.dta" //Merging the retention dataset with the class data through each district over the years
rename _merge _merge1

merge 1:m distcode year using "../Original-Data/base_mcas.dta" //Merging the dataset with the MCAS data through each district over the years
rename _merge _merge2

merge 1:m distcode year using "../Original-Data/base_teachdat.dta" //Merging the dataset with the instruction quality data through each district over the years
rename _merge _merge3
merge 1:m distcode year using "../Original-Data/base_teachwage.dta" //Merging the dataset with the teacher salaries data through each district over the years
rename _merge _merge4
merge 1:m distcode year using "../Original-Data/base_expen.dta" //Merging the dataset with the expenditure data through each district over the years
rename _merge _merge5

merge 1:m distcode year using "../Original-Data/base_discp.dta" //Merging the dataset with the discipline data through each district over the years
rename _merge _merge6

merge 1:m distcode year using "../Original-Data/base_ndiscp.dta" //Merging the dataset with the non-drugs/violent discipline data through each district over the years
rename _merge _merge7

save "../Original-Data/base-file.dta", replace //The processed data was saved as one combined dataset

*********************** 398 Project Data Construction **************************

use "../Original-Data/base-file.dta"

keep if _merge1==3 & _merge2==3 & _merge3==3 & _merge4==3 & _merge5==3 & _merge6==3 & _merge7==3 //Keeping the matched observations throughout the process
drop _merge1 _merge2 _merge3 _merge4 _merge5 _merge6 _merge7 //Drop the merge variables

bysort distcode (year): drop if year[1]!= 2013 //Discard districts that doesn't have 2013 data
bysort distcode (year): drop if year[2]!= 2014 //Discard districts that doesn't have 2014 data
bysort distcode (year): drop if year[3]!= 2015 //Discard districts that doesn't have 2015 data
bysort distcode (year): drop if year[4]!= 2016 //Discard districts that doesn't have 2016 data
order distname distcode year 

save "../Original-Data/base-file-clean.dta", replace //Save a cleaned base file

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

save "../Analysis-Data/analysis-file.dta", replace //Save the finished analysis file

*********************** 398 Project Data Analysis **************************

log using "../Analysis-Data/analysis.log", replace //Establish log file
use "../Analysis-Data/analysis-file.dta"

codebook, compact //Generate Table 1

xtset distcode year //Declare the dataset as panel data

ssc install outreg2

xtreg sgpmed retperc_t i.year, fe vce(cluster distcode) //Regression without controls
outreg2 using "../Analysis-Data/sgpregs.xls", replace keep(retperc_t) //Print Table 2 to Excel - Column 1

xtreg sgpmed retperc_t corequality cpi poorperc stfemale i.year, fe vce(cluster distcode) //Regression with composition controls 
outreg2 using "../Analysis-Data/sgpregs.xls", append keep(retperc_t corequality cpi poorperc stfemale) //Print Table 2 to Excel - Column 2
xtreg sgpmed retperc_t retperc_p sdiscp corequality cpi poorperc stfemale i.year, fe vce(cluster distcode)  //Regression with all composition and environment controls
outreg2 using "../Analysis-Data/sgpregs.xls", append keep(retperc_t corequality cpi poorperc stfemale retperc_p sdiscp ) //Print Table 2 to Excel - Column 3

xtreg sgpmed c.retperc_t##c.poor corequality cpi poorperc stfemale i.year, fe vce(cluster distcode) //Regression with composition controls, and interaction term with the poor dummy 
outreg2 using "../Analysis-Data/sgpregs.xls", append keep(c.retperc_t##c.poor corequality cpi poorperc stfemale) //Print Table 2 to Excel - Column 4

xtreg sgpmed c.retperc_t##c.poor retperc_p sdiscp corequality cpi poorperc stfemale i.year, fe vce(cluster distcode) //Regression with all composition, environment controls and interaction term with the poor dummy 
outreg2 using "../Analysis-Data/sgpregs.xls", append keep(c.retperc_t##c.poor corequality cpi poorperc stfemale retperc_p sdiscp ) //Print Table 2 to Excel - Column 5

xtreg retperc_t cpi retperc_p sdiscp corequality poorperc stfemale, fe vce(cluster distcode) //Test for cpi correlation with teacher retention


log close
exit
