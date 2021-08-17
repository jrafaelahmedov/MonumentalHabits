//
//  PageOne.swift
//  MonumentalHabits
//
//  Created by Bob on 12.08.21.
//

import UIKit

class IntroductionPageController : UIViewController {
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let descLabel = UILabel()
    
    init(imageName: String , titleText : String, descText: String) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = UIImage(named: imageName)
        titleLabel.text = titleText
        descLabel.text = descText
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
          super.viewDidLoad()
          style()
          layout()
      }
}

extension IntroductionPageController {
    
    func style() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.alignment = .center
            
        
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            
        
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.numberOfLines = 2
//            titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.font = UIFont(name: "Klasik-Regular", size: 32)
            titleLabel.textAlignment = .center
            titleLabel.text = titleLabel.text?.uppercased()
            
            descLabel.translatesAutoresizingMaskIntoConstraints = false
            descLabel.font = UIFont(name: "Manrope-Bold", size: 17)
            descLabel.textAlignment = .center
            descLabel.numberOfLines = 0
        }
            
        func layout() {
            titleLabel.textColor = UIColor(named: Utils.selectedIndicatorColor)
            descLabel.textColor = UIColor(named: Utils.selectedIndicatorColor)
            descLabel.attributedText = descLabel.text?.attributedStringWithColor(["HELP YOU","YOURSELF"], color: UIColor(named: Utils.orangeColor)!)
            
            
            stackView.addSubview(imageView)
            stackView.addSubview(titleLabel)
            stackView.addSubview(descLabel)
            
            view.addSubview(stackView)
            
            NSLayoutConstraint.activate([
//                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
 
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
                
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
                
            descLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            ])
        }
}


extension String {
    func attributedStringWithColor(_ strings: [String], color: UIColor, characterSpacing: UInt? = nil) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        for string in strings {
            let range = (self as NSString).range(of: string)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        
        guard let characterSpacing = characterSpacing else {return attributedString}

        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))

        return attributedString
    }
}
