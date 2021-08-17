//
//  LoginViewController.swift
//  MonumentalHabits
//
//  Created by Bob on 13.08.21.
//

import UIKit

class LoginViewController : UIViewController {
    

    // MARK:- Properties
    
    let backgroundImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "splashScreen"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let questionImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "question"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()
    
    let gradientImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "gradient"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Welcome to monumental habits"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = label.text!.capitalized
        label.font = UIFont(name: "Klasik-Regular", size: 35)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    let continueWidthButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8.0
        return stackView
    }()
    
    let googleButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "google_icon"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.setTitle("Continue with  Google", for: .normal)
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
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        button.setTitle("Continue with  Facebook", for: .normal)
        button.setTitleColor(UIColor(named: Utils.selectedIndicatorColor), for: .normal)
        button.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 16)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    let uiBottomView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    
    let line : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: Utils.milkColor)
        return view
    }()
    
    let titleLogin : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Log in with email"
        title.font = UIFont(name: "Manrope-Medium", size: 16)
        title.textColor = UIColor(named: Utils.selectedIndicatorColor)
        title.textAlignment = .center
        title.sizeToFit()
        return title
    }()
    
    let emailField : CustomTextField = {
        let email = CustomTextField(icon: UIImage(named: Utils.unselectedEmailIcon)!, selectedIcon: UIImage(named: Utils.selectedEmailIcon)!, placeholder: "Email")
        email.translatesAutoresizingMaskIntoConstraints = false
        email.layer.cornerRadius = 12
        return email
    }()


    let passwordField : CustomTextField = {
        let password = CustomTextField(icon: UIImage(named: Utils.unselectedPasswordIcon)!, selectedIcon: UIImage(named: Utils.selectedPasswordIcon)!, placeholder: "Password")
        password.translatesAutoresizingMaskIntoConstraints = false
        password.layer.cornerRadius = 12
        return password
    }()


    let loginAndPasswordFieldStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8.0
        return stackView
    }()
    
    let loginButton : CustomButton = {
        let customButton = CustomButton(text: "Login")
        return customButton
    }()
    
    let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let underlineAttribute:[NSAttributedString.Key: Any] = [
            .underlineStyle: 1,
            .font: UIFont(name: "Manrope-Medium", size: 14)!,
            .foregroundColor: UIColor(named: Utils.selectedIndicatorColor)!
        ]
        
        let underlineAttributedString = NSAttributedString(string: "Forgot Password?", attributes: underlineAttribute)
        label.attributedText = underlineAttributedString
        
        return label
    }()
    
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    
    // MARK:- Setups
    
    func setupView(){
        view.addSubview(backgroundImage)
        view.addSubview(questionImage)
        view.addSubview(gradientImage)
        view.addSubview(titleLabel)
        view.addSubview(googleButton)
        continueWidthButtons.addArrangedSubview(googleButton)
        continueWidthButtons.addArrangedSubview(facebookButton)
        view.addSubview(continueWidthButtons)
        view.addSubview(uiBottomView)
        view.addSubview(line)
        view.addSubview(titleLogin)
        loginAndPasswordFieldStack.addArrangedSubview(emailField)
        loginAndPasswordFieldStack.addArrangedSubview(passwordField)
        view.addSubview(loginAndPasswordFieldStack)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordLabel)
    }
   
    func setupConstraints(){
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
        
            questionImage.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 10),
            questionImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            gradientImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.85),
            gradientImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            gradientImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gradientImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: gradientImage.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: gradientImage.centerYAnchor,constant: -40),
            
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            
            continueWidthButtons.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            continueWidthButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            continueWidthButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            uiBottomView.topAnchor.constraint(equalTo: continueWidthButtons.bottomAnchor, constant: 25),
            uiBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            uiBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            uiBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            titleLogin.topAnchor.constraint(equalTo: uiBottomView.topAnchor, constant: 12),
            titleLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            titleLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            titleLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            line.topAnchor.constraint(equalTo: uiBottomView.topAnchor, constant: 48),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            line.heightAnchor.constraint(equalToConstant: 1),
    
    
            emailField.heightAnchor.constraint(equalToConstant: 56),
//            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),

            passwordField.heightAnchor.constraint(equalToConstant: 56),
//            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
            
            loginAndPasswordFieldStack.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 16),

            loginAndPasswordFieldStack.leadingAnchor.constraint(equalTo:
                view.leadingAnchor, constant: 20),

            loginAndPasswordFieldStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: loginAndPasswordFieldStack.bottomAnchor, constant: 20),
            
            loginButton.leadingAnchor.constraint(equalTo:
                view.leadingAnchor, constant: 20),

            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            forgotPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
        ])
    }
    
    // MARK:- Helpers
    

}

