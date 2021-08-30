//
//  NewHabitController.swift
//  MonumentalHabits
//
//  Created by Rafael on 30.08.21.
//

import UIKit

class NewHabitController: UITabBarController {
    
    // MARK:- Properties
    
    var scrollView: UIScrollView = {
         let v = UIScrollView()
         v.translatesAutoresizingMaskIntoConstraints = false
         v.backgroundColor = UIColor(named: Utils.lineColor)
         v.isScrollEnabled = true
         v.showsVerticalScrollIndicator = false
         v.showsHorizontalScrollIndicator = false
         v.isUserInteractionEnabled = true
         return v
     }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor(patternImage: UIImage(named: Utils.home_page_background)!)
        return view
    }()
    
    
    let backgroundImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: Utils.home_page_background)!)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    
    let backImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "back_button"), for: .normal)
        return button
    }()
    
    let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "New Habit"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = label.text!.capitalized
        label.font = UIFont(name: "Manrope-Bold", size: 18)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    let habitNameTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor  = .white
        textField.layer.cornerRadius = 12
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor(named: Utils.textColor)
        textField.font = UIFont(name: "Manrope-Bold", size: 16)
        let underlineAttribute:[NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Manrope-Medium", size: 16)!,
            .foregroundColor: UIColor(named: Utils.selectedIndicatorColor)!
            .withAlphaComponent(0.5)
        ]
        let underlineAttributedString = NSAttributedString(string: "Enter habit name", attributes: underlineAttribute)
        textField.attributedPlaceholder = underlineAttributedString
       return textField
    }()
    
    let image : UIImageView = {
        let image = UIImageView(image: UIImage(named: Utils.image)!)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    
    //MARK:- LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
        setupView()
        setupConstraints()
        backImage.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    
    func setupConstraints(){
        let window = UIApplication.shared.windows[0]
        let safeFrame = window.safeAreaLayoutGuide.layoutFrame
        let topSafeAreaHeight = safeFrame.minY
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -topSafeAreaHeight),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 1),
            backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),

            
            backImage.heightAnchor.constraint(equalToConstant: 50),
            backImage.widthAnchor.constraint(equalToConstant: 50),
            backImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20+topSafeAreaHeight),
            backImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),

            
            homeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20 + topSafeAreaHeight),
            homeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            homeLabel.centerYAnchor.constraint(equalTo: backImage.centerYAnchor),

            
            image.topAnchor.constraint(equalTo: homeLabel.bottomAnchor, constant: 28),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            image.heightAnchor.constraint(equalToConstant: 52),
            image.widthAnchor.constraint(equalToConstant: 50),

            
            
            habitNameTextField.topAnchor.constraint(equalTo: homeLabel.bottomAnchor, constant: 30),
            habitNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            habitNameTextField.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -12),
            habitNameTextField.heightAnchor.constraint(equalToConstant: 49),
            
            
        ])
    }
    
    func setupView(){
        contentView.addSubview(backgroundImage)
        contentView.addSubview(backImage)
        contentView.addSubview(homeLabel)
        contentView.addSubview(habitNameTextField)
        contentView.addSubview(image)
        
        
       view.addSubview(scrollView)
       scrollView.addSubview(contentView)
    }
    //MARK:- Setups
    
    
    
    //MARK:- Utils
    
    @objc func backAction(){
        let mainViewController = self.tabBarController as! MyTabBarCtrl?
        mainViewController?.changeMiddleButton(status: 0)
        self.tabBarController?.selectedIndex = 0
    }
}
