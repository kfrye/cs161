dialect "minitest"
import "graphix" as graphix
import "random" as random
import "apple-game" as game

def graphics = graphix.create(250,500)

game.newGame
displayForGame(game)

class displayForGame(g) {
    // g is a word guessing game.  Create and draw a display for g
    graphics.clear
    def trunk is public = graphics.addRectangle.at((110@75)).setSize(40@305).colored "SaddleBrown".filled(true).draw
    def leaves is public = graphics.addEllipse.at((5@30)).setSize(250@140).colored "DarkGreen".filled(true).draw

    def newGameButton = graphics.addButton.setText("new game").setSize(75@33).colored "pink" .at(10@415).draw
    def message = graphics.addButton.setSize(250@33).colored "yellow" .at(10@460)
    def inputBox = graphics.addInputBox.setWidth(40).at(100@415).draw
    def wordYlocation = 385
    
    def locationList = list []
    def numberOfApples = g.maxNumberOfBadGuesses
    while {locationList.size < numberOfApples} do {
        def candidateLocation = (random.integerIn 10 to 250) @ (random.integerIn 70 to 130)
        if (anyOf(locationList) overlap (candidateLocation).not) then {
            locationList.add(candidateLocation)
        }
    }
    def appleList = list (locationList.map{ each -> appleAt(each)})
    appleList.do { each -> each.draw }
    
    for (1..g.wordSize) do { s -> 
        def letterBox = graphics.addRectangle
                         .setWidth(20).setHeight(20)
                          .at(((20*s)+5) @ wordYlocation).colored "darkGrey".draw
    }
    
    method anyOf(list) overlap (centerPoint) is confidential {
        list.do { each ->
            if (each.distanceTo(centerPoint) < 20) then { return true }
        }
        return false
    }
    class appleAt(position) {
        // creates and returns a new apple at `position`
        //
        def apple = graphics.addCircle.at(position).setRadius 10 
                        .colored "YellowGreen".filled(true).draw
        var applePath
        def fallAction = {
            if (applePath.isEmpty) then {
                graphics.clearTicker
            } else {
                apple.location := applePath.first
                apple.draw
                outer.inputBox.draw
                applePath.removeFirst
            }
        }
        
        method at(p) { apple.at(p) }
        method location { apple.location }
        method location:=(p) { apple.location := p }
        method draw { apple.draw }
        method asString { "an apple at {apple.location}"}
        
        method fall {
            applePath := fallPath
            graphics.tickEvent(fallAction, 20)
        }
        method fallPath is confidential {
            // generates a new fall path for this apple, using some randomization.
            // returns it.
            def duration = 500
            def path = list []
            def gravity = 2                         // vertical force
            def wind = (random.between 0 and 0.2)   // horizontal force
            def force = wind@gravity
            def damping = 0.4
            var initial := apple.location
            def groundY = 370
            var tick := 0
            var p := initial
            while { p.y < groundY } do {
                // the fall from rest to the ground
                // uses s = ut + (a.t^2)/2
                tick := tick + 1
                p := initial + (force * tick * tick / 2)
                if (p.y > groundY) then { p := p.x@groundY }
                path.addLast(p)
            }
            var v := force * tick
            repeat 5 times {
                def u = (0@0) - (v * damping)
                v := u
                tick := 0
                do {
                    // the bounce:
                    // uses s = ut + (a.t^2)/2 and v = u + at
                    tick := tick + 1
                    p := (p.x@groundY) + (u * tick) + (force * tick * tick / 2)
                    v := u + (force * tick)
                    path.addLast(p)
                } while { p.y < groundY }
            }
            path
        }
    }
    method createLetterButton(ix) labeled (ch) {
        graphics.addButton.setText(ch)
         .setWidth 18 .setHeight 18.at((20*ix + 6) @ (wordYlocation+1)).draw
    }
    method createLetterButtons(showWord) {
        // showWord is a string containing letters to expose, and _ where
        // the letter shoudl remain hiddden.
        showWord.keysAndValuesDo { ix, ch ->
            if (ch != "_") then {
                createLetterButton(ix) labeled (ch)
            }
        }
    }

    var guessesSoFar := 0
    inputBox.onSubmitDo {
        def letter = inputBox.value.asLower
        if (g.isBadGuess(letter)) then {
            guessesSoFar := guessesSoFar + 1
            var myApple := appleList.at(guessesSoFar)
            myApple.fall
        } else {
            createLetterButtons(g.showLetter(letter))
        }
        inputBox.value := ""

        if (g.allLettersGuessed) then {
            message.setText "Congratulations!  You win".draw
            inputBox.onSubmitDo { }
        } elseif {guessesSoFar == numberOfApples} then {
            message.setText "You loose! The word was {game.giveUp}".draw
            inputBox.onSubmitDo { }
        }       
    }
    newGameButton.onClick := {
        inputBox.value := ""
        game.newGame
        displayForGame(game)
    }
}

