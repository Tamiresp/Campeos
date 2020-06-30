//
//  WorldCupViewController.swift
//  Campeoes
//
//  Created by tamires.p.silva on 17/06/20.
//  Copyright © 2020 tamires. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {
    
    var worldCup: WorldCup!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "World Cup \(worldCup.year)"
        
        ivWinner.image = UIImage(named: worldCup.winner)
        ivVice.image = UIImage(named: worldCup.vice)
        lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
        lbWinner.text = worldCup.winner
        lbVice.text = worldCup.vice
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WorldCupViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let match = worldCup.matches[indexPath.section]
        let game = match.games[indexPath.row]
               
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        cell.prepare(with: game)
               
        return cell
    }
    
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       // obter um nome para secao
       let match = worldCup.matches[section]
       return match.stage
   }
}
