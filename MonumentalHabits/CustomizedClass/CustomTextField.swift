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
    var showPasswordLabel : UILabel!
    var imageView: UIImageView!
    var isSecure : Bool!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(icon: UIImage, selectedIcon: UIImage, placeholder: String, backColor: UIColor, isSecure: Bool) {
        self.isSecure = isSecure
        self.icon = icon
        self.selectedIcon = selectedIcon
        self.placeholder = placeholder
        super.init(frame: .zero)
        self.addCustomView()
        self.addConstraints()
        self.backgroundColor = backColor
       
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
        textField.isSecureTextEntry = isSecure
        textField.textColor = UIColor(named: Utils.textColor)
        textField.font = UIFont(name: "Manrope-Bold", size: 16)
        
        let underlineAttribute:[NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Manrope-Medium", size: 14)!,
            .foregroundColor: UIColor(named: Utils.selectedIndicatorColor)!
            .withAlphaComponent(0.5)
        ]
        
        let underlineAttributedString = NSAttributedString(string: placeholder, attributes: underlineAttribute)
        
        textField.attributedPlaceholder = underlineAttributedString
        
        self.addSubview(textField)
        
        if isSecure {
         showPasswordLabel = UILabel()
         showPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
         let underlineAttribute:[NSAttributedString.Key: Any] = [
                .underlineStyle: 1,
                .font: UIFont(name: "Manrope-Medium", size: 14)!,
                .foregroundColor: UIColor(named: Utils.selectedIndicatorColor)!
            ]
            let underlineAttributedString = NSAttributedString(string: "Show", attributes: underlineAttribute)
            showPasswordLabel.attributedText = underlineAttributedString
            showPasswordLabel.isUserInteractionEnabled = true
            showPasswordLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.isShowTapped)))
            self.addSubview(showPasswordLabel)
        }
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
        if showPasswordLabel != nil {
        showPasswordLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            showPasswordLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -10).isActive = true
            showPasswordLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            showPasswordLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        }
    }
    

    func textFieldDidBeginEditing(_ textField: UITextField) {
        imageView.image = selectedIcon
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        imageView.image = icon
    }
    
    @objc func isShowTapped(){
        isSecure = !isSecure
        textField.isSecureTextEntry = isSecure
    }
    
}



