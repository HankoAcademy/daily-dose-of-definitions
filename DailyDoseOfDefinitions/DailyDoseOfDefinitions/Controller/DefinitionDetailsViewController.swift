//
//  DefinitionDetailsViewController.swift
//  DailyDoseOfDefinitions
//
//  Created by Hannie Kim on 10/7/21.
//

import UIKit

class DefinitionDetailsViewController: UIViewController {

    let contentView: DefinitionDetailsView!
    let wordDetail: WordDetail
    let selectedWord: String
    
    override func loadView() {
        view = contentView
    }
    
    init(wordDetail: WordDetail, selectedWord: String) {
        self.wordDetail = wordDetail
        self.selectedWord = selectedWord
        self.contentView = DefinitionDetailsView(wordDetail: wordDetail, selectedWord: selectedWord)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes

        navigationItem.title = selectedWord
    }
}
