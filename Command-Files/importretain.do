/* 398 Project - Import staffretain*
Created by Kien Vu
Date: 3/24/2020
Written for Stata 14-MP, 64-bit, for Mac
*/

clear
set more off
capture log close
graph drop _all
********************** 398 Project - Import staffretain ************************

cd "Command-Files"
import excel "../Original-Data/Importable-Data/staffretain12_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename PrincipalRetained retperc_p
rename TeacherRetained retperc_t

gen year = 2013 //Generate year variable
label variable year "Year of interest"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

destring retperc_p, replace //Turn principal retention percentage to a double
destring retperc_t, replace //Turn teacher retention percentage to a double
order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/staffretain12_clean.dta, replace //Save to a dta file

clear
import excel "../Original-Data/Importable-Data/staffretain13_imp.xlsx", firstrow //Repeat the process with later years

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename PrincipalRetained retperc_p
rename TeacherRetained retperc_t

gen year = 2014 //Generate year variable
label variable year "Year of interest"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

destring retperc_p, replace //Turn principal retention percentage to a double
destring retperc_t, replace //Turn teacher retention percentage to a double
order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/staffretain13_clean.dta, replace //Save to a dta file

clear
import excel "../Original-Data/Importable-Data/staffretain14_imp.xlsx", firstrow //Repeat the process with later years

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename PrincipalRetained retperc_p
rename TeacherRetained retperc_t

gen year = 2015 //Generate year variable
label variable year "Year recorded"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

destring retperc_p, replace //Turn principal retention percentage to a double
destring retperc_t, replace //Turn teacher retention percentage to a double
order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/staffretain14_clean.dta, replace //Save to a dta file

clear
import excel "../Original-Data/Importable-Data/staffretain15_imp.xlsx", firstrow  //Repeat the process with later years

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename PrincipalRetained retperc_p
rename TeacherRetained retperc_t

gen year = 2016 //Generate year variable
label variable year "Year recorded"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

destring retperc_p, replace //Turn principal retention percentage to a double
destring retperc_t, replace //Turn teacher retention percentage to a double
order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/staffretain15_clean.dta, replace //Save to a dta file

exit
