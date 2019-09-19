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
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    //this method will fire when the storyboard load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
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
        questionLabel.text = allQuestions.list[questionNum].questionText
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNum].answer
        
        if correctAnswer == pickedAnswer {
            print("you got it.")
        } else {
            print("wrong...")
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
