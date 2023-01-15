//
//  ViewController.swift
//  Quiz-Marathon
//
//  Created by User on 15.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let questionLabel = UILabel()
    
    let buttonsStackView = UIStackView()
    let trueButton = UIButton(type: .system)
    let falseButton = UIButton(type: .system)
    
    let progressView = UIProgressView()
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        // QuestionLabel
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        questionLabel.text = quiz[questionNumber].text
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        
        // ButtonsStackView
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 8
        
        // TrueButton
        trueButton.translatesAutoresizingMaskIntoConstraints = false
        trueButton.tintColor = .white
        trueButton.backgroundColor = .darkGray
        trueButton.setTitle("True", for: [])
        trueButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        trueButton.layer.cornerRadius = 8
        trueButton.addTarget(self, action: #selector(trueButtonPressed), for: .primaryActionTriggered)
        
        // FalseButton
        falseButton.translatesAutoresizingMaskIntoConstraints = false
        falseButton.tintColor = .white
        falseButton.backgroundColor = .darkGray
        falseButton.setTitle("False", for: [])
        falseButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        falseButton.layer.cornerRadius = 8
        falseButton.addTarget(self, action: #selector(falseButtonPressed), for: .primaryActionTriggered)
        
        // ProgressView
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .bar
        progressView.tintColor = .darkGray
        progressView.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func layout() {
        buttonsStackView.addArrangedSubview(trueButton)
        buttonsStackView.addArrangedSubview(falseButton)
        
        view.addSubview(questionLabel)
        view.addSubview(buttonsStackView)
        view.addSubview(progressView)
        
        // QuestionLabel
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            questionLabel.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -40),
            questionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: questionLabel.trailingAnchor, multiplier: 4),
        ])
        
        // ButtonsStackView
        NSLayoutConstraint.activate([
            buttonsStackView.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -20),
            buttonsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: buttonsStackView.trailingAnchor, multiplier: 4),
        ])
        
        // Buttons
        NSLayoutConstraint.activate([
            trueButton.heightAnchor.constraint(equalToConstant: 55),
            falseButton.heightAnchor.constraint(equalToConstant: 55),
        ])
        
        // ProgressView
        NSLayoutConstraint.activate([
            progressView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            progressView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: progressView.trailingAnchor, multiplier: 4),
            progressView.heightAnchor.constraint(equalToConstant: 6),
        ])
    }
}

