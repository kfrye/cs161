//Write a function that takes a list of strings an prints them, one per line, in a rectangular frame. For example the list ["Hello", "World", "in", "a", "frame"] gets printed as:
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
    var border := ""
    for (1..maxSize) do { i →
        border := border ++ "*"
    }
    print(border)
    for (listOfString) do { l →
        print("* " ++ l ++ " *")
    }
    print(border)
}

printFrame( list ["hello", "world", "in", "a", "frame"])