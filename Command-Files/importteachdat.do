/* 398 Project - Import teachdat*
Created by Kien Vu
Date: 3/24/2020
Written for Stata 14-MP, 64-bit, for Mac
*/

clear
set more off
capture log close
graph drop _all
********************** 398 Project - Import teachdat ************************

cd "Command-Files"
import excel "../Original-Data/Importable-Data/teachdat1213_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename ofTeachersLicensedinTeachi licensed
rename ofCoreAcademicClassesTaugh corequality

gen year = 2013 //Generate year variable
label variable year "Year of interest"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

destring licensed, replace //Turn rate of licensed teacher to a double
destring corequality, replace //Turn rate of quality instructor for core classes to a double
drop if licensed == 0 //Drop empty observations

order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/teachdat1213.dta, replace //Save to a dta file
clear

import excel "../Original-Data/Importable-Data/teachdat1314_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename ofTeachersLicensedinTeachi licensed
rename ofCoreAcademicClassesTaugh corequality

gen year = 2014 //Generate year variable
label variable year "Year of interest"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

destring licensed, replace //Turn rate of licensed teacher to a double
destring corequality, replace //Turn rate of quality instructor for core classes to a double
drop if licensed == 0 //Drop empty observations

order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/teachdat1314.dta, replace //Save to a dta file
clear

import excel "../Original-Data/Importable-Data/teachdat1415_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename ofTeachersLicensedinTeachi licensed
rename ofCoreAcademicClassesTaugh corequality

gen year = 2015 //Generate year variable
label variable year "Year of interest"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

destring licensed, replace //Turn rate of licensed teacher to a double
destring corequality, replace //Turn rate of quality instructor for core classes to a double
drop if licensed == 0 //Drop empty observations

order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/teachdat1415.dta, replace //Save to a dta file
clear

import excel "../Original-Data/Importable-Data/teachdat1516_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename ofTeachersLicensedinTeachi licensed
rename ofCoreAcademicClassesTaugh corequality

gen year = 2016 //Generate year variable
label variable year "Year of interest"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

destring licensed, replace //Turn rate of licensed teacher to a double
destring corequality, replace //Turn rate of quality instructor for core classes to a double
drop if licensed == 0 //Drop empty observations

order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/teachdat1516.dta, replace //Save to a dta file
clear
exit
