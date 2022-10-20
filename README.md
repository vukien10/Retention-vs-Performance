# Education-paper

I. Contents of the replication documentation (Vu-398-Project) -
The replication documentation includes a structure of the folder organized as shown below: 
1. [FinalPaper-Vu.pdf](https://github.com/vukien10/Retention-vs-Performance/blob/main/FinalPaper-Vu.pdf)
2. [ReadMe-Vu-E398.pdf](https://github.com/vukien10/Retention-vs-Performance/blob/main/ReadMe-Vu-E398.pdf )
3. [Analysis-Data](https://github.com/vukien10/Retention-vs-Performance/tree/main/Analysis-Data ) (A subfolder of Vu-398-Project)
- analysis-file.dta
4. [Command-Files](https://github.com/vukien10/Retention-vs-Performance/tree/main/Command-Files) (A subfolder of Vu-398-Project)
- Analysis.do
- Construction.do
- Processing.do
- importclsize.do
- importdiscp.do	
- importexpen.do
- importmcas.do
- importndiscp.do
- importretain.do
- importteachdat.do
- importwage.do
5. [Documents](https://github.com/vukien10/Retention-vs-Performance/tree/main/Documents) (A subfolder of Vu-398-Project)
- AnnotatedBibliography_KienVu.docx
- Data&Methods-Vu.docx
- LiteratureReview-Vu.docx
- Proposal - Vu.docx
- Results&Discussions-Vu.docx
6. [Original-Data](https://github.com/vukien10/Retention-vs-Performance/tree/main/Original-Data) (A subfolder of Vu-398-Project)
- Original Data (A subfolder of Original-Data)
- classsize1213.xlsx to classsize1516.xlsx
	- discp1213.xlsx to discp1516.xlsx
	- discp1213n.xlsx to discp1516n.xlsx
	- expen12.xlsx to expen15.xlsx
	- mcas13.xlsx to mcas16.xlsx
	- staffretain12.xlsx to staffretain15.xlsx
	- teachdat1213.xlsx to teachdat1516.xlsx
	- teachwage1213.xlsx to teachwage1516.xlsx
- Importable-Data (A subfolder of Original-Data): Similar file names to Original Data with _imp in the end e.g. classsize1213_imp.xlsx.
- Imported-Data (A subfolder of Original-Data): Similar names to Original Data with _clean in the end e.g. classsize1213_clean.dta.
- Base files derived from Imported-Data e.g. base_clsize.dta
- base-file.dta
- base-file-clean.dta
- Metadata (A subfolder of Original-Data)
	- data.aspx.html
	- Glossary of Accountability Reporting Terms.htm
	- MetadataGuide.docx

II. Modifications made to importable data files:
1. To obtain staffretain12_imp.xlsx to staffretain15_imp.xlsx: 
- Delete Column I-J, then C-G. We are interested in % retention of principals and teachers.  
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as Importable-Data/staffretain15_imp.xlsx. 
2. To obtain expen12_imp.xlsx to expen15_imp.xlsx: 
- Delete Column F-G, then C-D. We are interested in the per-pupil expenditures only. 
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as Importable-Data/ expen15_imp.xlsx. 
3. To obtain mcas13_imp.xlsx to mcas16_imp.xlsx:
- Delete Column D-N. We are interested in the performance level percentages only. 
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as Importable-Data/ mcas15_imp.xlsx. 
4. To obtain teachwage1213_imp.xlsx to teachwage1516_imp.xlsx:
- Delete Column E, then column C. We are interested in the average salary only. 
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as teachwage1516_imp.xlsx. 
5. To obtain discp1213_imp.xlsx to discp1516_imp.xlsx:
- Delete Column E-J. We are interested in student disciplined measures only. 
- For easier importing to Stata, delete Row 1 from the spreadsheet and save as discp1516_imp.xlsx. 
6. To obtain discp1213n_imp.xlsx to discp1516n_imp.xlsx:
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
