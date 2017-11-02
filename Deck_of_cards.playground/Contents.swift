//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Card {
    let Color: String
    let Roll: Int
    //giving cards properties to use later

}




class Deck {
    var cards = [Card]()
    init(){
        for _ in 0...9 {
            self.cards.append(Card(Color: "Blue", Roll: Int(arc4random_uniform(2)+1)))
            self.cards.append(Card(Color: "Red", Roll: Int(arc4random_uniform(2)+3)))
            self.cards.append(Card(Color: "Green", Roll: Int(arc4random_uniform(2)+5)))
    //creating the cards after init()
        }
    }

func deal() -> Card? {
    if self.cards.count > 0 {
        return self.cards.remove(at: 0)
        //removes the card at the [0] index
    }
    else {
        return nil
    }
}

func isEmpty() -> Bool {
    if self.cards.count > 0{
        return false
    }
    else{
        return true
    }
}

func shuffle(){
    for i in stride(from: self.cards.count-1, to: 0, by: -1){
        //counting from 30 cards to 0, this method will include 0
        let swapIndex = Int(arc4random_uniform(UInt32(i)))
        let temp = self.cards[i]
        self.cards[i] = self.cards[swapIndex]
        self.cards[swapIndex] = temp
    }
}


}

class Player {
    var name: String
    var hand = [Card]()
    
    init(name: String){
        self.name = name
    }
    
    func draw(deck:Deck) -> Card? {
        if let drawnCard = deck.deal(){
            self.hand.append(drawnCard)
            return drawnCard
        } else {
            return nil
        }
    }
    
    func rollDice() -> Int {
        let random = arc4random_uniform(6)+1
        return Int(random)
    }
    
    func matchingCards(Roll: Int, Color: String) -> Int {
        var count: Int = 0
        for x in hand {
            if (Roll == x.Roll && Color == x.Color){
                count += 1
            }
        }
        print(count)
        return count
    }
}
