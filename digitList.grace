// Write a function that takes a number and returns a list of its digits.

method digitList(num) {
    var tempNum := num
    var numList := list []
    while { tempNum > 10 } do {
        numList.add((tempNum % 10))
        tempNum := (tempNum / 10)
    }
    numList
}

print(digitList(54321))