//
//  MemoryAnimationDelegate.swift
//  MemoryGame
//
//  Created by Roque Rueda on 23/02/17.
//  Copyright © 2017 HCL. All rights reserved.
//

import UIKit

protocol MemoryAnimationDelegate {
    
    func showCard(card: Card)
    
    func hideCard(card: Card)
    
}
