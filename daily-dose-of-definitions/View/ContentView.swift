//
//  ContentView.swift
//  daily-dose-of-definitions
//
//  Created by Diana Ruiz-Olvera on 10/12/21.
//

import UIKit

class ContentView: UIView {
    
    // MARK: - Properties
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "LovelyMelody", size: 50)
        titleLabel.text = "Word of the Day"
        return titleLabel
    }()
    
    let divider1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let divider2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let dateLabel: UILabel = {
        var currentDateTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .long
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        dateLabel.textAlignment = .right
        dateLabel.text = "\(dateFormatter.string(from: currentDateTime))"
        return dateLabel
    }()
    
    let topContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 20
        return view
    }()
    
    let bottomContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 20
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemTeal
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setUpUI() {

        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        
        view.addSubview(titleLabel)
        view.addSubview(divider1)
        view.addSubview(dateLabel)
        view.addSubview(topContainerView)
        
        view.addSubview(divider2)
        view.addSubview(bottomContainerView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            divider1.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            divider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            divider1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            divider1.bottomAnchor.constraint(equalTo: divider1.bottomAnchor),
            divider1.heightAnchor.constraint(equalToConstant: 4),
            
            dateLabel.topAnchor.constraint(equalTo: divider1.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            dateLabel.heightAnchor.constraint(equalToConstant: 35),
            
            topContainerView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            divider2.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 20),
            divider2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            divider2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            divider2.heightAnchor.constraint(equalToConstant: 4),
            
            bottomContainerView.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 20),
            bottomContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50),
            ])
    
    }
    
}
