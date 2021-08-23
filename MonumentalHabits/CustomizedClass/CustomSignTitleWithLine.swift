//
//  CustomSignTitleWithLine.swift
//  MonumentalHabits
//
//  Created by Rafael on 20.08.21.
//

import UIKit

class CustomSignTitleWithLine: UIView {
    
    var firstLine: UIView!
    var label: UILabel!
    var secondLine: UIView!
   
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init() {
        super.init(frame: .zero)
        self.addCustomView()
        self.addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        firstLine = UIView()
        firstLine.translatesAutoresizingMaskIntoConstraints = false
        firstLine.backgroundColor = UIColor(named: Utils.titleLineColor)
        
        self.addSubview(firstLine)
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Or sign in with"
        label.font = UIFont(name: "Manrope-Medium", size: 14)
        label.textColor = UIColor(named: Utils.titleTextColor)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        self.addSubview(label)
        
        secondLine = UIView()
        secondLine.translatesAutoresizingMaskIntoConstraints = false
        secondLine.backgroundColor = UIColor(named: Utils.titleLineColor)
        
        self.addSubview(secondLine)
        }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            firstLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            firstLine.centerYAnchor.constraint(equalTo: centerYAnchor),
            firstLine.heightAnchor.constraint(equalToConstant: 1),
//            firstLine.widthAnchor.constraint(equalToConstant: 20),
            
            label.leadingAnchor.constraint(equalTo: firstLine.trailingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            secondLine.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            secondLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            secondLine.centerYAnchor.constraint(equalTo: centerYAnchor),
            secondLine.heightAnchor.constraint(equalToConstant: 1),
//            secondLine.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
}
