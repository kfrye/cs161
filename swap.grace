//Write a method that swaps the first and last items in a list.
//Ex. If the list was originally [1,2,3,4], then swap will result in [4,2,3,1].  
//    For a list of strings, ["orange", "grape", "strawberry"], swap will result in ["strawberry","grape", "orange]
method swap(myList:List) -> List{
    var first := myList.removeFirst
    myList.addLast(first)
    var last := myList.removeLast
    myList.addFirst(last)
}

var myList := list [1,2,3,4]
print(swap(myList))