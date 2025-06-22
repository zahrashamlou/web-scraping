



capture frame drop newspaper
capture frame create newspaper
capture frame change newspaper


import delimited "C:\Users\claudioq\Desktop\newspapers\covid.csv", clear
// rename covid word
drop if year==0

cap drop dateShamsi
gen dateShamsi = string(year) +"/"+ string(month) +"/"+ string(day)


jal2greg dateShamsi, gen(date)

capture drop dayAfterEvent 
gen dayAfterEvent = date - date("2019/11/15","YMD")

preserve
	
	collapse (mean) gasoline (mean) covid , by(date)
	label variable gasoline "Gasoline"
	label variable covid "Covid-19"

	drop if covid>230
	
	tsset date, daily

	graph twoway tsline gasoline , color(green%80 ) lwidth(medthick ) /// 
		graphregion(color(white)) ///
		ytitle("word frequency") xtitle("date") ///
		legend(off) ylabel(0(50)170) ///
		tline(  15nov2019 , lcolor(gray) lpattern(dash)) ///
		name("newspaper1", replace) ///
		ttext(140  15nov2019  "Gasoline Reform" "15 Nov 2019" , placement(l) size(medium) color(green)) ///
		ttext(30  30jul2019  "Gasoline related" "words" , placement(l) size(medium) color(green))
	
	graph export "./Graph/Newspaper_A1_word_count_gasoline_1.pdf", replace
	
	graph twoway tsline gasoline covid, color(green%80 orange%70) lwidth(medthick medthick) /// 
		graphregion(color(white)) ///
		ytitle("word frequency") xtitle("date") ///
		legend(off) ylabel(0(50)170) ///
		tline(  15nov2019 , lcolor(gray) lpattern(dash)) ///
		tline(  20feb2020 , lcolor(gray) lpattern(dash)) ///
		name("newspaper2", replace) ///
		ttext(140  15nov2019  "Gasoline Reform" "15 Nov 2019" , placement(l) size(medium) color(green)) ///
		ttext(140  20feb2020  "Covid-19" "20 Feb 2019" , placement(l) size(medium) color(orange)) ///
		ttext(30  30jul2019  "Gasoline related" "words" , placement(l) size(medium) color(green))
	
	graph export "./Graph/Newspaper_A1_word_count_gasoline_2.pdf", replace
	
	
restore

//
// preserve
//
// 	local binDaySize = 7
// 	local start = -30
// 	local end = 21
// 	local start_days = `start'*`binDaySize'
// 	local end_days = `end'*`binDaySize'
// 	local step = `binDaySize'*2
//
// 	capture drop monthAfter
// 	generate monthAfter = floor(dayAfterEvent/`binDaySize')
// 	replace monthAfter=. if monthAfter<`start' | monthAfter>`end'
// 	replace monthAfter = monthAfter* `binDaySize'
//
// 	hashsort monthAfter
//
//
// 	drop if mi(monthAfter)
//
// 	collapse (mean) gasoline (mean) covid (mean) monthAfter, by(date)
// 	collapse (mean) gasoline (mean) covid , by(monthAfter)
//	
// 	#delimit;
// 	gr tw 	
// 		connected gasoline monthAfter,
// 		legend(label(1 "gasoline")) lw(.5 1.2) lcolor(navy) mcolor(navy) msymbol(S)
// 		||
// 		connected covid monthAfter,
// 		legend(label(2 "covid")) lw(.5 1.2) lcolor(gray) mcolor(gray)
// 		legend(pos(6) ring(1) col(2) region(lcolor(white)) order(1 2))  
// 		ytitle("Average Word Frequency") xtitle("Days Since Event")
// 		xline(0, lc(gray%30) lwidth(`step'pt))
// 		xlabel(`start_days'(`step')`end_days') 
// 		name("word", replace) graphregion(color(white))
// 			;
// 	#delimit cr
// 	// graph export "./Graph/.pdf", replace 
//
//
// restore



