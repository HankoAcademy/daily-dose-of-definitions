//
//  RandomWordView.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/6/21.
//

import UIKit

class RandomWordView: UIView {
    
    // MARK: - Class Properties
    
    weak var randomWordGeneratableDelegate: RandomWordGeneratable?
    
    // MARK: - UI Properties
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let partsOfSpeechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    let randomWordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Random Word"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    let refreshButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .gray
        button.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .medium)
        let largeBoldDoc = UIImage(systemName: "arrow.triangle.2.circlepath.circle", withConfiguration: largeConfig)
        button.setImage(largeBoldDoc, for: .normal)

        return button
    }()
    
    // MARK: - Initializers
    
    init(randomWordGeneratableDelegate: RandomWordGeneratable?) {
        super.init(frame: .zero)
        
        self.randomWordGeneratableDelegate = randomWordGeneratableDelegate
        
        layer.cornerRadius = 30
        backgroundColor = .white
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpViews() {
        
        addSubview(titleLabel)
        addSubview(partsOfSpeechLabel)
        addSubview(descriptionLabel)
        addSubview(randomWordLabel)
        addSubview(refreshButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: partsOfSpeechLabel.leadingAnchor, constant: -4),
            
            partsOfSpeechLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),
            partsOfSpeechLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -4),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            randomWordLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            randomWordLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            refreshButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            refreshButton.widthAnchor.constraint(equalTo: refreshButton.heightAnchor)
        ])
    }        
    
    // MARK: - Actions
    
    @objc func refreshButtonPressed() {
        print("Refresh pressed")
        randomWordGeneratableDelegate?.generateRandomWordToDisplay()
    }
}
