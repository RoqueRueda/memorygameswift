//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Roque Rueda on 20/02/17.
//  Copyright © 2017 HCL. All rights reserved.
//

import UIKit
import GameKit

class MemoryGame: NSObject {
    
    var cardImages      : [UIImage] = [
        UIImage(named: "Account-128")!,
        UIImage(named: "Audio-128")!,
        UIImage(named: "Chat2-128")!,
        UIImage(named: "Close-128")!,
        UIImage(named: "Lock_red-128")!
    ]
    
    var card            : [Card] = [Card]()
    var displayedCards  : [Card] = [Card]()
    
    var isPlaying   : Bool = false
    
    func startGame(cardImages: [UIImage]) -> [Card] {
        var result : [Card] = [Card]()
        var idCounter = 1;
        for image in cardImages {
            // Create the card using an image
            let card = Card.init(image: image)
            card.id = idCounter
            // Increase the counter
            idCounter += 1
            
            // Add the card to the result array.
            result.append(card)
        }
        
        result = GKRandomSource.sharedRandom()
            .arrayByShufflingObjects(in: result) as! [Card]
        
        isPlaying = true
        return result
    }

    func pickCard(pickedCard: Card) {
        
        // Basic validation
        if(displayedCards.contains(pickedCard)) {
            return
        }
        
        pickedCard.display = true
        
        // Show animation
        
        if (displayedCards.count != 0 && displayedCards.count % 2 == 1) {
            // There is a previous card displayed
            let lastCard = displayedCards.last!
            if(lastCard.match(card: pickedCard)) {
                displayedCards.append(pickedCard)
            } else {
                displayedCards.removeLast()
                lastCard.display = false;
                // Show animation to hide card
                pickedCard.display = false;
                // Show animation to hide card
            }
        } else {
            // There is no previous card displayed
            displayedCards.append(pickedCard)
        }
    }

}
