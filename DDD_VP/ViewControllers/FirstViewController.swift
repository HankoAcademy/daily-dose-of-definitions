//
//  ViewController.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/8/21.
//

import UIKit

protocol randomWordDisplayDelegate:AnyObject{
    func getRandomWordInTextBox(recursionCounter:Int,completion: @escaping (String)->())
}
protocol definitionDetailsParent:AnyObject{
    func launchDetailDefinitionVC(wordInstance:WordInstance)
}

class FirstViewController: UIViewController, randomWordDisplayDelegate{
    var randomWord:Word?
    var randomResults:[WordInstance]?
    var count = 0
    
    //MARK: - UI Component Declarations
    
    let titleView:TitleView = {
        let view = TitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var dateLabel:UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    lazy var definitionBox:DefinitionBox = {
        let view = DefinitionBox(displayDelegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.darkText.cgColor
        return view
    }()
    let divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    let tv_containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple //for now
       return view
    }()
    
    //MARK: View Set up functions
    private func setUpViews(){
        setUpTitleView()
        setUpDateLabel()
        setUpTextBox()
        setUpDivider()
        setUpTVContainerView()
    }
    private func setUpTitleView(){
        self.view.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant:10),
            titleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 78)
        ])
    }
    private func setUpDateLabel(){
        self.view.addSubview(dateLabel)
        
        let today = Date()
        let dateF = DateFormatter()
        dateF.dateStyle = .long
        dateLabel.text = dateF.string(from:today)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant:-40),
            dateLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func setUpTextBox(){
        self.view.addSubview(definitionBox)
        NSLayoutConstraint.activate([
            definitionBox.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            definitionBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:40),
            definitionBox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:-40),
            definitionBox.heightAnchor.constraint(equalToConstant: 260)
        ])
    }
    private func setUpDivider(){
        self.view.addSubview(divider)
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: definitionBox.bottomAnchor, constant:20),
            divider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            divider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            divider.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    private func setUpTVContainerView(){
        self.view.addSubview(tv_containerView)
        NSLayoutConstraint.activate([
        tv_containerView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
        tv_containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
        tv_containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
        tv_containerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViews()
       
        let searchViewController = SearchTableViewController(delegate: self)
        let navController = UINavigationController(rootViewController: searchViewController)
        self.addChild(navController)
        tv_containerView.addSubview(navController.view)
        navController.view.frame = tv_containerView.frame
        
    }
    
    func getRandomWordInTextBox(recursionCounter:Int,completion:@escaping (String)->()) {
        var randomWord:Word?
        var localCounter = recursionCounter + 1
        
        Networking.shared.getRandomWord{[weak self] aResult in
            switch aResult{
            case .success(let aWord):
                randomWord = aWord
                self?.randomResults = aWord.results
            case .failure(let error):
                print(error.localizedDescription)
            } //switch result
            
            var text:String = ""
            var titleString = ""
            if let randomWord = randomWord{
                titleString.append("\(randomWord.word):\n")
                let randomList = randomWord.results
                if let randomList = randomList {
                    var defCount = 0
                    for aResult in randomList{
                        defCount += 1
                        text.append("\(defCount). \(aResult.definition)\n")
                    }
                }
            }
            if (!titleString.trimmingCharacters(in:.whitespaces).isEmpty) && !(text.trimmingCharacters(in:.whitespaces).isEmpty){
                completion("\(titleString)\n\(text)")
            } else {
                print("recursion counter \(localCounter)")
                if localCounter <= 10{
                    self?.getRandomWordInTextBox(recursionCounter:localCounter,completion: completion)
                }
            }
            
        } //networking
    }
}
extension FirstViewController:definitionDetailsParent{
    func launchDetailDefinitionVC(wordInstance: WordInstance) {
       let destinationVC = DefinitionDetailController(wordInstance: wordInstance) as DefinitionDetailController
        //add to navigationController
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
}
    

