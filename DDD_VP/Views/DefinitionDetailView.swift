//
//  WordDetailView.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/21/21.
//

import UIKit

class DefinitionDetailView: UIView {
    var wordInstance:WordInstance
    
    //MARK: UI Elements
    let definitionStack:UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    lazy var posLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        
        label.text = wordInstance.partOfSpeech
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    lazy var definitionLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = wordInstance.definition
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    let definitionTypeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.text = "Definition"
        return label
    }()
    
    //MARK: Initializers
    
    init(wordInstance:WordInstance){
        self.wordInstance = wordInstance
        super.init(frame:.zero)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI(){
        self.addSubview(definitionStack)
        definitionStack.addArrangedSubview(posLabel)
        definitionStack.addArrangedSubview(definitionLabel)
        definitionStack.addArrangedSubview(definitionTypeLabel)
        NSLayoutConstraint.activate([
            definitionStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            definitionStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            definitionStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            definitionStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            definitionStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
            
        ])
    }
}
