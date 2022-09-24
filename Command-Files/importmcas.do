/* 398 Project - Import MCAS*
Created by Kien Vu
Date: 3/24/2020
Written for Stata 14-MP, 64-bit, for Mac
*/

clear
set more off
capture log close
graph drop _all
********************** 398 Project - Import MCAS ************************

cd "Command-Files"
import excel "../Original-Data/Importable-Data/mcas13_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename Subject subject
rename MedianSGP sgpmed
rename CPI cpi

gen year = 2013
label variable year "Year of interest"

destring distcode, replace //turn District code values into a double
sort distcode

drop if subject != "MATHEMATICS" //Filter for Math MCAS scores
drop if distcode == 0 //Drop state total 

destring sgpmed, replace //Turn SGP percentiles into doubles
destring cpi, replace //Turn CPI percentiles into doubles
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/mcas13_clean.dta, replace

clear
import excel "../Original-Data/Importable-Data/mcas14_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename Subject subject
rename MedianSGP sgpmed
rename CPI cpi

gen year = 2014
label variable year "Year of interest"

destring distcode, replace //turn District code values into a double
sort distcode

drop if subject != "MATHEMATICS" //Filter for Math MCAS scores
drop if distcode == 0 //Drop state total 

destring sgpmed, replace //Turn SGP percentiles into doubles
destring cpi, replace //Turn CPI percentiles into doubles
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/mcas14_clean.dta, replace

clear
import excel "../Original-Data/Importable-Data/mcas15_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename Subject subject
rename MedianSGP sgpmed
rename CPI cpi

gen year = 2015
label variable year "Year of interest"

destring distcode, replace //turn District code values into a double
sort distcode

drop if subject != "MATHEMATICS" //Filter for Math MCAS scores
drop if distcode == 0 //Drop state total 

destring sgpmed, replace //Turn SGP percentiles into doubles
destring cpi, replace //Turn CPI percentiles into doubles
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/mcas15_clean.dta, replace

clear
import excel "../Original-Data/Importable-Data/mcas16_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename Subject subject
rename MedianSGP sgpmed
rename CPI cpi

gen year = 2016
label variable year "Year of interest"

destring distcode, replace //turn District code values into a double
sort distcode

drop if subject != "MATHEMATICS" //Filter for Math MCAS scores
drop if distcode == 0 //Drop state total 

destring sgpmed, replace //Turn SGP percentiles into doubles
destring cpi, replace //Turn CPI percentiles into doubles
order distname distcode year //Order the columns

save ../Original-Data/Imported-Data/mcas16_clean.dta, replace

clear

exit
