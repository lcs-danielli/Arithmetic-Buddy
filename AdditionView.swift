//
//  AdditionView.swift
//  Arithmetic Buddy
//
//  Created by 李泽宇 on 2025-01-18.

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    
    // The two numbers the user must add
    @State var firstNumber = Int.random(in: 1...25)
    @State var secondNumber = Int.random(in: 1...25)
    @State var givenInput = ""

    // Feedback to the user
    @State var feedback = ""
    
    // MARK: Computed properties
    
    // The correct sum of the randomly generated numbers
    var correctSum: Int {
        return firstNumber + secondNumber
    }
    
    // The user interface
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            HStack {
                Spacer()
                Text("\(firstNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
            
            HStack {
                Text("+")
                    .font(Font.system(size: 50))
                Spacer()
                Text("\(secondNumber)")
                    .font(Font.system(size: 50))
                    .padding(.trailing)
            }
                        
            Divider()
            
            HStack {
                Spacer()
                TextField("Make a guess", text: $givenInput)
                    .font(Font.system(size: 50))
            }
            
            Spacer()
            
            Button {
                checkAnswer()
            } label: {
                Text("Check Answer")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Text(feedback)
                .font(
                    .custom(
                        "BradleyHandITCTT-Bold",
                        size: 24.0,
                        relativeTo: .title3
                    )
                )
            
            Spacer()
            
            Button {
                reset()
            } label: {
                Text("Reset")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    }
    
    // MARK: Functions
    
    // Check whether the user's answer was correct
    // Provide appropriate feedback
    func checkAnswer() {
        guard let selectedNumber = Int(givenInput) else {
            feedback = "Please provide an integer."
            return
        }
        if selectedNumber > firstNumber + secondNumber {
            feedback = "Try again :)"
        } else if selectedNumber < firstNumber + secondNumber {
            feedback = "Try again :("
        } else {
            feedback = "You get it!"
        }
    }
    
    // Reset for a new question
    func reset() {
        
        firstNumber = Int.random(in: 1...25)
        secondNumber = Int.random(in: 1...25)
        feedback = ""
        
    }
}

#Preview {
    AdditionView()
}
