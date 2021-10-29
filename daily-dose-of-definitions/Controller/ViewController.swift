//
//  ViewController.swift
//  daily-dose-of-definitions
//
//  Created by Diana Ruiz-Olvera on 10/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var contentView: ContentView!
    var topViewController: TopViewController!
    var topView: TopView!
    var bottomViewController: BottomViewController!
    var bottomView: BottomView!
    
    override func loadView() {
        
        contentView = ContentView()
        
        let topViewController = TopViewController()
        topViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(topViewController)
        contentView.topContainerView.addSubview(topViewController.view)
        topViewController.didMove(toParent: self)
        //topViewController.view.frame = contentView.topContainerView.frame
    
        let bottomViewController = BottomViewController()
        bottomViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(bottomViewController)
        contentView.bottomContainerView.addSubview(bottomViewController.view)
        bottomViewController.didMove(toParent: self)
        //bottomViewController.view.frame = contentView.bottomContainerView.frame
        
        view = contentView

        NSLayoutConstraint.activate([
        topViewController.view.topAnchor.constraint(equalTo: contentView.topContainerView.topAnchor, constant: 0),
        topViewController.view.leadingAnchor.constraint(equalTo: contentView.topContainerView.leadingAnchor, constant: 0),
        topViewController.view.bottomAnchor.constraint(equalTo: contentView.topContainerView.bottomAnchor, constant: 0),
        topViewController.view.trailingAnchor.constraint(equalTo: contentView.topContainerView.trailingAnchor, constant: 0),


        bottomViewController.view.topAnchor.constraint(equalTo: contentView.bottomContainerView.topAnchor, constant: 0),
        bottomViewController.view.leadingAnchor.constraint(equalTo: contentView.bottomContainerView.leadingAnchor, constant: 0),
        bottomViewController.view.bottomAnchor.constraint(equalTo: contentView.bottomContainerView.bottomAnchor, constant: 0),
        bottomViewController.view.trailingAnchor.constraint(equalTo: contentView.bottomContainerView.trailingAnchor, constant: 0),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
