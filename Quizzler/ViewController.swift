//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    
    //record the state of the app,what question are we in
    var questionNum : Int = 0
    var score:Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    //this method will fire when the storyboard load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }

    //this method will called when the answer been clicked
    @IBAction func answerPressed(_ sender: AnyObject) {
        if(sender.tag == 1){
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        
        //check the answer is correct
        checkAnswer()
        questionNum += 1
        nextQuestion()
    }
    
    
    func updateUI() {
        //need to update score text, progress bar, question number
        scoreLabel.text = "Score: " + String(score)
        progressLabel.text = String(questionNum+1) + "/13"
        progressBar.frame.size.width = (view.frame.size.width) / 13 * CGFloat(questionNum + 1)
    }
    

    func nextQuestion() {
        
        if(questionNum < allQuestions.list.count){
            questionLabel.text = allQuestions.list[questionNum].questionText
            updateUI()
        } else {
            
            //alert goes here
                //initiate the alert box
            let alert = UIAlertController(title: "Awesome",
                                          message: "You have finish all the quiz, do you want to start over?",
                                          preferredStyle: .alert)
            
                //make an action
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in
                self.startOver()
            })
            
            //add the action to the alert
            alert.addAction(restartAction)
            present(alert,animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNum].answer
        
        if correctAnswer == pickedAnswer {
            print("you got it.")
            score += 1
        } else {
            print("wrong...")
        }
    }
    
    //this fucntion will start over the quiz
    func startOver() {
        questionNum = 0
        score = 0
        nextQuestion()
        
    }
    

    
}
