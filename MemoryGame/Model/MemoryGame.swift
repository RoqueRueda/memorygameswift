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
        
    }

}
