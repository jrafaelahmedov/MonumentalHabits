//
//  CustomCheckBoxWithText.swift
//  MonumentalHabits
//
//  Created by Rafael on 20.08.21.
//

import UIKit

class CustomCheckBoxWithText : UIView {
    
    var label: UILabel!
    var checkBox: CustomCheckBox!
    var text: String!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(text: String) {
        self.text = text
        super.init(frame: .zero)
        self.addCustomView()
        self.addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        checkBox = CustomCheckBox()
        checkBox.isChecked = false
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(checkBox)
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(name: "Manrope-Medium", size: 16)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        self.addSubview(label)
        
        
        }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            checkBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 37),
            checkBox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkBox.heightAnchor.constraint(equalToConstant: 20),
            checkBox.widthAnchor.constraint(equalToConstant: 20),
            
            label.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 12),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
