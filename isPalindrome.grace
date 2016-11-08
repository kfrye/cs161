//Write a function that tests whether a string 
//is a palindrome.

method isPalindrome(myString) {
    var first := 1
    var second := myString.size
    while {first < second} do {
        if(myString.at(first) != myString.at(second)) then {
            return false
        }
        first := first + 1
        second := second - 1
    }
    return true
}

print(isPalindrome("abcba"))