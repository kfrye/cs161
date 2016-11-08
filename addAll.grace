dialect "minitest"

method sumOfList(numberList) {
    var sum := 0
    for (numberList) do { num →
        sum := num
    }
    sum
}

testSuite {
    test "1, 2, 3" by { assert (sumOfList(list [1, 2, 3])) shouldBe 6 }
    test "2, 2, 2" by { assert (sumOfList(list [2, 2, 2])) shouldBe 6 }
}