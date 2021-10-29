//
//  SearchResultsTableViewCell.swift
//  daily-dose-of-definitions
//
//  Created by Diana Ruiz-Olvera on 10/26/21.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {
    
    // MARK: - Class Properties
    
    static let identifier = "SearchResultsTableViewCell"

    //MARK: - UI Component Declarations
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    let searchWordLabel: UILabel = {
        let randomWordLabel = UILabel()
        randomWordLabel.translatesAutoresizingMaskIntoConstraints = false
        randomWordLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        randomWordLabel.textColor = .systemTeal
        randomWordLabel.text = "happy"
        return randomWordLabel
    }()
    
    let partOfSpeechLabel: UILabel = {
        let partOfSpeech = UILabel()
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.textColor = .white
        partOfSpeech.font = .italicSystemFont(ofSize: 11)
        partOfSpeech.text = "adjective"
        return partOfSpeech
    }()
    
    let definitionLabel: UILabel = {
        let definitionLabel = UILabel()
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        definitionLabel.textColor = .white
        definitionLabel.sizeToFit()
        definitionLabel.numberOfLines = 1
        definitionLabel.text = "elated"
        return definitionLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setUpUI() {
        
        contentView.backgroundColor = .systemTeal
        
        horizontalStackView.addArrangedSubview(searchWordLabel)
        horizontalStackView.addArrangedSubview(partOfSpeechLabel)
        containerView.addSubview(horizontalStackView)
        containerView.addSubview(definitionLabel)
                
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            partOfSpeechLabel.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 1),
            
            definitionLabel.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 2),
            definitionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            definitionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            definitionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            ])
          }
    
    func update(newWord: String , results: WordDetails) {
        searchWordLabel.text = newWord
        partOfSpeechLabel.text = results.partOfSpeech
        definitionLabel.text = results.definition
    }

}
