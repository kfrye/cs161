dialect "minitest"

//Count the number of times the word "bee" appears in the list. Return the 
//number of times it appears.
//Example:
//      ["Yellow", "Black"] → 0
//      ["Yellow", "Black", "bee"] → 1
//      ["BEE", "Bee", "bee"] → 3

def list1 = list ["Yellow", "Black"]
def list2 = list ["Yellow", "Black", "bee"]
def list3 = list ["BEE", "Bee", "bee"]

method beeCount(theList:List) → Number {
    var beeCount := 0
    for (theList) do { each →
        if (each == "bee") then {
            beeCount := beeCount + 1
        }
        
    }
    return beeCount
}

testSuite {
    test "1" by {
        assert(beeCount(list1)) shouldBe 0
    }
    test "2" by {
        assert(beeCount(list2)) shouldBe 1
    }
    test "3" by {
        assert(beeCount(list3)) shouldBe 3
    }
}