// Write a function that computes the running total of a list.

method runningTotal(numberList) {
    var sum := 0
    for (numberList) do { num →
        sum := sum + num
        print(sum)
    }
}

print(runningTotal(list [1,2,3,4]))