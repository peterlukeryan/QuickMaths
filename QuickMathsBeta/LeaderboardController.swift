//
//  LeaderboardController.swift
//  QuickMathsBeta
//
//  Created by student on 11/26/22.
//

import UIKit

struct ScoreItem: Codable {
    init() {
        accuracy = 00
        time = "00:00"
        timestamp = "MM/DD/YYYY"
    }
    var accuracy: Int
    var time: String
    var timestamp: String
}

// How can we append data to this from another VC?
// How do we keep the array populated after user navigates off this VC?


class LeaderboardController: UITableViewController {
    
    
    
    var topScores: Array<ScoreItem> = []
    var dummy = ScoreItem()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dummy.accuracy = 1000
        dummy.time = "Time"
        dummy.timestamp = "Date"
        
        if topScores.count == 0 {
            topScores.append(dummy)
        }
        else {
            var temp = topScores.first
            topScores[0] = dummy
            topScores.append(temp!)
        }
        
       
        
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return topScores.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        // Configure the cell...
        let accuracy = cell.viewWithTag(3) as! UILabel
        let timeString = cell.viewWithTag(1) as! UILabel
        let date = cell.viewWithTag(2) as! UILabel
        
        if indexPath.row == 0 {
            accuracy.text = "Accuracy"
            timeString.text = topScores[indexPath.row].time
            date.text = topScores[indexPath.row].timestamp
        }
        else {
            accuracy.text = String(topScores[indexPath.row].accuracy) + "%"
            timeString.text = topScores[indexPath.row].time + "s"
            date.text = topScores[indexPath.row].timestamp
        }
   

        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        topScores.sort(by: {$0.accuracy > $1.accuracy})
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
