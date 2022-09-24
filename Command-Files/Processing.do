/*** 398 Project Initial Processing ***
Created by Kien Vu
Date: 3/2/2020
Written for Stata/IC 16.0, 64-bit, for Windows
*/

clear
set more off
capture log close
graph drop _all
********************** 398 Project Initial Processing **************************

cd "Command-Files"
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

save "..\Original-Data\base-file.dta", replace

exit
