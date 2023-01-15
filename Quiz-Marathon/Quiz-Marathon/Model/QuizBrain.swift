//
//  QuizBrain.swift
//  Quiz-Marathon
//
//  Created by User on 16.01.2023.
//

import UIKit

// MARK: - Actions
extension ViewController {
    
    @objc func trueButtonPressed() {
        let actualAnswer = quiz[questionNumber].answer
        
        if actualAnswer == true {
            trueButton.backgroundColor = .green
            trueButton.tintColor = .black
        } else {
            trueButton.backgroundColor = .red
            trueButton.tintColor = .black
        }
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
    }
    
    @objc func falseButtonPressed() {
        let actualAnswer = quiz[questionNumber].answer
        
        if actualAnswer == false {
            falseButton.backgroundColor = .green
            falseButton.tintColor = .black
        } else {
            falseButton.backgroundColor = .red
            falseButton.tintColor = .black
        }
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
    }
    
    @objc func updateQuestion() {
        trueButton.backgroundColor = .darkGray
        falseButton.backgroundColor = .darkGray
        
        trueButton.tintColor = .white
        falseButton.tintColor = .white
        
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
            questionLabel.text = quiz[questionNumber].text
        } else {
            questionNumber = 0
            questionLabel.text = quiz[questionNumber].text
        }
        
        progressView.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
}
