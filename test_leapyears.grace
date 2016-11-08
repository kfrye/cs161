dialect "minitest"
import "leapyears" as ly

testSuite {
    def years = ly.get_leapyears

    test "year2000" by {
        assert (years.contains 2000) description ("2000 should be a leap year!")
    }
    test "year2001" by {
        deny (years.contains 2001) description ("2001 should not be a leap year!")
    }
    test "year1900" by {
        deny (years.contains 1900) description ("1900 should not be a leap year!")
    }
    test "year2100" by {
        deny (years.contains 2100) description ("2100 should not be a leap year!")
    }
    test "year2004" by {
        assert (years.contains 2004) description ("2004 should be a leap year!")
    }
}