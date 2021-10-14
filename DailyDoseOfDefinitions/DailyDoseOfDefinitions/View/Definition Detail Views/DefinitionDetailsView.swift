//
//  DefinitionDetailsView.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/7/21.
//

import UIKit

class DefinitionDetailsView: UIView {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var definitionView: WordDetailsView = {
        let wordDetailsView = WordDetailsView()
        wordDetailsView.translatesAutoresizingMaskIntoConstraints = false        
        wordDetailsView.infoTypeLabel.text = "Definition"
        wordDetailsView.descriptionLabel.text = wordDetail.definition
        wordDetailsView.partsOfSpeechLabel.text = wordDetail.partOfSpeech
        wordDetailsView.partsOfSpeechLabel.isHidden = false
        wordDetailsView.backgroundColor = .white
        return wordDetailsView
    }()
    
    let synonymsView: WordDetailsView = {
        let wordDetailsView = WordDetailsView()
        wordDetailsView.translatesAutoresizingMaskIntoConstraints = false
        wordDetailsView.infoTypeLabel.textColor = .white
        wordDetailsView.infoTypeLabel.text = "Synonyms"
        wordDetailsView.descriptionLabel.text = "enjoying or showing or marked by joy or please"
        wordDetailsView.backgroundColor = .lightGray
        return wordDetailsView
    }()
    
    let antonymsView: WordDetailsView = {
        let wordDetailsView = WordDetailsView()
        wordDetailsView.translatesAutoresizingMaskIntoConstraints = false
        wordDetailsView.infoTypeLabel.textColor = .white
        wordDetailsView.infoTypeLabel.text = "Antonyms"
        wordDetailsView.descriptionLabel.text = "enjoying or showing or marked by joy or please"
        wordDetailsView.backgroundColor = .gray
        return wordDetailsView
    }()
    
    let exampleview: WordDetailsView = {
        let wordDetailsView = WordDetailsView()
        wordDetailsView.translatesAutoresizingMaskIntoConstraints = false
        wordDetailsView.infoTypeLabel.textColor = .white
        wordDetailsView.infoTypeLabel.text = "Example Usage"
        wordDetailsView.descriptionLabel.textColor = .lightGray
        wordDetailsView.descriptionLabel.text = "enjoying or showing or marked by joy or please"
        wordDetailsView.backgroundColor = .darkGray
        return wordDetailsView
    }()
    
    let wordDetail: WordDetail
    let selectedWord: String
    
    init(wordDetail: WordDetail, selectedWord: String) {
        self.wordDetail = wordDetail
        self.selectedWord = selectedWord
        
        super.init(frame: .zero)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        
        backgroundColor = .black
                        
        contentStackView.addArrangedSubview(definitionView)
        contentStackView.addArrangedSubview(synonymsView)
        contentStackView.addArrangedSubview(antonymsView)
        contentStackView.addArrangedSubview(exampleview)
        
        let emptyView = UIView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.addArrangedSubview(emptyView)
        
        scrollView.addSubview(contentStackView)
        
        addSubview(scrollView)
                
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}
