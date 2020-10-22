//
//  SelectedGameTabBarViewController.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import UIKit

protocol SelectedGameTabBarView: BaseView {
    var onGoBack: (() -> Void)? { get set }
    var selectedGame: SheduledGame! { get set }
}

class SelectedGameTabBarViewController: UITabBarController, SelectedGameTabBarView {
    private enum Constants {
        //Navigation controller
        static let navigationTitle = "MozzartTest".localized
        
        //Tabbar
        static let tabbarInactiveColor = UIColor.tabbarInactive
        static let tabbarSelectedColor = UIColor.tabbarSelected
        
        static let firstItemTitle = "SelectedGameTab.Talon".localized
        static let firstItemImage = UIImage(named: "tabTalon")
        
        static let secondItemTitle = "SelectedGameTab.Rezultati".localized
        static let secondItemImage = UIImage(named: "tabRezultati")
        
        static let thirdItemTitle = "SelectedGameTab.Izvlacenje".localized
        static let thirdItemImage = UIImage(named: "tabPrikazIzvlacenja")
    }
    
    var selectedGame: SheduledGame!
    var onGoBack: (() -> Void)?
    var viewModel: ViewModelSelectedGameTabBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.bottom
        setupViews()
        
    }
    
    //TODO:- Fix this
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}

//MARK:- UIViewStyling
extension SelectedGameTabBarViewController: UIViewStyling {
    func setupViews() {
        self.navigationItem.title = Constants.navigationTitle

        self.tabBar.unselectedItemTintColor = Constants.tabbarInactiveColor
        self.tabBar.tintColor = Constants.tabbarSelectedColor
    
        viewModel = ViewModelSelectedGameTabBar(selectedGame)
        self.viewControllers = viewModel.viewControllers
        self.setTabbarItems()
    }
    
     
    //TODO:- Make extension for adding image trough enum
    private func setTabbarItems() {
        let tabBarItems = tabBar.items! as [UITabBarItem]
        tabBarItems[0].title = Constants.firstItemTitle
        tabBarItems[0].image = Constants.firstItemImage
        
        tabBarItems[1].title = Constants.secondItemTitle
        tabBarItems[1].image = Constants.secondItemImage
        
        tabBarItems[2].title = Constants.thirdItemTitle
        tabBarItems[2].image = Constants.thirdItemImage
    }
   
}
