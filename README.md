# Education-paper

I. Contents of the replication documentation (Vu-398-Project):
The replication documentation includes a structure of the folder organized as shown below: 
Vu-398-Project (The main project folder): 
ReadMe-Vu-E398.pdf
FinalPaper-Vu.pdf
Analysis-Data (A subfolder of Vu-398-Project)
	analysis-file.dta
Command-Files (A subfolder of Vu-398-Project)
	Analysis.do
	Construction.do
	Processing.do
	importclsize.do
	importdiscp.do
	importexpen.do
	importmcas.do
	importndiscp.do
	importretain.do
	importteachdat.do
	importwage.do
Documents (A subfolder of Vu-398-Project)
	FinalPaper-Vu.docx
	ReadMe-Vu-E398.docx
Original-Data (A subfolder of Vu-398-Project)
	Original Data (A subfolder of Original-Data)
		classsize1213.xlsx to classsize1516.xlsx
		discp1213.xlsx to discp1516.xlsx
		discp1213n.xlsx to discp1516n.xlsx
		expen12.xlsx to expen15.xlsx
			mcas13.xlsx to mcas16.xlsx
			staffretain12.xlsx to staffretain15.xlsx
			teachdat1213.xlsx to teachdat1516.xlsx
			teachwage1213.xlsx to teachwage1516.xlsx
	Importable-Data (A subfolder of Original-Data)
		Similar file names to Original Data with _imp in the end e.g. classsize1213_imp.xlsx
	Imported-Data (A subfolder of Original-Data)
		Similar names to Original Data with _clean in the end e.g. classsize1213_clean.dta
		Base files derived from Imported-Data e.g. base_clsize.dta
		base-file.dta
		base-file-clean.dta
		Metadata (A subfolder of Original-Data)
			data.aspx.html
			Glossary of Accountability Reporting Terms.htm
			MetadataGuide.docx

II. Modifications made to importable data files:
1. To obtain staffretain12_imp.xlsx to staffretain15_imp.xlsx: 
Steps to obtain a copy of staffretain15.xlsx (data for year 2015), similarly for the other years:
- Delete Column I-J, then C-G. We are interested in % retention of principals and teachers.  
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as Importable-Data/staffretain15_imp.xlsx. 
2. To obtain expen12_imp.xlsx to expen15_imp.xlsx: 
Steps to obtain a copy of expen15_imp.xlsx (data for year 2015), similarly for the other years:
	- Delete Column F-G, then C-D. We are interested in the per-pupil expenditures only. 
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as Importable-Data/ expen15_imp.xlsx. 
3. To obtain mcas13_imp.xlsx to mcas16_imp.xlsx:
Steps to obtain a copy of mcas15_imp.xlsx (data for year 2015), similarly for the other years:
- Delete Column D-N. We are interested in the performance level percentages only. 
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as Importable-Data/ mcas15_imp.xlsx. 
4. To obtain teachwage1213_imp.xlsx to teachwage1516_imp.xlsx:
Steps to obtain a copy of teachwage1516.xlsx (data for year 15-16):	
	- Delete Column E, then column C. We are interested in the average salary only. 
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as teachwage1516_imp.xlsx. 
5. To obtain discp1213_imp.xlsx to discp1516_imp.xlsx:
Steps to obtain a copy of discp1516.xlsx (data for year 15-16): 	
- Delete Column E-J. We are interested in student disciplined measures only. 
	- For easier importing to Stata, delete Row 1 from the spreadsheet and save as discp1516_imp.xlsx. 
6. To obtain discp1213n_imp.xlsx to discp1516n_imp.xlsx:
Steps to obtain a copy of discp1516n.xlsx (data for year 15-16): 	
- Delete Column E-J. We are interested in student disciplined measures only. 
	- For easier importing to Stata, delete Row 1 from the spreadsheet and save as discp1516n_imp.xlsx. 
7. To obtain classsize1213_imp.xlsx to classsize1516_imp.xlsx:
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as classsize1516_imp.xlsx.  
8. To obtain teachdat1213_imp.xlsx to teachdat1516_imp.xlsx
	- Delete Column G, then E, C respectively. 
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as teachdat1516_imp.xlsx.  

III. Using this documentation to replicate the results: 
To replicate the processing and analysis for this project, you will need access to a computer with Stata 16/IC installed. 
The steps necessary are below: 
- Copy the Vu-398-Project.zip file to the computer. 
- Launch Stata.
- Set Stata’s working directory to the Vu-398-Project folder.
- Open and run each of the import.do files.
- These files will read the importable files and compile the “Imported-Data” files.
- Open and run Processing.do.
- It will compile the base-file.dta file from the “Imported-Data” files.
- Open and run Construction.do
- It will compile the analysis.dta file from the base-file.dta. This is the final data used for analysis in this project. 
- Open and run Analysis.do
- It will compile the summary at Table 1, run and export the regressions in Table 2 and run a robustness test. 
