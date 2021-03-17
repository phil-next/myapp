class ApplicationController < ActionController::Base

    # how to play
    g = Game.new
    g.start


    class Game
        attr_reader :player1, :player2, :player3
    
        def initialize
            @player1 = Player.new ("Alice")
            @player2 = Player.new ("Bob")
            @player3 = Player.new ("Carol")
            @@win = false
        end

        def start
            loop do
                self.turn
                break if @@win   
            end
        end
    
        def turn
            win = false
            # loop through array of players
            for player in [player1,player2,player3] do
                # let players play (display status :)
                player.play
                # check if player has all cards revealed > win
                if [player.card1.revealed, player.card2.revealed, player.card3.revealed, player.card4.revealed, player.card5.revealed].all?
                    @@win = true
                    puts "Player " + player.name + " wins!" # console print
                    break
                end
            end
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
            # roll the dice
            die = Die.new
            puts "die colour: " + die.colour + " | player: " + self.name # console print
            # loop through array of cards till colour match > reveal card
            for card in [card1,card2,card3,card4,card5] do
                if card.colour.colour.to_s == die.colour.to_s && !card.revealed # skip if card is already revealed
                    card.reveal
                    break
                end
            end
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
