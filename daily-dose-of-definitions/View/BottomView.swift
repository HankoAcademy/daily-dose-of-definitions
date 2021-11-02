//
//  BottomView.swift
//  daily-dose-of-definitions
//
//  Created by Diana Ruiz-Olvera on 10/20/21.
//

import UIKit

class BottomView: UIView {
    
    let searchBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    let searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Find a word..."
        searchTextField.backgroundColor = .white
        searchTextField.autocapitalizationType = .none
        searchTextField.layer.cornerRadius = 10
        let paddingView: UIView = UIView(frame: CGRect(x: 35, y: 0, width: 30, height: 30))
        let iconView = UIImageView(frame: CGRect(x: 10, y: 8, width: 16, height: 16))
        iconView.image = UIImage(systemName: "magnifyingglass")
        iconView.tintColor = .systemGray3
        paddingView.addSubview(iconView)
        searchTextField.leftView = paddingView
        searchTextField.textAlignment = .left
        searchTextField.leftViewMode = .always
        return searchTextField
    }()
    
    var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var buttonAction: (() -> Void)?
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    init(buttonAction: @escaping () -> Void, frame: CGRect = .zero) {
        self.buttonAction = buttonAction
        super.init(frame: frame)
        backgroundColor = .systemTeal
        setUpUI()
    }
    
    @objc func searchButtonPressed() {
        buttonAction!()
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchResultsTableViewCell.self, forCellReuseIdentifier: SearchResultsTableViewCell.identifier)
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .systemTeal
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        
        searchBarStackView.addArrangedSubview(searchTextField)
        searchBarStackView.addArrangedSubview(searchButton)
        
        addSubview(searchBarStackView)
        addSubview(spinner)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
        
        searchBarStackView.topAnchor.constraint(equalTo: topAnchor),
        searchBarStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        searchBarStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1),
        searchBarStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.10),
        
        spinner.topAnchor.constraint(equalTo: searchBarStackView.bottomAnchor, constant: 30),
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor),

        tableView.topAnchor.constraint(equalTo: searchBarStackView.bottomAnchor, constant: 10),
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor),

        ])
    }

}
