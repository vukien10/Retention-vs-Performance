/* 398 Project - Import teachwage*
Created by Kien Vu
Date: 3/24/2020
Written for Stata 14-MP, 64-bit, for Mac
*/

clear
set more off
capture log close
graph drop _all
********************** 398 Project - Import teachwage ************************

cd "Command-Files"
import excel "../Original-Data/Importable-Data/teachwage1213_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename AverageSalary teachwage

gen year = 2013
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode

replace teachwage = subinstr(teachwage,"$","",1) //Delete the dollar sign in wages
replace teachwage = subinstr(teachwage,",","",7) //Delete the comma in wages
destring teachwage, replace //Turn wages to a double
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/teachwage1213_clean.dta, replace
clear

import excel "../Original-Data/Importable-Data/teachwage1314_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename AverageSalary teachwage

gen year = 2014
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode

replace teachwage = subinstr(teachwage,"$","",1) //Delete the dollar sign in wages
replace teachwage = subinstr(teachwage,",","",7) //Delete the comma in wages
destring teachwage, replace //Turn wages to a double
order distname distcode year //Order the columns

save ../Original-Data/teachwage1314_clean.dta, replace
clear

import excel "../Original-Data/Importable-Data/teachwage1415_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename AverageSalary teachwage

gen year = 2015
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode

replace teachwage = subinstr(teachwage,"$","",1) //Delete the dollar sign in wages
replace teachwage = subinstr(teachwage,",","",7) //Delete the comma in wages
destring teachwage, replace //Turn wages to a double
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/teachwage1415_clean.dta, replace
clear

import excel "../Original-Data/Importable-Data/teachwage1516_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename AverageSalary teachwage

gen year = 2016
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode

replace teachwage = subinstr(teachwage,"$","",1) //Delete the dollar sign in wages
replace teachwage = subinstr(teachwage,",","",7) //Delete the comma in wages
destring teachwage, replace //Turn wages to a double
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/teachwage1516_clean.dta, replace
clear

exit
