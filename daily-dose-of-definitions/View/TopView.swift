//
//  TopContainerView.swift
//  daily-dose-of-definitions
//
//  Created by Diana Ruiz-Olvera on 10/16/21.
//

import UIKit

class TopView: UIView {
    
    let topBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()

    let randomWordLabel: UILabel = {
        let randomWordLabel = UILabel()
        randomWordLabel.translatesAutoresizingMaskIntoConstraints = false
        randomWordLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        randomWordLabel.textColor = .black
        return randomWordLabel
    }()
    
    let partOfSpeechLabel: UILabel = {
        let partOfSpeech = UILabel()
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.textColor = .black
        partOfSpeech.font = .italicSystemFont(ofSize: 18)
        return partOfSpeech
    }()
    
    let definitionLabel: UILabel = {
        let definitionLabel = UILabel()
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        definitionLabel.textColor = .black
        definitionLabel.sizeToFit()
        definitionLabel.numberOfLines = 3
        return definitionLabel
    }()
    
    let instructionsLabel: UILabel = {
        let instructionsLabel = UILabel()
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        instructionsLabel.textColor = .darkGray
        instructionsLabel.text = "Random Word"
        return instructionsLabel
    }()
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    var fetchWordButton: UIButton = {
        let image = UIImage(named: "refresh_icon") as UIImage?
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(fetchWordButtonPressed), for: .touchUpInside)
        button.setImage(image, for: .normal)
        button.backgroundColor = .systemGray5
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return button
    }()
    
    var buttonAction: (() -> Void)?
    
    init(buttonAction: @escaping () -> Void, frame: CGRect = .zero) {
        self.buttonAction = buttonAction
        super.init(frame: frame)

        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func fetchWordButtonPressed() {
        print("button pressed!")
        buttonAction!()
    }

    private func setUpUI() {
        topBarStackView.addArrangedSubview(randomWordLabel)
        topBarStackView.addArrangedSubview(partOfSpeechLabel)
        addSubview(topBarStackView)
        addSubview(spinner)
        addSubview(definitionLabel)
        addSubview(instructionsLabel)
        addSubview(fetchWordButton)

        NSLayoutConstraint.activate([
            
        topBarStackView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
        topBarStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
        topBarStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130),
        //topBarStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
        partOfSpeechLabel.bottomAnchor.constraint(equalTo: topBarStackView.bottomAnchor, constant: -2),
        
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

        definitionLabel.topAnchor.constraint(equalTo: randomWordLabel.bottomAnchor, constant: 10),
        definitionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
        //definitionLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 150),
        definitionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        
        instructionsLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: -40),
        instructionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
        instructionsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        instructionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
        
        fetchWordButton.topAnchor.constraint(equalTo: topAnchor, constant: 135),
        fetchWordButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 290),
        fetchWordButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 175),
        fetchWordButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 330),

        ])
    }
}
