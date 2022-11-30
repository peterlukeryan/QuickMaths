//
//  DemoScreenIntro.swift
//  QuickMathsBeta
//
//  Created by Peter Ryan on 11/29/22.
//

import UIKit

class DemoScreenIntro: UIViewController {

    
    @IBAction func goToMain(_ sender: Any) {
        self.performSegue(withIdentifier: "demoIntroToMain", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
