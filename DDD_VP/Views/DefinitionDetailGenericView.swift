//
//  DefinitionDetailGenericView.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/21/21.
//

import UIKit

class DefinitionDetailGenericView: UIView {
    var wordInstance:WordInstance
    var type:String
    var wordString:String?
    
   
    //MARK: UIElements
    let stack:UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    lazy var wordLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = wordString
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    lazy var typeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.text = type
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    //MARK: Initializers
    //change to enum later
    init(wordInstance:WordInstance,type:String){
        self.wordInstance = wordInstance
        self.type = type
        if self.type == "Synonyms"{
            wordString = wordInstance.synonyms?[0]
        } else {
            wordString = wordInstance.antonyms?[0]
        }
        super.init(frame:.zero)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI(){
        self.addSubview(stack)
        stack.addArrangedSubview(wordLabel)
        stack.addArrangedSubview(typeLabel)
        NSLayoutConstraint.activate([
         stack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
         stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
         stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
         
     ])
    }
}
