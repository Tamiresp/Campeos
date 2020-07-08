//
//  CountryDetailViewController.swift
//  Campeoes
//
//  Created by tamires.p.silva on 07/07/20.
//  Copyright © 2020 tamires. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    //@IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var ivFlag: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbQuantity: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    
    var worldCup: WorldCup!
    var worldCups: [WorldCup] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorldCups()
            // Do any additional setup after loading the view.
        ivFlag.image = UIImage(named: worldCup.winner)
        lbName.text = worldCup.winner
        lbQuantity.text = String(quantity(country: worldCup.winner))
        lbYear.text = String(worldCup.year)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func quantity(country: String) -> Int {
        var i: Int = 0
        
        for item in worldCups {
            if (item.winner == country){
                i += 1
            }
        }
        return i
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
}

//extension CountryDetailViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return worldCups.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryDetailTableViewCell
//        let worldCup = worldCups[indexPath.row]
//        cell.prepare(with: worldCup)
//
//        return cell
//    }
//}
