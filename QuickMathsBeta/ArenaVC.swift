//
//  ArenaVC.swift
//  QuickMathsBeta
//
//  Created by Peter Ryan on 10/24/22.
//

import UIKit

class ArenaVC: UIViewController {
    
    var accuracy = 0
    var userTime = 0
    
    //Setup multiplicands
  
    var leftOne: Int = 0
    var rightOne: Int = 0
    var leftTwo: Int = 0
    var rightTwo: Int = 0
    var leftThree: Int = 0
    var rightThree: Int = 0
    var leftFour: Int = 0
    var rightFour: Int = 0
    var leftFive: Int = 0
    var rightFive: Int = 0
    
    var multiplicandArray:[Int] = []
    var labelArray:[UILabel] = []
   
    
    //Connect labels
   
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
  
// Connect text fields
   
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var fifthTextField: UITextField!
    
    var textFieldArray:[UITextField] = []
    
    // Connect timer label and reset and submit buttons
    
    var timer = Timer()
    var count = 0
    var timerCounting = true
    
    @objc func timerCounter() -> Void {
        if timerCounting{
            count = count + 1
            let time = secondsToSecondsMinutes(seconds: count)
            let timeString = makeTimeString(minutes: time.0, seconds: time.1)
            timerLabel.text = timeString
        }
        
    }
    
    func secondsToSecondsMinutes(seconds:Int) -> (Int, Int){
        return (seconds/60,seconds % 60)
        }
    
    func makeTimeString(minutes:Int, seconds:Int)-> String{
        var timeString = ""
        timeString += String(format:"0%2d", minutes)
        timeString += " : "
        timeString += String(format:"%2d", seconds)
        return timeString
    }
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func resetScreen(_ sender: Any) {
        timerCounting = true
        count = -1
        
        for i in textFieldArray.indices {
            textFieldArray[i].text = ""
        }
        
        populateNumbers()
    }
    
    
    @IBAction func submit(_ sender: Any) {
        if timerCounting{
            if verifyInput(){
                checkAnswers()
                self.performSegue(withIdentifier: "arenaToResults", sender: self)
                timerCounting = false
            }
        }
        
    }
    
    func populateNumbers(){
        for i in multiplicandArray.indices {
            multiplicandArray[i] = Int.random(in: 2...99)
        }
        for i in labelArray.indices {
            labelArray[i].text = "\(multiplicandArray[2*i]) X \(multiplicandArray[(2*i)+1])"
        }
        
    }
    
    func verifyInput()-> Bool{
        
        for i in textFieldArray.indices {
            if textFieldArray[i].text == ""{
                return false
            }
        }
        return true
    }
    
    func checkAnswers(){
        var numCorrect = 0.0
        
        for i in textFieldArray.indices {
            if multiplicandArray[2*i] * multiplicandArray[(2*i)+1] == Int(textFieldArray[i].text!) {
                print("Correct")
                numCorrect += 1
            }
            else {
                textFieldArray[i].textColor = UIColor.red
            }
        }
        var rawScore = numCorrect / 5.0
        print(rawScore)
        self.accuracy = Int(rawScore*100)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "arenaToResults"{
            let destVC = segue.destination as! ArenaResultsVC
            destVC.accuracy = self.accuracy
            destVC.time = self.timerLabel.text
        }
    }

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        multiplicandArray = [leftOne, rightOne, leftTwo, rightTwo, leftThree, rightThree, leftFour, rightFour,leftFive, rightFive]
        
        labelArray = [firstLabel, secondLabel, thirdLabel, fourthLabel, fifthLabel]
        
        textFieldArray = [firstTextField, secondTextField, thirdTextField, fourthTextField, fifthTextField]
        
        populateNumbers()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
       
    }
    



}
