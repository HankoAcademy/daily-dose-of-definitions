//
//  DefinitionExamplesView.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/21/21.
//

import UIKit

class DefinitionExamplesView: UIView {
    var wordInstance:WordInstance
    
    //MARK: Initializers
    let stack:UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    lazy var examplesLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    let typeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.text = "Example Usage"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    init(wordInstance:WordInstance){
        self.wordInstance = wordInstance
        super.init(frame:.zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupExamplesText(){
        var text = ""
        if let examples = wordInstance.examples{
            for anExample in examples{
                if !anExample.trimmingCharacters(in:.whitespaces).isEmpty{
                    text.append("\(anExample)\n\n")
                }
            } // for anExample
            examplesLabel.text = text
        } //if let examples
    }
    private func setupUI(){
        self.addSubview(stack)
        stack.addArrangedSubview(examplesLabel)
        stack.addArrangedSubview(typeLabel)
        setupExamplesText()
        NSLayoutConstraint.activate([
         stack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
         stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
         stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
         
     ])
    }
}
