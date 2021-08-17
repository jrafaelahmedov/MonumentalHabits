//
//  IntrodactionController.swift
//  MonumentalHabits
//
//  Created by Bob on 12.08.21.
//

import UIKit

class IntrodactionController : UIPageViewController {
    
    var pages = [UIViewController]()
    
    let skipButton = UIButton()
       let nextButton = UIButton()
    let getStartedButton = UIButton()
       let pageControl = UIPageControl()
       let initialPage = 0
    
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
          super.viewDidLoad()
          setup()
          style()
          layout()
      }
}


extension IntrodactionController {
        
        func setup() {
            dataSource = self
            delegate = self
            
            let string = "WE CAN HELP YOU TO BE A BETTER VERSION OF YOURSELF."

            let page1 = IntroductionPageController(imageName: "human_welcome_first_page",
                                                 titleText: "Welcome to Monumental habits",
                                                 descText: string)
            let page2 = IntroductionPageController(imageName: "human_intro_page_2",
                                                 titleText: "Create new \n habit easily",
                                                 descText: string)
            let page3 = IntroductionPageController(imageName: "human_page_3",
                                                 titleText: "Keep track of your progress",
                                                 descText: string)
            let page4 = IntroductionPageController(imageName: "human_page_4",
                                                 titleText: "Join a supportive community",
                                                 descText: string)
            
            pages.append(page1)
            pages.append(page2)
            pages.append(page3)
            pages.append(page4)
            
            
            
            setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        }
        
        func style() {
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            pageControl.currentPageIndicatorTintColor = UIColor(named: Utils.selectedIndicatorColor)
            pageControl.pageIndicatorTintColor = UIColor(named: Utils.orangeColor)
            pageControl.subviews.forEach {
                $0.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
            pageControl.numberOfPages = pages.count
            pageControl.currentPage = initialPage

            skipButton.translatesAutoresizingMaskIntoConstraints = false
            skipButton.setTitleColor(UIColor(named: Utils.selectedIndicatorColor), for: .normal)
            skipButton.setTitle("Skip", for: .normal)
            skipButton.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 17)
            skipButton.addTarget(self, action: #selector(skipTapped(_:)), for: .primaryActionTriggered)

            
            getStartedButton.translatesAutoresizingMaskIntoConstraints = false
            getStartedButton.setTitleColor(UIColor(named: Utils.selectedIndicatorColor), for: .normal)
            getStartedButton.setTitle("Get Started", for: .normal)
            getStartedButton.titleLabel?.font = UIFont(name: "Manrope-Bold", size: 17)
            getStartedButton.addTarget(self, action: #selector(getStarted(_:)), for: .primaryActionTriggered)
            getStartedButton.backgroundColor = UIColor(named: Utils.orangeColor)
            getStartedButton.layer.cornerRadius = 8
            
            
            nextButton.translatesAutoresizingMaskIntoConstraints = false
            nextButton.setTitleColor(UIColor(named: Utils.selectedIndicatorColor), for: .normal)
            nextButton.setTitle("Next", for: .normal)
            nextButton.titleLabel?.font =  UIFont(name: "Manrope-Bold", size: 17)
            nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .primaryActionTriggered)
        }
        
        func layout() {
            view.addSubview(pageControl)
            view.addSubview(nextButton)
            view.addSubview(skipButton)
            view.addSubview(getStartedButton)
            getStartedButton.isHidden = true
            NSLayoutConstraint.activate([
                getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
                
                getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
                
                getStartedButton.heightAnchor.constraint(equalToConstant: 60),
                
                pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
                pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
                skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
                nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
            ])
        }
    }

extension IntrodactionController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex == 0 {
            return nil            // wrap last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return pages.first              // wrap first
        }
    }
}

// MARK: - Delegates
extension IntrodactionController: UIPageViewControllerDelegate {
    
    // How we keep our pageControl in sync with viewControllers
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        pageControl.currentPage = currentIndex
        animateControlsIfNeeded()
    }
    
    private func animateControlsIfNeeded() {
        let lastPage = pageControl.currentPage == pages.count - 1
        if lastPage {
            self.isPagingEnabled = false
            hideControls()
        } else {
            showControls()
        }
    }
    
    private func hideControls() {
        getStartedButton.isHidden = false
        pageControl.isHidden = true
        skipButton.isHidden = true
        nextButton.isHidden = true
    }

    private func showControls() {
        getStartedButton.isHidden = true
        pageControl.isHidden = false
        skipButton.isHidden = false
        nextButton.isHidden = false
    }
}

// MARK: - Actions
extension IntrodactionController {

    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        animateControlsIfNeeded()
    }

    @objc func skipTapped(_ sender: UIButton) {
        let lastPageIndex = pages.count - 1
        pageControl.currentPage = lastPageIndex
        
        goToSpecificPage(index: lastPageIndex, ofViewControllers: pages)
        animateControlsIfNeeded()
    }
   
    @objc func getStarted(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: Utils.userDefaultsKey)
        let viewController = LoginViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func nextTapped(_ sender: UIButton) {
        pageControl.currentPage += 1
        goToNextPage()
        animateControlsIfNeeded()
    }
}

// MARK: - Extensions
extension UIPageViewController {

    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }
        guard let prevPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else { return }
        
        setViewControllers([prevPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
        
    }
}

extension UIPageViewController {
     var isPagingEnabled: Bool {
        get {
           var isEnabled: Bool = true
           for view in view.subviews {
               if let subView = view as? UIScrollView {
                   isEnabled = subView.isScrollEnabled
               }
           }
           return isEnabled
       }
       set {
           for view in view.subviews {
               if let subView = view as? UIScrollView {
                   subView.isScrollEnabled = newValue
               }
           }
       }
   }
}

