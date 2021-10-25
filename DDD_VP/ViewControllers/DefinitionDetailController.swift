//
//  DefinitionDetailController.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/21/21.
//

import UIKit

class DefinitionDetailController: UIViewController {
    var wordInstance:WordInstance
    
    
    //MARK: UI Elements
    //they need to be in stackView
    
    lazy var definitionView:DefinitionDetailView = {
        let view = DefinitionDetailView(wordInstance: wordInstance)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = .lightGray
        return view
    }()
    lazy var synonymView:DefinitionDetailGenericView = {
        let view = DefinitionDetailGenericView(wordInstance: wordInstance, type:"Synonyms")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = .lightGray
        return view
    }()
    lazy var antonymView:DefinitionDetailGenericView = {
        let view = DefinitionDetailGenericView(wordInstance: wordInstance, type:"Antonyms")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var examplesView:DefinitionExamplesView = {
        let view = DefinitionExamplesView(wordInstance: wordInstance)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = .lightGray
        return view
    }()
    
    init(wordInstance:WordInstance){
        self.wordInstance = wordInstance
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(definitionView)
        view.addSubview(synonymView)
        view.addSubview(antonymView)
        view.addSubview(examplesView)
        NSLayoutConstraint.activate([
            definitionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            definitionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            definitionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            definitionView.heightAnchor.constraint(equalToConstant: view.frame.height/5)
        ])
        NSLayoutConstraint.activate([
            synonymView.topAnchor.constraint(equalTo: definitionView.bottomAnchor, constant: 20),
            synonymView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            synonymView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            synonymView.heightAnchor.constraint(equalToConstant: 120)
        ])
        NSLayoutConstraint.activate([
            antonymView.topAnchor.constraint(equalTo: synonymView.bottomAnchor, constant: 20),
            antonymView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            antonymView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            antonymView.heightAnchor.constraint(equalToConstant: 120)
        ])
        NSLayoutConstraint.activate([
            examplesView.topAnchor.constraint(equalTo: antonymView.bottomAnchor, constant: 20),
            examplesView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            examplesView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            examplesView.heightAnchor.constraint(equalToConstant: view.frame.height/5)
        ])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
