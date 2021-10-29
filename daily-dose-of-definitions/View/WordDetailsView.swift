//
//  WordDetailsView.swift
//  daily-dose-of-definitions
//
//  Created by Diana Ruiz-Olvera on 10/27/21.
//

import UIKit

class WordDetailsView: UIView {
    
//    let scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        return scrollView
//    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var definitionView: WordDetailsClassView = {
        let wordDetailsClassView = WordDetailsClassView()
        wordDetailsClassView.translatesAutoresizingMaskIntoConstraints = false
        wordDetailsClassView.infoTypeLabel.text = "Definition"
        wordDetailsClassView.partsOfSpeechLabel.text = wordDetails?.partOfSpeech
        wordDetailsClassView.descriptionLabel.text = wordDetails?.definition
        wordDetailsClassView.partsOfSpeechLabel.isHidden = false
        wordDetailsClassView.backgroundColor = .white
        wordDetailsClassView.backgroundColor = .systemGray5
        wordDetailsClassView.layer.cornerRadius = 20
        wordDetailsClassView.sizeToFit()
        return wordDetailsClassView
    }()
    
    lazy var synonymsView: WordDetailsClassView = {
        let wordDetailsClassView = WordDetailsClassView()
        wordDetailsClassView.translatesAutoresizingMaskIntoConstraints = false
        wordDetailsClassView.infoTypeLabel.text = "Synonyms"
        wordDetailsClassView.descriptionLabel.text = wordDetails?.synonyms?.joined(separator: ", ")
        wordDetailsClassView.sizeToFit()
        return wordDetailsClassView
    }()
    
    lazy var antonymsView: WordDetailsClassView = {
        let wordDetailsClassView = WordDetailsClassView()
        wordDetailsClassView.translatesAutoresizingMaskIntoConstraints = false
        wordDetailsClassView.infoTypeLabel.text = "Antonyms"
        wordDetailsClassView.descriptionLabel.text = wordDetails?.antonyms?.joined(separator: ", ")
        wordDetailsClassView.sizeToFit()
        return wordDetailsClassView
    }()
    
    lazy var exampleView: WordDetailsClassView = {
        let wordDetailsClassView = WordDetailsClassView()
        wordDetailsClassView.translatesAutoresizingMaskIntoConstraints = false
        wordDetailsClassView.infoTypeLabel.text = "Example Usage"
        wordDetailsClassView.descriptionLabel.text = wordDetails?.examples?.joined(separator: "\n\n")
        wordDetailsClassView.sizeToFit()
        return wordDetailsClassView
    }()
    
    let selectedWord: String
    let wordDetails: WordDetails?

    init(selectedWord: String, wordDetails: WordDetails) {
        self.selectedWord = selectedWord
        self.wordDetails = wordDetails
        super.init(frame: .zero)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        
        backgroundColor = .darkGray
        contentStackView.addArrangedSubview(definitionView)
        contentStackView.addArrangedSubview(synonymsView)
        contentStackView.addArrangedSubview(antonymsView)
        contentStackView.addArrangedSubview(exampleView)
        
        let emptyView = UIView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.addArrangedSubview(emptyView)
        
        addSubview(contentStackView)
                
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            contentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            contentStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            contentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            definitionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            synonymsView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            antonymsView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            exampleView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            
        ])
    }



}
