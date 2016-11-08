import "wordList" as wordList

var currentWord
var givenUp := false
var guesses := list [ ]

method newGame {
    currentWord := wordList.atRandom.asLower
    givenUp := false
    guesses := list [ ]
    currentWord
}

method isBadGuess(char) -> Boolean {
    // returns true if `char` has not been guessed before, and is not in
    // the word, or if the player has given up;  otherwise false.  In both 
    // cases, remembers the guess `char`.  The case of `char` is irrelevant
    if(givenUp) then {
        return true
    }
    if(!guesses.contains(char.asLower)) then {
        guesses.add(char.asLower)
        if(!currentWord.contains(char.asLower)) then {
            return true
        }
    }
    false
}

method wordSize -> Number {
    // the number of letters in the secret word
    currentWord.size
}

method giveUp -> String {
    givenUp := true
    currentWord
}

method maxNumberOfBadGuesses {
    if(wordSize > 8) then {
        return 6
    }
    5
}

method showLetter(l) -> String {
    // returns a string the same length as the secret word, with
    // all occurences of letter `l` in their correct places, and 
    // all other letters replaced by _
    var temp := ""
    for (currentWord) do { ch →
        if (!(ch == l)) then {
            temp := temp ++ "_"
        }
        else {
            temp := temp ++ ch
        }
    }
    if(!guesses.contains(l.asLower)) then {
        guesses.add(l.asLower)
    }
    temp
}

method allLettersGuessed -> Boolean {
    // returns true if all of the letters have been guessed, otherwise false
    for (currentWord) do { ch →
        if (!guesses.contains(ch)) then {
            return false
        }
    }
    true
}

method forceSecretWordToBe(w) {
    // this method is for testing only.  It won't be requested by the apple-framework
    // It lets a test force the secret word to the known value `w`
    currentWord := w
}