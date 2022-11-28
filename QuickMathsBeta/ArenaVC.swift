//
//  ArenaVC.swift
//  QuickMathsBeta
//
//  Created by Peter Ryan on 10/24/22.
//

import UIKit

class ArenaVC: UIViewController {
    
    //Setup  accuracy and time state variables for use in results VC

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
    
    //Create an array of all multiplicands, labels--to simplify below logic
  
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
    
    // Connect thumbs up images
    
    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    
    @IBOutlet weak var fifthImage: UIImageView!
    
    var imageArray:[UIImageView] = []
    // Connect timer label and reset and submit buttons
    
    var timer = Timer()
    var count = 0
    var timerCounting = true
    
    @IBOutlet weak var frameView: UIView!
    
    
    //Objc function to increment counter and format timer label
    @objc func timerCounter() -> Void {
        if timerCounting{
            count = count + 1
            let time = secondsToSecondsMinutes(seconds: count)
            let timeString = makeTimeString(minutes: time.0, seconds: time.1)
            timerLabel.text = timeString
        }
        
    }
    
    //Basic converter of raw seconds data to seconds/minutes
  
    func secondsToSecondsMinutes(seconds:Int) -> (Int, Int){
        return (seconds/60,seconds % 60)
        }
    
    // Helper function to turn seconds/minutes into a string
    
