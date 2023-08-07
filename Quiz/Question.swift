//
//  Question.swift
//  Quiz
//
//  Created by Saeed Jassim on 27/07/2023.
//

import Foundation

enum OptionChoice {
    case one, two, three, four
}

struct Question {
    
    var questionTitle: String
    
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    
    var correctOption: OptionChoice
    
}
