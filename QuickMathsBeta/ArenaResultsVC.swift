//
//  ArenaResultsVC.swift
//  QuickMathsBeta
//
//  Created by Peter Ryan on 10/24/22.
//

import UIKit

class ArenaResultsVC: UIViewController {
    
    //Setup state information, passed from ArenaVC
    
    var accuracy:Int?
    var time:String?
    
    //Setup labels
    
    @IBOutlet weak var accuracyLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Unwrap data, as it is implied that values are non-nil, as segue passed data validation
        
        accuracyLabel.text = "Accuracy: \(accuracy!)%"
        timeLabel.text = "Time: \(time!)s"
        

    }
    



}
