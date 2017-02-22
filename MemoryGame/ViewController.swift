//
//  ViewController.swift
//  MemoryGame
//
//  Created by Roque Rueda on 20/02/17.
//  Copyright © 2017 HCL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var memoryBoard: UICollectionView!
    
    var memoryGame: MemoryGame = MemoryGame();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        memoryGame.card = memoryGame.startGame(cardImages: memoryGame.cardImages)
        memoryBoard.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memoryGame.card.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cardCell", for: indexPath) as! CardCellCollectionViewCell
        
        cell.id = memoryGame.card[indexPath.row].id
        cell.image.image = memoryGame.card[indexPath.row].image
        
        return cell;
        
    }
    
}

