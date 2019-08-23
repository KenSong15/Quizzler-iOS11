//
//  Question.swift
//  Quizzler
//
//  Created by Zhen Song on 2019-08-23.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

//this is the data model on this app
class Question{
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer : Bool){
        questionText = text
        answer = correctAnswer
    }
}
