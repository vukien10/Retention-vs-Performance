/* 398 Project - Import classsize*
Created by Kien Vu
Date: 3/24/2020
Written for Stata 14-MP, 64-bit, for Mac
*/

clear
set more off
capture log close
graph drop _all
********************** 398 Project - Import classsize ************************

cd "Command-Files"
import excel "../Original-Data/Importable-Data/classsize1213_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename AverageClassSize classsize
rename Female stfemale
rename EnglishLanguageLearner ellperc
rename StudentswithDisabilities disabperc
rename EconomicallyDisadvantaged poorperc

gen year = 2013 
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
destring classsize, replace
drop if classsize == 0 //Drop nonreporting districts
sort distcode
order distname distcode year //Order the columns
drop if poorperc == "#####" //Drop nonreporting districts 

destring stfemale, replace //Turn the string variables into doubles
destring ellperc, replace
destring disabperc, replace
destring poorperc, replace

save ../Original-Data/Imported-Data/classsize13.dta, replace

clear
import excel "../Original-Data/Importable-Data/classsize1314_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename AverageClassSize classsize
rename Female stfemale
rename EnglishLanguageLearner ellperc
rename StudentswithDisabilities disabperc
rename EconomicallyDisadvantaged poorperc

gen year = 2014 
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode
destring classsize, replace
drop if classsize == 0 //Drop nonreporting districts
order distname distcode year //Order the columns
drop if poorperc == "#####" //Drop nonreporting districts 

destring stfemale, replace //Turn the string variables into doubles
destring ellperc, replace
destring disabperc, replace
destring poorperc, replace

save ../Original-Data/Imported-Data/classsize14.dta, replace

clear
import excel "../Original-Data/Importable-Data/classsize1415_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename AverageClassSize classsize
rename Female stfemale
rename EnglishLanguageLearner ellperc
rename StudentswithDisabilities disabperc
rename EconomicallyDisadvantaged poorperc

gen year = 2015
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode
destring classsize, replace
drop if classsize == 0 //Drop nonreporting districts
order distname distcode year //Order the columns
drop if poorperc == "#####" //Drop nonreporting districts 

destring stfemale, replace //Turn the string variables into doubles
destring ellperc, replace
destring disabperc, replace
destring poorperc, replace


save ../Original-Data/Imported-Data/classsize15.dta, replace

clear
import excel "../Original-Data/Importable-Data/classsize1516_imp.xlsx", firstrow

rename DistrictName distname //Rename variables
rename DistrictCode distcode
rename AverageClassSize classsize
rename Female stfemale
rename EnglishLanguageLearner ellperc
rename StudentswithDisabilities disabperc
rename EconomicallyDisadvantaged poorperc

gen year = 2016
label variable year "Year of interest"

destring distcode, replace
drop if distcode == 0 //Drop state total 
sort distcode
destring classsize, replace
drop if classsize == 0 //Drop nonreporting districts
order distname distcode year //Order the columns
drop if poorperc == "#####" //Drop nonreporting districts 

destring stfemale, replace //Turn the string variables into doubles
destring ellperc, replace
destring disabperc, replace
destring poorperc, replace

save ../Original-Data/Imported-Data/classsize16.dta, replace


exit
