//
//  WordDetailsViewController.swift
//  daily-dose-of-definitions
//
//  Created by Diana Ruiz-Olvera on 10/27/21.
//

import UIKit

class WordDetailsViewController: UIViewController {
    
    var wordDetailsView: WordDetailsView!
    let selectedWord: String
    let wordDetails: WordDetails

    override func loadView() {
        view = wordDetailsView
    }
    
    init(selectedWord: String, wordDetails: WordDetails) {
        print(wordDetails)
        self.wordDetails = wordDetails
        print(self.wordDetails)
        self.selectedWord = selectedWord
        self.wordDetailsView = WordDetailsView(selectedWord: selectedWord, wordDetails: wordDetails)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .systemTeal

        navigationItem.title = selectedWord
    }
    
}
