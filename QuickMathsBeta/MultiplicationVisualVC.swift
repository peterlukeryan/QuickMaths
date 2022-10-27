//
//  MultiplicationVisualVC.swift
//  QuickMathsBeta
//
//  Created by Vanessa Zambrano on 10/24/22.
//

import UIKit

// may be re-added upon later evaluation

//extension UILabel {
//    func halfTextColorChange (fullText : String , changeText : String ) {
//        let strNumber: NSString = fullText as NSString
//        let range = (strNumber).range(of: changeText)
//        let attribute = NSMutableAttributedString.init(string: fullText)
//        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green , range: range)
//        self.attributedText = attribute
//    }
//}

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

        mainExpression.text = String(format: "%.0f", mainMultiplier) + " X " + String(format: "%.0f", mainMultiplicand) + ":"
        
        runningSum1Lbl.alpha = 0
        runningSum2Lbl.alpha = 0
        runningSum3Lbl.alpha = 0
        runningSum4Lbl.alpha = 0
        subExp1.alpha = 0
        subExp2.alpha = 0
        subExp3.alpha = 0
        subExp4.alpha = 0
        
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
        
        deployAnimation()
    }

    func deployAnimation() {
        // this can be re-added upon further evaluation -- skeleton color code
        
//        var toBeColored1 = ""
//        var toBeColored2 = ""
//        var toBeColored3 = ""
//        var toBeColored4 = ""
//
//        // 2 x 2
//        if (mainMultiplier >= 10 && mainMultiplicand >= 10) {
//            toBeColored1 = String(format: "%.0f", floor(mainMultiplier / 10))
//            toBeColored2 = String(format: "%.0f", mainMultiplier.truncatingRemainder(dividingBy: 10.0))
//            toBeColored3 = String(format: "%.0f", floor(mainMultiplicand / 10))
//            toBeColored4 = String(format: "%.0f", mainMultiplicand.truncatingRemainder(dividingBy: 10.0))
//        }
//        // 2 x 1
//        else if (mainMultiplier >= 10) {
//            toBeColored1 = String(format: "%.0f", floor(mainMultiplier / 10))
//            toBeColored2 = String(format: "%.0f", mainMultiplier.truncatingRemainder(dividingBy: 10.0))
//            toBeColored3 = String(format: "%.0f", mainMultiplicand)
//        }
//        // 1 x 2
//        else {
//            toBeColored1 = String(format: "%.0f", mainMultiplier)
//            toBeColored3 = String(format: "%.0f", floor(mainMultiplicand / 10))
//            toBeColored2 = String(format: "%.0f", mainMultiplicand.truncatingRemainder(dividingBy: 10.0))
//        }
        
        UIView.animateKeyframes(withDuration: 8, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.10, animations: {
//                self.mainExpression.halfTextColorChange(fullText: (self.mainExpression.text)!, changeText: toBeColored1)
//                self.mainExpression.halfTextColorChange(fullText: (self.mainExpression.text)!, changeText: toBeColored3)
                self.runningSum1Lbl.alpha = 1.0
                self.subExp1.alpha = 1.0
            })
            
            //self.mainExpression.textColor = #colorLiteral(red: 1, green: 0.5764705882, blue: 0, alpha: 1)
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.30, animations: {
//                self.mainExpression.halfTextColorChange(fullText: (self.mainExpression.text)!, changeText: toBeColored1)
//                self.mainExpression.halfTextColorChange(fullText: (self.mainExpression.text)!, changeText: toBeColored4)
                self.runningSum2Lbl.alpha = 1.0
                self.subExp2.alpha = 1.0
            })
            
            //self.mainExpression.textColor = #colorLiteral(red: 1, green: 0.5764705882, blue: 0, alpha: 1)
            
            if (self.runningSum3Lbl.text != " ") {
                UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.30, animations: {
//                    self.mainExpression.halfTextColorChange(fullText: (self.mainExpression.text)!, changeText: toBeColored2)
//                    self.mainExpression.halfTextColorChange(fullText: (self.mainExpression.text)!, changeText: toBeColored3)
                    self.runningSum3Lbl.alpha = 1.0
                    self.subExp3.alpha = 1.0
                })
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.30, animations: {
//                    self.mainExpression.halfTextColorChange(fullText: (self.mainExpression.text)!, changeText: toBeColored2)
//                    self.mainExpression.halfTextColorChange(fullText: (self.mainExpression.text)!, changeText: toBeColored4)
                    self.runningSum4Lbl.alpha = 1.0
                    self.subExp4.alpha = 1.0
                })
            }
            
            //self.mainExpression.textColor = #colorLiteral(red: 1, green: 0.5764705882, blue: 0, alpha: 1)
        })

    }
}
