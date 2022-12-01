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
    
    @IBOutlet weak var plusSign: UILabel!
    @IBOutlet weak var equalsSign: UILabel!
    @IBOutlet weak var sumEqualsSign: UILabel!
    @IBOutlet weak var timesSign: UILabel!
    
    @IBOutlet weak var mainExpression: UILabel!
    @IBOutlet weak var mainProduct: UILabel!
    
    @IBOutlet weak var currOperand1: UILabel!
    @IBOutlet weak var currOperand2: UILabel!
    @IBOutlet weak var currProduct: UILabel!
    
    @IBOutlet weak var runningSumOperand1: UILabel!
    @IBOutlet weak var runningSumOperand2: UILabel!
    @IBOutlet weak var runningSumProduct: UILabel!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    var mainMultiplier = 0.0
    var mainMultiplicand = 0.0
    
    @IBOutlet weak var frameView: UIView!
   
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        frameView.layer.cornerRadius = 10
        frameView.layer.borderColor = UIColor.black.cgColor
        frameView.layer.borderWidth = 1
        
        mainExpression.alpha = 0
        mainProduct.alpha = 0
        
        plusSign.alpha = 0
        equalsSign.alpha = 0
        sumEqualsSign.alpha = 0
        timesSign.alpha = 0
        
        currOperand1.alpha = 0
        currOperand2.alpha = 0
        currProduct.alpha = 0
        
        runningSumOperand1.alpha = 0
        runningSumOperand2.alpha = 0
        runningSumProduct.alpha = 0
    }
    
    var animationComplete = false
    
    var currSteps:[(Double, Double, Double)] = []
    var runningSumSteps:[(Double, Double, Double)] = []
    
    @IBAction func nextBtnPress(_ sender: Any) {
        // perform input validation -- length of input must be less than 99
        if ((Int(firstNumberField.text!) ?? 100) > 99 || (Int(firstNumberField.text!) ?? 100) > 99) {
            let alert = UIAlertController(title: "Invalid inputs!", message: "Please enter a number in each field that is less than 99.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        // perform input validation -- at least one number must be 2 digits long
        else if ((Int(firstNumberField.text!) ?? 0) + (Int(secondNumberField.text!) ?? 0) <= 18) {
            let alert = UIAlertController(title: "Invalid inputs!", message: "One number must be at least 2 digits long!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        // send / set label values
        else {
            mainMultiplier = Double(firstNumberField.text!)!
            mainMultiplicand = Double(secondNumberField.text!)!
            
            setValues()
        }
    }
    
    func setValues() {
        mainExpression.text = String(format: "%.0f", mainMultiplier) + " X " + String(format: "%.0f", mainMultiplicand) + " = "
        mainProduct.text = "0"
        
        var assignmentComplete: Bool = false
        
        // 2 x 2
        if (mainMultiplier >= 10 && mainMultiplicand >= 10) {
            let subMultiplier = floor(mainMultiplier / 10) * 10
            let subMultiplicand = floor(mainMultiplicand / 10) * 10
            
            let subMultiplierRem = mainMultiplier - subMultiplier
            let subMultiplicandRem = mainMultiplicand - subMultiplicand
            
            let runningSum1 = subMultiplier * subMultiplicand
            let runningSum2 = subMultiplier * subMultiplicandRem
            let runningSum3 = subMultiplierRem * subMultiplicand
            let runningSum4 = subMultiplierRem * subMultiplicandRem
            
            currSteps.append((subMultiplier, subMultiplicand, runningSum1))
            currSteps.append((subMultiplier, subMultiplicandRem, runningSum2))
            currSteps.append((subMultiplierRem, subMultiplicand, runningSum3))
            currSteps.append((subMultiplierRem, subMultiplicandRem, runningSum4))
            
            runningSumSteps.append((0.0, runningSum1, runningSum1))
            runningSumSteps.append((runningSum1, runningSum2, runningSum1 + runningSum2))
            runningSumSteps.append((runningSum1 + runningSum2, runningSum3, runningSum1 + runningSum2 + runningSum3))
            runningSumSteps.append((runningSum1 + runningSum2 + runningSum3, runningSum4, runningSum1 + runningSum2 + runningSum3 + runningSum4))
            
            assignmentComplete = true
        }
        // 2 x 1
        else if (mainMultiplier >= 10) {
            let subMultiplier = floor(mainMultiplier / 10) * 10
            let subMultiplierRem = mainMultiplier - subMultiplier
            
            // handle mainMultiplicand directly as it is < 10
            let runningSum1 = subMultiplier * mainMultiplicand
            let runningSum2 = subMultiplierRem * mainMultiplicand
            
            currSteps.append((subMultiplier, mainMultiplicand, runningSum1))
            currSteps.append((subMultiplierRem, mainMultiplicand, runningSum2))
            
            runningSumSteps.append((0.0, runningSum1, runningSum1))
            runningSumSteps.append((runningSum1, runningSum2, runningSum1 + runningSum2))
            
            assignmentComplete = true
        }
        // 1 x 2
        else {
            let subMultiplicand = floor(mainMultiplicand / 10) * 10
            let subMultiplicandRem = mainMultiplicand - subMultiplicand
            
            // handle mainMultiplier directly as it is < 10
            let runningSum1 = mainMultiplier * subMultiplicand
            let runningSum2 = mainMultiplier * subMultiplicandRem
            
            currSteps.append((mainMultiplier, subMultiplicand, runningSum1))
            currSteps.append((mainMultiplier, subMultiplicandRem, runningSum2))
            
            runningSumSteps.append((0.0, runningSum1, runningSum1))
            runningSumSteps.append((runningSum1, runningSum2, runningSum1 + runningSum2))
            
            assignmentComplete = true
        }
        if (assignmentComplete) { deployAnimation(steps: currSteps, runningSum: runningSumSteps, i: 0) }
    }

    
    func deployAnimation(steps: [(Double, Double, Double)], runningSum: [(Double, Double, Double)], i: Int) {
        if i >= steps.count { return }
        self.nextBtn.isEnabled = false
        self.nextBtn.backgroundColor = UIColor.lightGray
        UIKit.UIView.animateKeyframes(withDuration: 8, delay: 0, animations: {
            // initialize running sum for this step
            UIKit.UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.10, animations: {
                self.mainProduct.text = String(format: "%.0f", runningSum[i].0)
                
                self.mainProduct.alpha = 1.0
                self.mainExpression.alpha = 1.0
            })
            // begin multiplication + relativeStartTime should increase by .25 or so every frame
            UIKit.UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.30, animations: {
                self.currOperand1.text = String(format: "%.0f", steps[i].0)
                self.currOperand2.text = String(format: "%.0f", steps[i].1)
                self.currProduct.text = String(format: "%.0f", steps[i].2)
                
                self.currOperand1.alpha = 1.0
                self.timesSign.alpha = 1.0
                self.currOperand2.alpha = 1.0
                self.sumEqualsSign.alpha = 1.0
                self.currProduct.alpha = 1.0
            })
            // running sum
            UIKit.UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.30, animations: {
                self.runningSumOperand1.text = String(format: "%.0f", runningSum[i].0)
                self.runningSumOperand2.text = String(format: "%.0f", runningSum[i].1)
                self.runningSumProduct.text = String(format: "%.0f", runningSum[i].2)
                
                self.runningSumOperand1.alpha = 1.0
                self.plusSign.alpha = 1.0
                self.runningSumOperand2.alpha = 1.0
                self.equalsSign.alpha = 1.0
                self.runningSumProduct.alpha = 1.0
            })
            // clear fields to be changed
            UIKit.UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.20, animations: {
                self.mainProduct.alpha = 0
                
                self.currOperand1.alpha = 0
                self.timesSign.alpha = 0
                self.currOperand2.alpha = 0
                self.sumEqualsSign.alpha = 0
                self.currProduct.alpha = 0
                
                self.runningSumOperand1.alpha = 0
                self.plusSign.alpha = 0
                self.runningSumOperand2.alpha = 0
                self.equalsSign.alpha = 0
                self.runningSumProduct.alpha = 0
            })
        }, completion: {
            (isFinished) in
            if i + 1 >= steps.count {
                self.mainProduct.text = String(format: "%.0f", runningSum[steps.count - 1].2)
                self.mainProduct.alpha = 1.0
                self.mainProduct.textColor = UIColor.systemBlue
                self.nextBtn.isEnabled = true
                self.nextBtn.backgroundColor = UIColor.systemBlue
                
                self.runningSumSteps.removeAll()
                self.currSteps.removeAll()
                
                return
            }
            self.deployAnimation(steps: steps, runningSum: runningSum, i: i + 1)
        })
    }
}
