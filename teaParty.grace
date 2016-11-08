//We are going to have a tea party with candy.  Write a method that takes in 
//two numbers, representing the cups of tea 
//and number of candy.  The method will calculate how good the tea party was based on 
//these two numbers.  The algorithm is:
//A tea party is good (returns 1) if both amount of tea and number of candy are at least 5.  
//However, if either tea or candy 
//is at least double the amount of the other one, the party is great (returns 2).  
//However, in all cases, if either cups of tea
//or candy is less than 5, the party is always bad (returns 0).  For this one, boolean 
//operators are very important as is 
//the order of your statements.  Also, are all cases covered?  Run through several examples 
//to answer this for yourself.  
//Ex.  teaParty(6,8) should return 1
//     teaParty (3,8) should return 0
//     teaParty (12,6) should return 2

method teaParty(tea, candy) -> Number {
    if((tea ≥ (2 * candy)) || (candy ≥ (2 * tea))) then {
        return 2
    }
    if((tea < 5) || (candy < 5)) then {
        return 0
    }
    return 1
}

print(teaParty(1,10))
