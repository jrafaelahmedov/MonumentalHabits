//
//  CustomButton.swift
//  MonumentalHabits
//
//  Created by Bob on 17.08.21.
//

import UIKit

class CustomButton : UIButton {
    
    var myText: String!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String) {
        self.myText = text
        super.init(frame: .zero)
        self.addCustomView()
        self.addConstraints()
        self.backgroundColor = UIColor(named: Utils.textColor)
    }
    
    func addCustomView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 8
        self.setTitle(myText, for: .normal)
        self.setTitleColor(UIColor(named: Utils.selectedIndicatorColor), for: .normal)
        self.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 16)
        self.titleLabel?.textAlignment = .center
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 60),
            self.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
}
