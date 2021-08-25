//
//  HomeViewController.swift
//  MonumentalHabits
//
//  Created by Rafael on 23.08.21.
//

import UIKit

class HomeViewController : UITabBarController{
    
    
    
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
    
    let hamburgerImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "hamburger_menu_icon"), for: .normal)
        return button
    }()
    
    let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "Homepage"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = label.text!.capitalized
        label.font = UIFont(name: "Manrope-Bold", size: 18)
        label.textColor = UIColor(named: Utils.selectedIndicatorColor)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    
    let profileImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: Utils.profile_photo)!)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 22
        return image
    }()
    
    
    let homeImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: Utils.home_view_image)!)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        return image
    }()

    
    let stackDays: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8.0
        return stackView
    }()
    
    var weekDays : [CustomWeekDayHomePage] = []
    var days: [String] = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]
    
    
    
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backAction))
        generateLabels()
        setupView()
        setupConstraints()
    }
    
    
    //MARK:- Setups
    
    func generateLabels() {
        for index in 0...6 {
            let weekDay: CustomWeekDayHomePage = {
                let day = CustomWeekDayHomePage(day: "\(index+1)", week: days[index])
                day.translatesAutoresizingMaskIntoConstraints = false
                return day
            }()
            weekDays.append(weekDay)
        }
    }
    
    
    func setupView(){
       contentView.addSubview(hamburgerImage)
       contentView.addSubview(homeLabel)
       contentView.addSubview(profileImage)
        contentView.addSubview(homeImage)
        
       view.addSubview(scrollView)
       scrollView.addSubview(contentView)
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

            hamburgerImage.heightAnchor.constraint(equalToConstant: 50),
            hamburgerImage.widthAnchor.constraint(equalToConstant: 50),
            hamburgerImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20+topSafeAreaHeight),
            hamburgerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            
            homeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20 + topSafeAreaHeight),
            homeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            homeLabel.centerYAnchor.constraint(equalTo: hamburgerImage.centerYAnchor),
            
            
            profileImage.heightAnchor.constraint(equalToConstant: 44),
            profileImage.widthAnchor.constraint(equalToConstant: 44),

            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20+topSafeAreaHeight),
            profileImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            homeImage.topAnchor.constraint(equalTo: homeLabel.bottomAnchor, constant: 30),
            
            homeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            homeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            homeImage.heightAnchor.constraint(equalToConstant: 145),
            
            
        ])
    }
    
    //MARK:- Utils
    
    @objc func backAction(){
        print("Back pressed")
    }
    

    
}
