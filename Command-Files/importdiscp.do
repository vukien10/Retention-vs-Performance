/* 398 Project - Import Discp*
Created by Kien Vu
Date: 3/24/2020
Written for Stata 14-MP, 64-bit, for Mac
*/

clear
set more off
capture log close
graph drop _all
********************** 398 Project - Import Discp ************************

cd "Command-Files"
import excel "../Original-Data/Importable-Data/discp1213_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename Students stnum
rename StudentsDisciplined discpnum

gen year = 2013 //Generate year variable
label variable year "Year of interest"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

replace stnum = subinstr(stnum,",","",7) //Delete the comma in student number
replace discpnum = subinstr(discpnum,",","",7) //Delete the comma in disciplined number

destring stnum, replace //Turn student number to a double
destring discpnum, replace //Turn disciplined number to a double
order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/discp1213.dta, replace //Save to a dta file

clear

import excel "../Original-Data/Importable-Data/discp1314_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename Students stnum
rename StudentsDisciplined discpnum

gen year = 2014 //Generate year variable
label variable year "Year of interest"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

replace stnum = subinstr(stnum,",","",7) //Delete the comma in student number
replace discpnum = subinstr(discpnum,",","",7) //Delete the comma in disciplined number

destring stnum, replace //Turn student number to a double
destring discpnum, replace //Turn disciplined number to a double
order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/discp1314.dta, replace //Save to a dta file

clear

import excel "../Original-Data/Importable-Data/discp1415_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename Students stnum
rename StudentsDisciplined discpnum

gen year = 2015 //Generate year variable
label variable year "Year of interest"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

replace stnum = subinstr(stnum,",","",7) //Delete the comma in student number
replace discpnum = subinstr(discpnum,",","",7) //Delete the comma in disciplined number

destring stnum, replace //Turn student number to a double
destring discpnum, replace //Turn disciplined number to a double
order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/discp1415.dta, replace //Save to a dta file

clear

import excel "../Original-Data/Importable-Data/discp1516_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename Students stnum
rename StudentsDisciplined discpnum

gen year = 2016 //Generate year variable
label variable year "Year of interest"

destring distcode, replace //Turn district code to a double
drop if distcode == 0 //Drop state total 
sort distcode

replace stnum = subinstr(stnum,",","",7) //Delete the comma in student number
replace discpnum = subinstr(discpnum,",","",7) //Delete the comma in disciplined number

destring stnum, replace //Turn student number to a double
destring discpnum, replace //Turn disciplined number to a double
order distname distcode year //Reorder the columns

save ../Original-Data/Imported-Data/discp1516.dta, replace //Save to a dta file

clear
exit
