//
//  CustomTextField.swift
//  MonumentalHabits
//
//  Created by Bob on 17.08.21.
//

import UIKit

class CustomTextField : UIView , UITextFieldDelegate {
    
    var icon : UIImage!
    var selectedIcon: UIImage!
    var placeholder: String!
    var line : UIView!
    var textField : UITextField!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(icon: UIImage, selectedIcon: UIImage, placeholder: String) {
        self.icon = icon
        self.selectedIcon = selectedIcon
        self.placeholder = placeholder
        super.init(frame: .zero)
        self.addCustomView()
        self.addConstraints()
        self.backgroundColor = UIColor(named: Utils.milkColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = icon
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        
        line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor(named: Utils.lineColor)
        self.addSubview(line)
        
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.textColor = UIColor(named: Utils.textColor)
        textField.font = UIFont(name: "Manrope-Bold", size: 16)
//        textField.attributedPlaceholder = NSAttributedString(string: placeholder,
//                                                             attributes: [NSAttributedString
//                                                                            .Key.foregroundColor:
//                                                                            UIColor(named: Utils.selectedIndicatorColor)!
//
//                                                                          .withAlphaComponent(0.5)
//                                                                            ])
        
        let underlineAttribute:[NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Manrope-Medium", size: 14)!,
            .foregroundColor: UIColor(named: Utils.selectedIndicatorColor)!
            .withAlphaComponent(0.5)
        ]
        
        let underlineAttributedString = NSAttributedString(string: placeholder, attributes: underlineAttribute)
        
        textField.attributedPlaceholder = underlineAttributedString
        
        self.addSubview(textField)
        }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 15),
            
            line.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 17),
            line.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            line.heightAnchor.constraint(equalTo: heightAnchor),
            line.widthAnchor.constraint(equalToConstant: 1),
            
            textField.leadingAnchor.constraint(equalTo: line.trailingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
        
        ])
    }
    

    func textFieldDidBeginEditing(_ textField: UITextField) {
        imageView.image = selectedIcon
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        imageView.image = icon
    }
    
}



