//
//  DefinitionCell.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/11/21.
//

import UIKit

class DefinitionCell: UITableViewCell {

    //MARK: UI Component Declarations
    
    let stack:UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 2
        stack.backgroundColor = .lightGray
        stack.layer.cornerRadius = 20
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    lazy var wordLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17,weight: .semibold)
        label.textAlignment = .left
        label.textColor = .black
       
        return label
    }()
    lazy var definitionLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15,weight:.regular)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()

 override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     
   //  setupUI()
   
 }
    override func layoutSubviews() {
        setupUI()
    }
 required init?(coder: NSCoder) {
     super.init(coder: coder)
     
     setupUI()
 }
    private func setupUI(){
      //  self.contentView.layer.cornerRadius = 20
        self.contentView.backgroundColor = .white
    
        /*
        contentView.addSubview(wordLabel)
        contentView.addSubview(definitionLabel)
         */
        
        NSLayoutConstraint.activate([
            
            wordLabel.heightAnchor.constraint(equalToConstant: 20),
            wordLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            
            definitionLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
         
        self.layoutIfNeeded()
        
        stack.addArrangedSubview(wordLabel)
        stack.addArrangedSubview(definitionLabel)
        contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant:10),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant:-10),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            wordLabel.topAnchor.constraint(equalTo: stack.topAnchor, constant: 10),
            wordLabel.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 10)
            
        ])
        /*
        wordLabel.setContentHuggingPriority(.required, for: .vertical)
        definitionLabel.setContentHuggingPriority(.required, for:.vertical)
        */
    }
 
}
