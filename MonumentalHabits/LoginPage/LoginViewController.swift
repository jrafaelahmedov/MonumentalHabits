//
//  LoginViewController.swift
//  MonumentalHabits
//
//  Created by Rafael Ahmedov on 13.08.21.
//

import UIKit

class LoginViewController : UIViewController {
    
    // MARK:- Properties

    var scrollView: UIScrollView = {
         let v = UIScrollView()
         v.translatesAutoresizingMaskIntoConstraints = false
         v.bounces = v.contentOffset.y > 100
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
    
    let backgroundImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: Utils.splash_screen)!)
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
        label.font = UIFont(name: "Klasik-Regular", size: 32)
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
        let email = CustomTextField(icon: UIImage(named: Utils.unselectedEmailIcon)!, selectedIcon: UIImage(named: Utils.selectedEmailIcon)!, placeholder: "Email",backColor: UIColor(named: Utils.milkColor)!,isSecure: false)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.layer.cornerRadius = 12
        return email
    }()

    let passwordField : CustomTextField = {
        let password = CustomTextField(icon: UIImage(named: Utils.unselectedPasswordIcon)!, selectedIcon: UIImage(named: Utils.selectedPasswordIcon)!, placeholder: "Password",backColor: UIColor(named: Utils.milkColor)!,isSecure: true)
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

    let signUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don’t have an account? Sign up"
        label.font = UIFont(name: "Manrope-Medium", size: 14)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.attributedText = label.text?.attributedStringWithFont(["Sign", "up"], font: UIFont(name: "Manrope-Bold", size: 14)!, color: UIColor(named: Utils.selectedIndicatorColor)!)
        return label
    }()
    
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
        setupView()
        setupConstraints()
    }

    
    // MARK:- Setups
    
    func setupView(){
        contentView.addSubview(backgroundImage)
        contentView.addSubview(questionImage)
        contentView.addSubview(gradientImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(googleButton)
        continueWidthButtons.addArrangedSubview(googleButton)
        continueWidthButtons.addArrangedSubview(facebookButton)
        contentView.addSubview(continueWidthButtons)
        contentView.addSubview(uiBottomView)
        contentView.addSubview(line)
        contentView.addSubview(titleLogin)
        loginAndPasswordFieldStack.addArrangedSubview(emailField)
        loginAndPasswordFieldStack.addArrangedSubview(passwordField)
        contentView.addSubview(loginAndPasswordFieldStack)
        contentView.addSubview(loginButton)
        contentView.addSubview(forgotPasswordLabel)
        contentView.addSubview(signUpLabel)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        signUpLabel.isUserInteractionEnabled = true
        signUpLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(getSignUp)))
        forgotPasswordLabel.isUserInteractionEnabled = true
        forgotPasswordLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(getForgotPass)))
        
        loginButton.isUserInteractionEnabled = true
        loginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(getHomePage)))
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
            
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
        
            questionImage.heightAnchor.constraint(equalToConstant: 44),
            questionImage.widthAnchor.constraint(equalToConstant: 44),
            questionImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topSafeAreaHeight),
            questionImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            gradientImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.85),
            gradientImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            gradientImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            gradientImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: gradientImage.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: gradientImage.centerYAnchor,constant: -40),
            
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            continueWidthButtons.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            continueWidthButtons.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            continueWidthButtons.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
            uiBottomView.topAnchor.constraint(equalTo: continueWidthButtons.bottomAnchor, constant: 25),
            uiBottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            uiBottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            uiBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            titleLogin.topAnchor.constraint(equalTo: uiBottomView.topAnchor, constant: 12),
            titleLogin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            titleLogin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            titleLogin.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            line.topAnchor.constraint(equalTo: uiBottomView.topAnchor, constant: 48),
            line.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            line.heightAnchor.constraint(equalToConstant: 1),
    
    
            emailField.heightAnchor.constraint(equalToConstant: 56),

            passwordField.heightAnchor.constraint(equalToConstant: 56),
            
            loginAndPasswordFieldStack.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 16),

            loginAndPasswordFieldStack.leadingAnchor.constraint(equalTo:
                                                                    contentView.leadingAnchor, constant: 20),

            loginAndPasswordFieldStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: loginAndPasswordFieldStack.bottomAnchor, constant: 20),
            
            loginButton.leadingAnchor.constraint(equalTo:
                                                    contentView.leadingAnchor, constant: 20),

            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            forgotPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpLabel.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 10),
            signUpLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    // MARK:- Helpers
    
    
    @objc func getSignUp() {
        let viewController = SignUpViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func getForgotPass() {
        let viewController = ForgotPasswordViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func getHomePage(){
//        let navigationController = UINavigationController(rootViewController: MainViewController())
//           let window = UIApplication.shared.windows[0]
//           window.rootViewController = navigationController
//           window.makeKeyAndVisible()
        
        let viewController = MainViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func backAction(){
        print("Back pressed")
    }
}


extension String {
    func attributedStringWithFont(_ strings: [String], font: UIFont,color: UIColor ,characterSpacing: UInt? = nil) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for string in strings {
            let range = (self as NSString).range(of: string)
            let attributted:[NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: color
            ]
            attributedString.addAttributes(attributted, range: range)
        }
        guard let characterSpacing = characterSpacing else {return attributedString}
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
}
