//Write a program to search for the "saddle points" in a 5 by 5 array of integers. 
//A saddle point is a cell whose value is greater than or equal to any in its row, 
//and less than or equal to any in its column. There may be more than one saddle point 
//in the array. Print out the coordinates of any saddle points your program finds. 
//Print out "No saddle points" if there are none.

var numberArray := list [ list [34, 21, 32, 41, 25],
                          list [14, 42, 43, 42, 50],
                          list [54, 45, 52, 54, 23],
                          list [33, 15, 51, 80, 35],
                          list [21, 52, 33, 92, 23] ]
 
method calcMinInColumn(doubleList, col) {
    var min := doubleList.at(1).at(col)
    for (doubleList) do { l →
        if (l.at(col) < min) then {
            min := l.at(col)
        }
    }
    min
    
}

class Point(x,y) {
    method asString {
        return "(" ++ x ++ "," ++ y ++ ")"
    }
}

method findSaddlePoints(numList) {
    var row := 1
    var col := 1
    var saddlePoints := list []
    for(1..numList.size) do { i →
        for(1..i) do { j →
            var num := numList.at(i).at(j)
            var sortedList := numList.at(i).sorted
            if (num == sortedList.at(1)) then {
                if(num == calcMinInColumn(numList, j)) then {
                    saddlePoints.add(Point(i,j))
                }
            }
        }
    }
    saddlePoints
}

print(findSaddlePoints(numberArray))