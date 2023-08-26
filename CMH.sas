/*IMPORT DATA*/
proc import datafile="/home/u62868661/Datasets/Cochran-Mantel-Haenszel test/Niacin.xlsx"
dbms=xlsx
out=df
replace;
run;

/*COCHRAN-MANTEL-HAENSZEL TEST*/
proc freq data=df;
	tables  (Study) *(Treatment) *(Vascularization) / cmh nopercent nocum
		nocum plots(only)=(freqplot mosaicplot);
	weight Count;
run;