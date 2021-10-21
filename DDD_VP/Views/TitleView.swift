//
//  HeaderView.swift
//  DDD_VP
//
//  Created by Victoria Park on 10/9/21.
//

import UIKit

class TitleView: UIView {

    let titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Daily Dose of Definitions"
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize:25, weight:.semibold)
        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    override init(frame:CGRect){
        super.init(frame:frame)
        setUpUI()
    }
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    private func setUpUI(){
        
         self.addSubview(titleLabel)
         NSLayoutConstraint.activate([
             titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant:10),
             titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
             titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
             titleLabel.heightAnchor.constraint(equalToConstant: 70)
         ])
         self.addSubview(divider)
         NSLayoutConstraint.activate([
             divider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant:5),
             divider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
             divider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
             divider.heightAnchor.constraint(equalToConstant: 3)
         ])
         
    }
}