    func makeTimeString(minutes:Int, seconds:Int)-> String{
        var timeString = ""
        timeString += String(format:"0%1d", minutes)
        timeString += " : "
        timeString += String(format:"%2d", seconds)
        return timeString
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    
    //Functions to handle submit button validity
    
    @IBOutlet weak var subButton: UIButton!
    
    var allInputsEntered = false
    
    @IBAction func FirstInputEntered(_ sender: Any) {
        for i in 0..<textFieldArray.count {
            if textFieldArray[i].text == "" {
                allInputsEntered = false
                break
            }
            if i == textFieldArray.count-1 {
                allInputsEntered = true
            }
        }
        if allInputsEntered {
            subButton.isEnabled = true
            subButton.backgroundColor = UIColor.systemBlue
        }
        else {
            subButton.backgroundColor = UIColor.lightGray
            subButton.isEnabled = false
        }
    }
    
    @IBAction func secondInputEntered(_ sender: Any) {
        for i in 0..<textFieldArray.count {
            if textFieldArray[i].text == "" {
                allInputsEntered = false
                break
            }
            if i == textFieldArray.count-1 {
                allInputsEntered = true
            }
        }
        if allInputsEntered {
            subButton.isEnabled = true
            subButton.backgroundColor = UIColor.systemBlue
        }
        else {
            subButton.backgroundColor = UIColor.lightGray
            subButton.isEnabled = false
        }
    }
    @IBAction func thirdInputEntered(_ sender: Any) {
        for i in 0..<textFieldArray.count {
            if textFieldArray[i].text == "" {
                allInputsEntered = false
                break
            }
            if i == textFieldArray.count-1 {
                allInputsEntered = true
            }
        }
        if allInputsEntered {
            subButton.isEnabled = true
            subButton.backgroundColor = UIColor.systemBlue
        }
        else {
            subButton.backgroundColor = UIColor.lightGray
            subButton.isEnabled = false
        }
    }
    
    @IBAction func fourthInputEntered(_ sender: Any) {
        for i in 0..<textFieldArray.count {
            if textFieldArray[i].text == "" {
                allInputsEntered = false
                break
            }
            if i == textFieldArray.count-1 {
                allInputsEntered = true
            }
        }
        if allInputsEntered {
            subButton.isEnabled = true
            subButton.backgroundColor = UIColor.systemBlue
        }
        else {
            subButton.backgroundColor = UIColor.lightGray
            subButton.isEnabled = false
        }
    }
    
    @IBAction func fifthInputEntered(_ sender: Any) {
        for i in 0..<textFieldArray.count {
            if textFieldArray[i].text == "" {
                allInputsEntered = false
                break
            }
            if i == textFieldArray.count-1 {
                allInputsEntered = true
            }
        }
        if allInputsEntered {
            subButton.isEnabled = true
            subButton.backgroundColor = UIColor.systemBlue
        }
        else {
            subButton.backgroundColor = UIColor.lightGray
            subButton.isEnabled = false
        }
    }
    
    
    
    //Function to clear out screen, stop timer, clear text fields, and repopulate numbers
    
    @IBAction func resetScreen(_ sender: Any) {
        timerCounting = true
        count = -1
        
        for i in textFieldArray.indices {
            textFieldArray[i].text = ""
            imageArray[i].isHidden = true
        }
        subButton.isEnabled = false
        subButton.backgroundColor = UIColor.lightGray
        populateNumbers()
    }
    
    // Function to submit all input, do not allow if missing inputs
    
    @IBAction func submit(_ sender: Any) {
        
        if timerCounting{
            if verifyInput(){
                
                checkAnswers()
                
                var currentScore = ScoreItem()
                currentScore.accuracy = self.accuracy
                currentScore.time = self.timerLabel.text!
                
                //create date for leaderboard
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                currentScore.timestamp = dateFormatter.string(from: date)
                print(currentScore.timestamp)
                // append current score to Leaderboard's array
                let destVC = self.tabBarController?.viewControllers?[2] as! LeaderboardController
                destVC.topScores.append(currentScore)
                destVC.tableView.reloadData()
                
                self.performSegue(withIdentifier: "arenaToResults", sender: self)
                timerCounting = false
                subButton.isEnabled = false
                subButton.backgroundColor = UIColor.lightGray
            }
        }
       
    }
    
    //Setup random numbers, populate labels
  
    func populateNumbers(){
        for i in multiplicandArray.indices {
            if i > 0 && multiplicandArray[i-1] < 10 {
                multiplicandArray[i] = Int.random(in: 10...99)
            }
            else {
                multiplicandArray[i] = Int.random(in: 2...99)
            }
           
        }
        for i in labelArray.indices {
            if multiplicandArray[2*i] < 10 || multiplicandArray[(2*i)+1] < 10 {
                labelArray[i].text = "\(multiplicandArray[2*i]) X \(multiplicandArray[(2*i)+1])    = "
            }
            else {
                labelArray[i].text = "\(multiplicandArray[2*i]) X \(multiplicandArray[(2*i)+1])  = "
            }
        }
        
    }
    
    //Make sure every text field is non-empty
    
    func verifyInput()-> Bool{
        
        for i in textFieldArray.indices {
            if textFieldArray[i].text == ""{
                return false
            }
        }
        return true
    }
    
    //Logic to test if user input is equal to actual product
    
    func checkAnswers(){
        var numCorrect = 0.0
        
        //Loop through, check inputs versus correct, adjust text color to green when correct, red when wrong
       
        for i in textFieldArray.indices {
            if multiplicandArray[2*i] * multiplicandArray[(2*i)+1] == Int(textFieldArray[i].text!) {
                numCorrect += 1
                imageArray[i].image = UIImage(named: "thumbsUp")!
                imageArray[i].isHidden = false
            }
            else {
                imageArray[i].image = UIImage(named: "thumbsDown2")!
                imageArray[i].isHidden = false
            }
        }
      
        //Convert ratio of correct answers to accuracy
      
        var rawScore = numCorrect / 5.0
        print(rawScore)
        self.accuracy = Int(rawScore*100)
        
    }
    
    //Send state information to ResultsVC
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "arenaToResults"{
            let destVC = segue.destination as! ArenaResultsVC
            destVC.accuracy = self.accuracy
            destVC.time = self.timerLabel.text
        }
    }

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        subButton.setTitleColor(UIColor.gray, for: .disabled)
        
        subButton.isEnabled = false
        subButton.backgroundColor = UIColor.lightGray
        
        frameView.layer.cornerRadius = 10
        frameView.layer.borderColor = UIColor.black.cgColor
        frameView.layer.borderWidth = 1
        //Populate all arrays, setup initial randomization, timer
        
        multiplicandArray = [leftOne, rightOne, leftTwo, rightTwo, leftThree, rightThree, leftFour, rightFour,leftFive, rightFive]
        
        labelArray = [firstLabel, secondLabel, thirdLabel, fourthLabel, fifthLabel]
        
        textFieldArray = [firstTextField, secondTextField, thirdTextField, fourthTextField, fifthTextField]
        
        imageArray = [firstImage, secondImage, thirdImage, fourthImage, fifthImage]
        
        populateNumbers()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        subButton.isEnabled = false
        subButton.backgroundColor = UIColor.lightGray
    }
    
}
