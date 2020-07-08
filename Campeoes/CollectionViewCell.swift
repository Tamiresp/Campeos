//
//  CollectionViewCell.swift
//  Campeoes
//
//  Created by tamires.p.silva on 07/07/20.
//  Copyright © 2020 tamires. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var worldCup: WorldCup!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var ivcountry: UIImageView!
    
    func prepare(with worldCup: WorldCup) {
        country.text = worldCup.winner
        ivcountry.image = UIImage(named: worldCup.winner)
    }
}
