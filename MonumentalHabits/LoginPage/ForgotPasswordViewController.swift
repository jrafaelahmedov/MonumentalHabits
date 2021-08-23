//
//  ForgotPasswordViewController.swift
//  MonumentalHabits
//
//  Created by Rafael on 23.08.21.
//

import UIKit

class ForgotPasswordViewController : UIViewController {
    
    //MARK:-Properties
    
    
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
        return view
    }()
    
    let backImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "back_button"), for: .normal)
        return button
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Forgot your password?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = label.text!.capitalized
        label.font = UIFont(name: "Klasik-Regular", size: 24)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    let forgotImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: Utils.forgot_image))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let bottomView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    let resendPassLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter your registered email below to receive password reset instruction"
        label.font = UIFont(name: "Manrope-Medium", size: 14)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    let resendTextField : CustomTextField = {
        let textField = CustomTextField(icon: nil, selectedIcon: nil, placeholder: "Email", backColor: UIColor(named: Utils.milkColor)!, isSecure: false)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    
    let resendButton : CustomButton = {
        let customButton = CustomButton(text: "Send Reset Link")
        return customButton
    }()
    
    //MARK:-LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    let signInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Remember password? Login"
        label.font = UIFont(name: "Manrope-Medium", size: 14)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.attributedText = label.text?.attributedStringWithFont(["Login"], font: UIFont(name: "Manrope-Bold", size: 14)!, color: UIColor(named: Utils.selectedIndicatorColor)!)
        return label
    }()
    
    //MARK:-Setups
    
    
    func setupView(){
        contentView.addSubview(backImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(forgotImage)
        bottomView.addSubview(resendPassLabel)
        bottomView.addSubview(resendTextField)
        contentView.addSubview(bottomView)
        contentView.addSubview(resendButton)
        contentView.addSubview(signInLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        backImage.isUserInteractionEnabled = true
        backImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backClicked)))
        
        signInLabel.isUserInteractionEnabled = true
        signInLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(getSignIn)))
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
            
            backImage.heightAnchor.constraint(equalToConstant: 50),
            backImage.widthAnchor.constraint(equalToConstant: 50),
            backImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20+topSafeAreaHeight),
            backImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            
            titleLabel.topAnchor.constraint(equalTo: backImage.bottomAnchor,constant: 21),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            forgotImage.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: topSafeAreaHeight),
            forgotImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            forgotImage.heightAnchor.constraint(equalToConstant: 264),
            forgotImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            
            resendPassLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20),
            resendPassLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            resendPassLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            
            
            resendTextField.heightAnchor.constraint(equalToConstant: 56),
            resendTextField.topAnchor.constraint(equalTo: resendPassLabel.bottomAnchor, constant: 30),
            resendTextField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            resendTextField.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            resendTextField.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),

            
//            resendButton.heightAnchor.constraint(equalToConstant: 56),
            resendButton.topAnchor.constraint(equalTo: resendTextField.bottomAnchor, constant: 10),
            resendButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            resendButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            resendButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -20),
            
           
            bottomView.topAnchor.constraint(equalTo: forgotImage.bottomAnchor, constant: 40),
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
          
            signInLabel.topAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 100),
            signInLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            signInLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            signInLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -34),
            
        ])
    }
    
    //MARK:- Utils
    
     @objc func backClicked(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func getSignIn() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
