//Write a function that takes a list of strings 
//an prints them, one per line, in a rectangular 
//frame. For example the list 
//["Hello", "World", "in", "a", "frame"] 
//gets printed as:
//
//*********
//* Hello *
//* World *
//* in    *
//* a     *
//* frame *
//*********

method printFrame(listOfString) {
    var maxSize := 0
    for (listOfString) do { l →
        if (l.size > maxSize) then {
            maxSize := l.size
        }
    }
    maxSize := maxSize + 4
    var border := ""
    for (1..maxSize) do { i →
        border := border ++ "*"
    }
    print(border)
    for (listOfString) do { l →
        var spaces := ""
        def len = maxSize - 4 - l.size
//        print(len)
        for(1..len) do { i →
            spaces := spaces ++ " "
        }
        print("* " ++ l ++ spaces ++ " *")
    }
    print(border)
}

printFrame( list ["hello", "world", "in", "a", "frame"])