//
//  MultiplicationInputVC.swift
//  QuickMathsBeta
//
//  Created by Vanessa Zambrano on 10/24/22.
//

import UIKit

class MultiplicationInputVC: UIViewController {

    @IBOutlet weak var firstNumberField: UITextField!
    
    @IBOutlet weak var secondNumberField: UITextField!
    
    var firstNumber = 0.0
    var secondNumber = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showBtn(_ sender: Any) {
        // perform input validation -- length of input must be less than 99
        if ((Int(firstNumberField.text!) ?? 100) > 99 || (Int(firstNumberField.text!) ?? 100) > 99) {
            let alert = UIAlertController(title: "Invalid inputs!", message: "Please enter a number in each field that is less than 99.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        // perform input validation -- at least one number must be 2 digits long
        else if ((Int(firstNumberField.text!) ?? 0) + (Int(firstNumberField.text!) ?? 0) <= 18) {
            let alert = UIAlertController(title: "Invalid inputs!", message: "One number must be at least 2 digits long!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            firstNumber = Double(firstNumberField.text!)!
            secondNumber = Double(secondNumberField.text!)!
            
            performSegue(withIdentifier: "multi_seg", sender: self)
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "multi_seg" {
            let multiDemo = segue.destination as! MultiplicationVisualVC
            // Pass the selected object to the new view controller.
            multiDemo.mainMultiplier = firstNumber
            multiDemo.mainMultiplicand = secondNumber
        }
    }

}
