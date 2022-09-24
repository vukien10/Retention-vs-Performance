/* 398 Project - Import expen*
Created by Kien Vu
Date: 3/24/2020
Written for Stata 14-MP, 64-bit, for Mac
*/

clear
set more off
capture log close
graph drop _all
********************** 398 Project - Import expen ************************

cd "Command-Files"

import excel "../Original-Data/Importable-Data/expen12_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename InDistrictExpendituresperPup in_exppp
rename TotalExpendituresperPupil tot_exppp

drop E //Drop redundant variable
gen year = 2013
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode

replace in_exppp = subinstr(in_exppp,"$","",1) //Delete the dollar sign in expenditures
replace tot_exppp = subinstr(tot_exppp,"$","",1) 
replace in_exppp = subinstr(in_exppp,",","",7) //Delete the comma in expenditures
replace tot_exppp = subinstr(tot_exppp,",","",7) 
destring in_exppp, replace //Turn in-state expenditure/student to a double
destring tot_exppp, replace //Turn total expenditure/student to a double
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/expen12_clean.dta, replace

clear

import excel "../Original-Data/Importable-Data/expen13_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename InDistrictExpendituresperPup in_exppp
rename TotalExpendituresperPupil tot_exppp

drop E //Drop redundant variable
gen year = 2014
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode

replace in_exppp = subinstr(in_exppp,"$","",1) //Delete the dollar sign in expenditures
replace tot_exppp = subinstr(tot_exppp,"$","",1) 
replace in_exppp = subinstr(in_exppp,",","",7) //Delete the comma in expenditures
replace tot_exppp = subinstr(tot_exppp,",","",7) 
destring in_exppp, replace //Turn in-state expenditure/student to a double
destring tot_exppp, replace //Turn total expenditure/student to a double
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/expen13_clean.dta, replace

clear

import excel "../Original-Data/Importable-Data/expen14_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename InDistrictExpendituresperPup in_exppp
rename TotalExpendituresperPupil tot_exppp

drop E //Drop redundant variable
gen year = 2015
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode

replace in_exppp = subinstr(in_exppp,"$","",1) //Delete the dollar sign in expenditures
replace tot_exppp = subinstr(tot_exppp,"$","",1) 
replace in_exppp = subinstr(in_exppp,",","",7) //Delete the comma in expenditures
replace tot_exppp = subinstr(tot_exppp,",","",7) 
destring in_exppp, replace //Turn in-state expenditure/student to a double
destring tot_exppp, replace //Turn total expenditure/student to a double
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/expen14_clean.dta, replace

clear

import excel "../Original-Data/Importable-Data/expen15_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename InDistrictExpendituresperPup in_exppp
rename TotalExpendituresperPupil tot_exppp

drop E //Drop redundant variable
gen year = 2016
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode

replace in_exppp = subinstr(in_exppp,"$","",1) //Delete the dollar sign in expenditures
replace tot_exppp = subinstr(tot_exppp,"$","",1) 
replace in_exppp = subinstr(in_exppp,",","",7) //Delete the comma in expenditures
replace tot_exppp = subinstr(tot_exppp,",","",7) 
destring in_exppp, replace //Turn in-state expenditure/student to a double
destring tot_exppp, replace //Turn total expenditure/student to a double
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/expen15_clean.dta, replace
exit
