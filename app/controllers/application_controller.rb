class ApplicationController < ActionController::Base

    class Game
        attr_reader :player1, :player2, :player3
    
        def initialize
            @player1 = Player.new ("Alice")
            @player2 = Player.new ("Bob")
            @player3 = Player.new ("Carol")
        end
    
        def turn
            # loop through array of players
                # let players play (display status :)
            # check if one player has all cards revealed > win
        end
    end
    
    class Player
        attr_reader :name, :card1, :card2, :card3, :card4, :card5
    
        def initialize (name)
            @name = name
            @card1 = Card.new # problem: colours are not always unique over a set of 5 cards!
            @card2 = Card.new
            @card3 = Card.new
            @card4 = Card.new
            @card5 = Card.new
        end
    
        def play
            die = Die.new
            # go through array of cards till colour match > reveal card
        end
    end
    
    class Card
        attr_reader :colour, :revealed
    
        def initialize
            @colour = Die.new
            @revealed = false
        end
    
        def reveal 
            @revealed = true
        end
    end
    
    class Die
        attr_reader :colour
    
        def initialize
            @colour = [ "blue", "red", "yellow", "green", "black", "white" ].sample
        end
    end
    
end
