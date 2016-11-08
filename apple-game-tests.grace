dialect "minitest"

import "apple-game" as game

testSuite {
    test "word is lower-case" by {
        game.newGame
        def secret = game.giveUp
        assert (secret.asLower == secret) 
            description "the secret word \"{secret}\" contains upper-case letters"
    }
    test "word contains letters" by {
        game.newGame
        def secret = game.giveUp
        secret.do { ch ->
            assert ( ch.startsWithLetter ) 
                description "the secret word contains \"{ch}\", which isn't a letter"
        }
    }
    test "word is non-empty" by {
        game.newGame
        def secret = game.giveUp
        assert (secret.isEmpty.not) description "the secret word is empty"
    } 
    test "wordSize" by {
        game.newGame
        def sz = game.wordSize
        def secret = game.giveUp
        assert (secret.size == sz) 
            description "the secret word \"{secret}\" has size {secret.size}, but wordSize is {sz}"
    }
    test "letters in word" by {
        game.newGame
        def testWord = "abracadabra"
        game.forceSecretWordToBe (testWord)
        for "abrcd" do { ch -> 
            deny (game.isBadGuess (ch)) 
                description "when word is \"{testWord}\", \"{ch}\" was reported as a bad guess"
        }
    }
    test "repeated guesses" by {
        game.newGame
        def testWord = "abracadabra"
        game.forceSecretWordToBe (testWord)
        for "wqzo" do { ch -> 
            assert (game.isBadGuess (ch)) 
                description "when word is \"{testWord}\", \"{ch}\" was not recognized as a bad guess"
        }
        for "wqzo" do { ch -> 
            deny (game.isBadGuess (ch)) 
                description "\"{ch}\" was said to be a bad guess the second time it was guessed"
        }
    }
    test "guess after giving up" by {
        game.newGame
        def secret = game.giveUp
        def guess = secret.at(((secret.size + 1)/2).ceiling)
        assert (game.isBadGuess(guess)) 
            description "when word is \"{secret}\", \"{guess}\" was said to be a good guess even after giving-up"
    }
    test "show letter a" by {
        game.newGame
        def testWord = "abracadabra"
        game.forceSecretWordToBe (testWord)
        assert (game.showLetter "a") shouldBe "a__a_a_a__a"
        deny (game.isBadGuess "a") description "after showLetter \"a\", \"a\" was a bad guess!"
    }
    test "show letter d" by {
        game.newGame
        def testWord = "abracadabra"
        game.forceSecretWordToBe (testWord)
        assert (game.showLetter "d") shouldBe "______d____"
        deny (game.isBadGuess "d") description "after showLetter \"d\", \"d\" was a bad guess!"
    }
    test "show letter z" by {
        game.newGame
        def testWord = "abracadabra"
        game.forceSecretWordToBe (testWord)
        assert (game.showLetter "z") shouldBe "___________"
        deny (game.isBadGuess "z") description "after showLetter \"z\", \"z\" was a bad guess!"
    }
    test "max guesses" by {
        repeat 10 times {
            game.newGame
            def secretWordSize = game.wordSize
            def specifiedSize = 
                if (secretWordSize > 8) then { 6 } else { 5 }
            assert (game.maxNumberOfBadGuesses) shouldBe (specifiedSize)
        }
    }
    test "all letters guessed" by {
        def testWord = "metropolis"
        game.forceSecretWordToBe (testWord)
        testWord.do { each ->
            deny (game.isBadGuess (each))  
                description "when word is \"{testWord}\", \"{each}\" was reported as a bad guess"
        }
        assert (game.allLettersGuessed) 
            description "after guessing all the letters in \"{testWord}\", allLettersGuessed wasn't true"
    }
}
