//
//  MyCollectionViewController.swift
//  Campeoes
//
//  Created by tamires.p.silva on 07/07/20.
//  Copyright © 2020 tamires. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController {
    var worldCups: [WorldCup] = []
    var index: Int = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorldCups()

        // Do any additional setup after loading the view.
    }
 func loadWorldCups() {
        let fileURL = Bundle.main.url(forResource: "winners", withExtension: ".json")!
        let jsonData = try! Data(contentsOf: fileURL)
        
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CountryDetailViewController
        let worldCup = worldCups[index]
        vc.worldCup = worldCup
    }
}

extension MyCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return worldCups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let worldCup = worldCups[indexPath.row]
        cell.prepare(with: worldCup)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
            index = indexPath.item
       }
}


