//
//  LeaderboardController.swift
//  QuickMathsBeta
//
//  Created by student on 11/26/22.
//

import UIKit

struct ScoreItem: Codable {
    init() {
        accuracy = 0
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
        
        dummy.accuracy = 80
        dummy.time = "Time"
        dummy.timestamp = "Date"
        
        topScores.append(dummy)
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
        let timeString = cell.viewWithTag(1) as! UILabel
        let date = cell.viewWithTag(2) as! UILabel
   
        timeString.text = topScores[indexPath.row].time
        date.text = topScores[indexPath.row].timestamp
    
     

        return cell
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
