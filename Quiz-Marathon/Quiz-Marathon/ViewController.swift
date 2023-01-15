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
        questionLabel.text = "Question Text"
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        questionLabel.backgroundColor = .red
        
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
        
        // FalseButton
        falseButton.translatesAutoresizingMaskIntoConstraints = false
        falseButton.tintColor = .white
        falseButton.backgroundColor = .darkGray
        falseButton.setTitle("False", for: [])
        falseButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        falseButton.layer.cornerRadius = 8
    }
    
    func layout() {
        buttonsStackView.addArrangedSubview(trueButton)
        buttonsStackView.addArrangedSubview(falseButton)
        
        view.addSubview(questionLabel)
        view.addSubview(buttonsStackView)
        
        // QuestionLabel
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            questionLabel.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -40),
            questionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: questionLabel.trailingAnchor, multiplier: 4),
        ])
        
        // ButtonsStackView
        NSLayoutConstraint.activate([
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            buttonsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: buttonsStackView.trailingAnchor, multiplier: 4),
        ])
        
        // Buttons
        NSLayoutConstraint.activate([
            trueButton.heightAnchor.constraint(equalToConstant: 50),
            falseButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

