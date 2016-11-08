//Write a method that takes in two numbers and returns true only if the last digit of both numbers are the same.  
//Ex.  Returns true for inputs 7 and 17.  
//     Returns true for 44 and 34.  
//     Returns false for 6 and 63. 
method lastDigit(a, b) -> Boolean {
  if(ones(a) == ones(b)) then {
      return true
  }
  return false
}

method ones(num) {
    var result := num
    while {result > 10} do {
        result := result / 10
    }
    return result
}

print(lastDigit(13,63))

