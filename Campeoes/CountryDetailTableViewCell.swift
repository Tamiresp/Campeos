//
//  CountryDetailTableViewCell.swift
//  Campeoes
//
//  Created by tamires.p.silva on 07/07/20.
//  Copyright © 2020 tamires. All rights reserved.
//

import UIKit

class CountryDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lbYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func prepare(with worldCup: WorldCup) {
        lbYear.text = String(worldCup.year)
    }
}
