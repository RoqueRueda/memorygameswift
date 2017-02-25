//
//  ViewController.swift
//  MemoryGame
//
//  Created by Roque Rueda on 20/02/17.
//  Copyright © 2017 HCL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func startGame(_ sender: UIButton) {
        memoryGame.card = memoryGame.startGame(cardImages: memoryGame.cardImages)
        memoryBoard.reloadData()
    }
    
    @IBOutlet weak var memoryBoard: UICollectionView!
    
    var memoryGame: MemoryGame = MemoryGame();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        memoryGame.card = memoryGame.startGame(cardImages: memoryGame.cardImages)
        memoryGame.animationDelegate = self
        memoryBoard.dataSource = self
        memoryBoard.delegate = self
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
        cell.background.image = UIImage(named: "question_mark")!
        memoryGame.card[indexPath.row].position = indexPath.row
        
        if memoryGame.card[indexPath.row].display {
            cell.image.isHidden = false
            cell.background.isHidden = true
        } else {
            cell.image.backgroundColor = UIColor.gray
            cell.image.isHidden = true
            cell.background.isHidden = false
            
        }
        
        return cell;
        
    }
    
}

extension ViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCellCollectionViewCell
        if cell.isDisplay {
            return
        }
        
        cell.showCard(show: true);
        memoryGame.pickCard(pickedCard: memoryGame.card[indexPath.row])
        
        
    }
    
}

extension ViewController : MemoryAnimationDelegate {
    
    func showCard(card: Card) {
        if let cell = memoryBoard.cellForItem(at: IndexPath(row: card.position, section: 0)) as! CardCellCollectionViewCell? {
            cell.showCard(show: true)
        }
    }
    
    func hideCard(card: Card) {
        if let cell = memoryBoard.cellForItem(at: IndexPath(row: card.position, section: 0)) as! CardCellCollectionViewCell? {
            cell.showCard(show: false)
        }
    }
    
}

