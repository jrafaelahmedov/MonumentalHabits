//
//  SignUpViewController.swift
//  MonumentalHabits
//
//  Created by Rafael Ahmedov on 19.08.21.
//

import UIKit

class SignUpViewController : UIViewController {
    
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
        return view
    }()
    
    let signUpImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: Utils.signUpImage))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Create your account"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = label.text!.capitalized
        label.font = UIFont(name: "Klasik-Regular", size: 24)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()    
    
    let nameField : CustomTextField = {
        let email = CustomTextField(icon: UIImage(named: Utils.userIconUnselected)!, selectedIcon: UIImage(named: Utils.userIcon)!, placeholder: "Full name",backColor: .white,isSecure: false)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.layer.cornerRadius = 12
        return email
    }()
    
    let emailField : CustomTextField = {
        let email = CustomTextField(icon: UIImage(named: Utils.unselectedEmailIcon)!, selectedIcon: UIImage(named: Utils.selectedEmailIcon)!, placeholder: "Email",backColor: .white,isSecure: false)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.layer.cornerRadius = 12
        return email
    }()

    let passwordField : CustomTextField = {
        let password = CustomTextField(icon: UIImage(named: Utils.unselectedPasswordIcon)!, selectedIcon: UIImage(named: Utils.selectedPasswordIcon)!, placeholder: "Password",backColor: .white,isSecure: true)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.layer.cornerRadius = 12
        return password
    }()

    let loginAndPasswordFieldStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8.0
        return stackView
    }()
    
    let checkBoxKeepSignedIn : CustomCheckBoxWithText = {
        let checkBox = CustomCheckBoxWithText(text: "Keep me signed in")
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        return checkBox
    }()
    
    let checkBoxNotifyMe : CustomCheckBoxWithText = {
        let checkBox = CustomCheckBoxWithText(text: "Email me about special pricing and more")
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        return checkBox
    }()
    
    let checkBoxStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16.0
        return stackView
    }()
    
    let signUpButton : CustomButton = {
        let customButton = CustomButton(text: "Create Account")
        customButton.translatesAutoresizingMaskIntoConstraints = false
        return customButton
    }()
    
    let customSignUpLabel : CustomSignTitleWithLine = {
        let custom = CustomSignTitleWithLine()
        custom.translatesAutoresizingMaskIntoConstraints = false
        return custom
    }()
    
    
    let googleButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "google_icon"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.setTitle("Google", for: .normal)
        button.setTitleColor(UIColor(named: Utils.selectedIndicatorColor), for: .normal)
        button.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 16)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    let facebookButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -2, bottom: 0, right: 0)
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(UIColor(named: Utils.selectedIndicatorColor), for: .normal)
        button.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 16)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    let continueWidthButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20.0
        return stackView
    }()
    
    
    let signInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Already have an account? Sign In"
        label.font = UIFont(name: "Manrope-Medium", size: 14)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.attributedText = label.text?.attributedStringWithFont(["Sign", "In"], font: UIFont(name: "Manrope-Bold", size: 14)!, color: UIColor(named: Utils.selectedIndicatorColor)!)
        return label
    }()
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
  
    
    //MARK:- Setups
    
    func setupView(){
        contentView.addSubview(signUpImage)
        contentView.addSubview(titleLabel)
        loginAndPasswordFieldStack.addArrangedSubview(nameField)
        loginAndPasswordFieldStack.addArrangedSubview(emailField)
        loginAndPasswordFieldStack.addArrangedSubview(passwordField)
        contentView.addSubview(loginAndPasswordFieldStack)
        checkBoxStack.addArrangedSubview(checkBoxKeepSignedIn)
        checkBoxStack.addArrangedSubview(checkBoxNotifyMe)
        contentView.addSubview(checkBoxStack)
        contentView.addSubview(signUpButton)
        contentView.addSubview(customSignUpLabel)
        continueWidthButtons.addArrangedSubview(googleButton)
        continueWidthButtons.addArrangedSubview(facebookButton)
        contentView.addSubview(continueWidthButtons)
        contentView.addSubview(signInLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
     
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

            signUpImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topSafeAreaHeight),
            signUpImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signUpImage.heightAnchor.constraint(equalToConstant: 200),
            signUpImage.widthAnchor.constraint(equalToConstant: 186),
            
            titleLabel.topAnchor.constraint(equalTo: signUpImage.bottomAnchor,constant: 21),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            emailField.heightAnchor.constraint(equalToConstant: 56),
            passwordField.heightAnchor.constraint(equalToConstant: 56),
            nameField.heightAnchor.constraint(equalToConstant: 56),

            loginAndPasswordFieldStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            loginAndPasswordFieldStack.leadingAnchor.constraint(equalTo:
                                                                    contentView.leadingAnchor, constant: 20),
            loginAndPasswordFieldStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            checkBoxKeepSignedIn.heightAnchor.constraint(equalToConstant: 25),
            checkBoxNotifyMe.heightAnchor.constraint(equalToConstant: 25),

            checkBoxStack.topAnchor.constraint(equalTo: loginAndPasswordFieldStack.bottomAnchor, constant: 30),
            checkBoxStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            checkBoxStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),

            signUpButton.topAnchor.constraint(equalTo: checkBoxStack.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo:
                                                    contentView.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            customSignUpLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 25),
            customSignUpLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customSignUpLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            continueWidthButtons.topAnchor.constraint(equalTo: customSignUpLabel.bottomAnchor, constant: 40),
            continueWidthButtons.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            continueWidthButtons.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            googleButton.heightAnchor.constraint(equalToConstant: 50),

            signInLabel.topAnchor.constraint(equalTo: continueWidthButtons.bottomAnchor, constant: 30),
            signInLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signInLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10)
        ])
    }
    
    @objc func getSignIn() {
        self.navigationController?.popViewController(animated: true)
    }
}
