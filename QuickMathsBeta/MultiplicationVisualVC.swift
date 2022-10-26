//
//  MultiplicationVisualVC.swift
//  QuickMathsBeta
//
//  Created by Vanessa Zambrano on 10/24/22.
//

import UIKit

class MultiplicationVisualVC: UIViewController {
    
    var mainMultiplier = 0.0
    var mainMultiplicand = 0.0
    
    @IBOutlet weak var mainExpression: UILabel!
    @IBOutlet weak var subExp1: UILabel!
    @IBOutlet weak var subExp2: UILabel!
    @IBOutlet weak var subExp3: UILabel!
    @IBOutlet weak var subExp4: UILabel!
    
    @IBOutlet weak var runningSum1Lbl: UILabel!
    @IBOutlet weak var runningSum2Lbl: UILabel!
    @IBOutlet weak var runningSum3Lbl: UILabel!
    @IBOutlet weak var runningSum4Lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0

        mainExpression.text = String(format: "%.0f", mainMultiplier) + " X " + String(format: "%.0f", mainMultiplicand) + ":"
        
        // 2 x 2
        if (mainMultiplier >= 10 && mainMultiplicand >= 10) {
            let subMultiplier = floor(mainMultiplier / 10) * 10
            let subMultiplicand = floor(mainMultiplicand / 10) * 10
            
            let subMultiplierRem = mainMultiplier - subMultiplier
            let subMultiplicandRem = mainMultiplicand - subMultiplicand
            
            subExp1.text = String(format: "%.0f", subMultiplier) + " X " + String(format: "%.0f", subMultiplicand)
            subExp2.text = String(format: "%.0f", subMultiplier) + " X " + String(format: "%.0f", subMultiplicandRem)
            subExp3.text = String(format: "%.0f", subMultiplierRem) + " X " + String(format: "%.0f", subMultiplicand)
            subExp4.text = String(format: "%.0f", subMultiplierRem) + " X " + String(format: "%.0f", subMultiplicandRem)
            
            let runningSum1 = subMultiplier * subMultiplicand
            let runningSum2 = subMultiplier * subMultiplicandRem
            let runningSum3 = subMultiplierRem * subMultiplicand
            let runningSum4 = subMultiplierRem * subMultiplicandRem
            
            runningSum1Lbl.text = String(format: "%.0f", runningSum1)
            runningSum2Lbl.text = String(format: "%.0f", runningSum1) + " + " + String(format: "%.0f", runningSum2) + " = " + String(format: "%.0f", runningSum1 + runningSum2)
            runningSum3Lbl.text = String(format: "%.0f", runningSum1 + runningSum2) + " + " + String(format: "%.0f", runningSum3) + " = " + String(format: "%.0f", runningSum1 + runningSum2 + runningSum3)
            runningSum4Lbl.text = String(format: "%.0f", runningSum1 + runningSum2 + runningSum3) + " + " + String(format: "%.0f", runningSum4) + " = " + String(format: "%.0f", runningSum1 + runningSum2 + runningSum3 + runningSum4)
        }
        // 2 x 1
        else if (mainMultiplier >= 10) {
            let subMultiplier = floor(mainMultiplier / 10) * 10
            let subMultiplierRem = mainMultiplier - subMultiplier
            
            // handle mainMultiplicand directly as it is < 10
            subExp1.text = String(format: "%.0f", subMultiplier) + " X " + String(format: "%.0f", mainMultiplicand)
            subExp2.text = String(format: "%.0f", subMultiplierRem) + " X " + String(format: "%.0f", mainMultiplicand)
            
            let runningSum1 = subMultiplier * mainMultiplicand
            let runningSum2 = subMultiplierRem * mainMultiplicand
            
            runningSum1Lbl.text = String(format: "%.0f", runningSum1)
            runningSum2Lbl.text = String(format: "%.0f", runningSum1) + " + " + String(format: "%.0f", runningSum2) + " = " + String(format: "%.0f", runningSum1 + runningSum2)
        }
        // 1 x 2
        else {
            let subMultiplicand = floor(mainMultiplicand / 10) * 10
            let subMultiplicandRem = mainMultiplicand - subMultiplicand
            
            // handle mainMultiplier directly as it is < 10
            subExp1.text = String(format: "%.0f", mainMultiplier) + " X " + String(format: "%.0f", subMultiplicand)
            subExp2.text = String(format: "%.0f", mainMultiplier) + " X " + String(format: "%.0f", subMultiplicandRem)
            
            let runningSum1 = mainMultiplier * subMultiplicand
            let runningSum2 = mainMultiplier * subMultiplicandRem
            
            runningSum1Lbl.text = String(format: "%.0f", runningSum1)
            runningSum2Lbl.text = String(format: "%.0f", runningSum1) + " + " + String(format: "%.0f", runningSum2) + " = " + String(format: "%.0f", runningSum1 + runningSum2)
        }
    }

}
