//
//  Card.swift
//  MemoryGame
//
//  Created by Roque Rueda on 20/02/17.
//  Copyright © 2017 HCL. All rights reserved.
//

import UIKit

class Card: NSObject {
    
    var id      : Int
    var display : Bool
    var image   : UIImage
    
    init(image: UIImage) {
        self.id = 0
        self.display = false
        self.image = image
    }
    
    init(card: Card) {
        self.id         = card.id
        self.display    = card.display
        self.image      = card.image
    }
    
    override var description: String {
        return "Card: \(self.id) \(self.display)"
    }
    
    func match(card: Card) -> Bool {
        return self.id == card.id
    }

}
