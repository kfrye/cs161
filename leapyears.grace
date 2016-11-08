// This program prints all years between 1900 and 2800 (inclusive) that are leap years
//
// In the Gregorian calendar three criteria must be taken into account to identify leap years:
//  - The year can be evenly divided by 4;
//    -- If the year can be evenly divided by 100, it is NOT a leap year, unless;
//    -- The year is also evenly divisible by 400. Then it is a leap year.
// This means that in the Gregorian calendar, the years 2000 and 2400 are leap years, while 
// 1800, 1900, 2100, 2200, 2300 and 2500 are NOT leap years.

var start_year := 1900
var end_year := 2800

var current_year := start_year
var is_leap_year := false
var leapyears := list []

while { (current_year < end_year) } do {
    if ((current_year % 4) == 0) then {
        if((current_year % 100) == 0) then {
            if((current_year % 400) == 0) then {
                is_leap_year := true
            }
        }
    }
    if(is_leap_year == true) then {
        leapyears.add(current_year)
    }
    current_year := current_year + 1
}

leapyears.do { year ->
  print "{year}"
}

method get_leapyears {
    leapyears
}
