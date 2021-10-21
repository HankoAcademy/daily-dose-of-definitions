//
//  DefinitionBox.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/10/21.
//

import UIKit

class DefinitionBox: UIView {
    
    weak var displayDelegate:randomWordDisplayDelegate?
    
    let mainStack:UIStackView = {
      let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .center
        return stack
    }()
    let textView:UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.font = UIFont(name:"GillSans-Italic", size:20)
        view.textAlignment = .center
        return view
    }()
    let bottomStack:UIStackView = {
      let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .bottom
        return stack
    }()
    let spacer:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var refreshButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName:"arrow.clockwise.circle" ), for: .normal)
        button.addTarget(self, action: #selector(getRandomWordInTextBox), for: .touchUpInside)
        return button
    }()
    
    let randomLabel:UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Random Word"
        return label
    }()
    
    
    @objc func getRandomWordInTextBox(){
        displayDelegate?.getRandomWordInTextBox{[weak self] text in
            DispatchQueue.main.async{
                self?.textView.text = text
            }
        }
    }
    init(displayDelegate:randomWordDisplayDelegate? = nil){
        self.displayDelegate = displayDelegate
        super.init(frame:.zero)
        setUpUI()
        displayDelegate?.getRandomWordInTextBox{[weak self] text in
            DispatchQueue.main.async{
            print("text for now \(text)")
            self?.textView.text = text
            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpUI(){
        self.addSubview(mainStack)
        mainStack.addArrangedSubview(textView)
        mainStack.addArrangedSubview(bottomStack)
        bottomStack.addArrangedSubview(randomLabel)
        bottomStack.addArrangedSubview(spacer)
        bottomStack.addArrangedSubview(refreshButton)
        
         NSLayoutConstraint.activate([
             mainStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
             mainStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             mainStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
             mainStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
             mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
             bottomStack.widthAnchor.constraint(equalTo: mainStack.widthAnchor)
             
         ])
        randomLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        refreshButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            textView.widthAnchor.constraint(equalTo: mainStack.widthAnchor),
            textView.heightAnchor.constraint(equalToConstant: 180)
        ])
        self.layoutIfNeeded()
        NSLayoutConstraint.activate([
            bottomStack.widthAnchor.constraint(equalTo: mainStack.widthAnchor),
            refreshButton.widthAnchor.constraint(equalToConstant: 30),
            refreshButton.heightAnchor.constraint(equalToConstant: 30)
        ])
         
    }
}
