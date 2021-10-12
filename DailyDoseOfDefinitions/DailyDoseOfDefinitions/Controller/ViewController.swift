//
//  ViewController.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/1/21.
//

import UIKit

class ViewController: UIViewController {

    var contentView = MainView()
    let randomWordViewController = RandomWordViewController()
    let searchDefinitionsViewController = SearchDefinitionsViewController()
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        view = contentView
        
        randomWordViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(randomWordViewController)
        contentView.randomWordContainerView.addSubview(randomWordViewController.view)
        randomWordViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            randomWordViewController.view.topAnchor.constraint(equalTo: contentView.randomWordContainerView.topAnchor),
            randomWordViewController.view.leadingAnchor.constraint(equalTo: contentView.randomWordContainerView.leadingAnchor),
            randomWordViewController.view.bottomAnchor.constraint(equalTo: contentView.randomWordContainerView.bottomAnchor),
            randomWordViewController.view.trailingAnchor.constraint(equalTo: contentView.randomWordContainerView.trailingAnchor)
        ])
        
        searchDefinitionsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(searchDefinitionsViewController)
        contentView.definitionSearchContainerView.addSubview(searchDefinitionsViewController.view)
        searchDefinitionsViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            searchDefinitionsViewController.view.topAnchor.constraint(equalTo: contentView.definitionSearchContainerView.topAnchor),
            searchDefinitionsViewController.view.leadingAnchor.constraint(equalTo: contentView.definitionSearchContainerView.leadingAnchor),
            searchDefinitionsViewController.view.bottomAnchor.constraint(equalTo: contentView.definitionSearchContainerView.bottomAnchor),
            searchDefinitionsViewController.view.trailingAnchor.constraint(equalTo: contentView.definitionSearchContainerView.trailingAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
