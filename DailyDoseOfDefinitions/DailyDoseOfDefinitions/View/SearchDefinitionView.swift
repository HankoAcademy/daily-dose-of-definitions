//
//  SearchDefinitionView.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/6/21.
//

import Foundation
import UIKit

class SearchDefinitionView: UIView {
    
    // MARK: - Class Properties
    
    weak var searchDefinitionsDelegate: SearchDefinitionsDelegate?
    
    // MARK: - UI Properties
    
    // https://medium.com/nyc-design/swift-4-add-icon-to-uitextfield-48f5ebf60aa1
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Find a word..."
        textField.backgroundColor = .white
        
        let iconView = UIImageView(frame:
                          CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = UIImage(systemName: "magnifyingglass")
        
        let iconContainerView: UIView = UIView(frame:
                           CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        
        textField.leftView = iconContainerView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.register(DefinitionTableViewCell.self, forCellReuseIdentifier: DefinitionTableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Initializers
    
    init(searchDefinitionsDelegate: SearchDefinitionsDelegate?) {
        super.init(frame: .zero)
        
        self.searchDefinitionsDelegate = searchDefinitionsDelegate
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setUpViews() {
        
        addSubview(textField)
        addSubview(searchButton)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            searchButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 5),
            searchButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: searchButton.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc func searchButtonPressed() {
        print("Search button pressed")
        
        searchDefinitionsDelegate?.searchDefinitions(forWord: textField.text)
    }
}

