//
//  MultiplicationInputVC.swift
//  QuickMathsBeta
//
//  Created by Peter Ryan on 10/24/22.
//

import UIKit

class MultiplicationInputVC: UIViewController {

    @IBOutlet weak var firstNumber: UITextField!
    
    @IBOutlet weak var secondNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showBtn(_ sender: Any) {
        // perform input validation -- length of input must be less than 99
        if (Int(firstNumber.text!)! > 99 || Int(firstNumber.text!)! > 99) {
            // make error pop up asking user to enter two 2-digit numbers
        }
        // else allow segue
        // transfer number data to the other screen -- probably using prepare?
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
