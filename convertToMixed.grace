dialect "minitest"

method convertToMixed(numerator, denominator) {
    //Write a method that takes an improper fraction and writes it as a mixed number.
    //An improper fraction is a fraction where the numerator is bigger than the denominator.
    //A mixed number is a whole with a proper fraction
    if(numerator < denominator) then {
        return numerator.asString ++ "/" ++ denominator.asString
    }
    else {
        var whole := (numerator/denominator)
        var partial := (numerator % denominator) ++ "/" ++ denominator
        return whole ++ partial
    }
}

testSuite {
    test "nine-four" by {
        assert (convertToMixed(9,4) == "2+1/4") description ("9/4 should be 2+1/4!")
    }
    test "two-two" by {
        assert (convertToMixed(2,2) == "1+0/2") description ("2/2 should be 1+0/2")
    }
    test "twelve-four" by {
        assert (convertToMixed(12,4) == "3+0/4") description ("12/4 should be 3+0/4")
    }
    test "seventy-seven-ten" by {
        assert (convertToMixed(77,10) == "7+7/10") description ("77/19 should be 7+7/10")
    }
}