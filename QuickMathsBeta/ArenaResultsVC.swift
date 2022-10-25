//
//  ArenaResultsVC.swift
//  QuickMathsBeta
//
//  Created by Peter Ryan on 10/24/22.
//

import UIKit

class ArenaResultsVC: UIViewController {
    
    var accuracy:Int?
    var time:String?
    
    @IBOutlet weak var accuracyLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        accuracyLabel.text = "Accuracy: \(accuracy!)%"
        timeLabel.text = "Time: \(time!)s"
        

    }
    



}
