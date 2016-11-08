//Write a method that takes in a string and doubles every character in the string.  
//Ex.  doubleChar("hello") returns "hheelllloo"
//     doubleChar("haha") returns "hhaahhaa"
method doubleChar (myString:String) -> String{
    var newString := ""
    for(myString) do { ch→
        newString ++ ch
    }
    newString
}

print(doubleChar("test"))