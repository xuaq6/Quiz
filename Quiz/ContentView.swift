//
//  ContentView.swift
//  Quiz
//
//  Created by Saeed Jassim on 27/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    let questions = [
    
        //index 0
        Question(questionTitle: "What is this programme called?",
        option1: "Swoft Accelerator",
        option2: "Swift Accelerator",
        option3: "Xcode Accelerator",
        option4: "Python Accelerator",
        correctOption: .two),
        
        //index 1
        Question(questionTitle: "What language are we using?",
        option1: "Xcode",
        option2: "Python",
        option3: "SwiftUI",
        option4: "Swift",
        correctOption: .four)
        
        
        
    ]
    
    @State private var questionNumber: Int = 1
    
    @State private var isAlertPresented: Bool = false
    @State private var isCorrect: Bool = false
    
    @State var numOfCorrectQuestions: Int = 0
    @State var isSheetPresented: Bool = false
    
    func didTapOption(optionNumber: OptionChoice) {
        if optionNumber == questions[questionNumber - 1].correctOption {
            isCorrect = true
            numOfCorrectQuestions += 1
            print("Correct option!")
        } else {
            isCorrect = false
            print("Wrong option!")
        }
        isAlertPresented = true
    }
    
    func optionButton(optionNumber: OptionChoice, iconName:String) -> some View {
        Button {
            didTapOption(optionNumber: optionNumber)
        } label: {
            Image(systemName: iconName)
            switch optionNumber {
            case .one:
                Text(questions[questionNumber - 1].option1)
            case .two:
                Text(questions[questionNumber - 1].option2)
            case .three:
                Text(questions[questionNumber - 1].option3)
            case .four:
                Text(questions[questionNumber - 1].option4)

            }
        }
    }
    
    var body: some View {
        VStack {
            
            ProgressView(value: Double(questionNumber), total: Double(questions.count))
                .padding()
            
            Text(questions[questionNumber - 1].questionTitle)
                .padding()
            VStack {
                
                HStack {
                    Button {
                        didTapOption(optionNumber: .one)
                    } label: {
                        optionButton(optionNumber: .one, iconName: "triangle.fill")
                        
                    }
                    Button {
                        didTapOption(optionNumber: .two)
                    } label: {
                        optionButton(optionNumber: .two, iconName: "circle.fill")
                    }
                }
                .padding()
                HStack {
                    Button {
                        didTapOption(optionNumber: .three)
                    } label: {
                        optionButton(optionNumber: .three, iconName: "square.fill")
                    }
                    Button {
                        didTapOption(optionNumber: .four)
                    } label: {
                        optionButton(optionNumber: .four, iconName: "diamond.fill")
                    }
                }
                .padding()
                
            }
        }
        .alert(isCorrect ? "Correct" : "Wrong", isPresented: $isAlertPresented) {
            Button("Ok") {
                if questionNumber == questions.count {
                    isSheetPresented = true
                    questionNumber = 1
                }
                questionNumber += 1
            }
        } message: {
            Text(isCorrect ? "Congrats! You are quite smart..." : "How can you be getting this wrong?!")
        }
        .sheet(isPresented: $isSheetPresented, onDismiss: {
            numOfCorrectQuestions = 0 }, content: {
                ScoreView(score: numOfCorrectQuestions, totalQuestion: questions.count)
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
