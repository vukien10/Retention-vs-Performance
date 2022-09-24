/*** 398 Project Analysis.do***
Created by Kien Vu
Date: 4/20/2020
Written for Stata/IC 16.0, 64-bit, for Windows
*/

clear
set more off
capture log close
graph drop _all
*********************** 398 Project Data Analysis **************************

cd "Command-Files"
log using "../Analysis-Data/analysis.log", replace //Establish log file
use "..\Analysis-Data\analysis-file.dta"

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

