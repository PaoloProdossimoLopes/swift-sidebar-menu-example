//
//  ContainerController.swift
//  SideBarMenuLikeAPro
//
//  Created by Paolo Prodossimo Lopes on 21/09/21.
//

import UIKit

class ContainerController: UIViewController {
    
    //MARK: - Properties:
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded: Bool = false
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    //MARK: - Helpers
    
    func configure() {
        configureHomeController()
    }
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controller")
        }
    }
    
    func showMenuController(shouldExpand: Bool, menuOption: MenuOptions?) {
        if shouldExpand {
            //show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.centerController.view.frame.origin.x = (self.centerController.view.frame.width - 80)
            }
            
        } else {
            //hide menu
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.centerController.view.frame.origin.x = 0
            } completion: { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOptions(menuOptions: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func didSelectMenuOptions(menuOptions: MenuOptions) {
        switch menuOptions {
        case .profile:
            print("Show profile")
        case .inbox:
            print("Show inbox")
        case .notifications:
            print("Show notifications")
        case .settings:
            print("Show setting")
            showSettingsController()
        }
    }
    
    func showSettingsController() {
        let controller = SettingsController()
        controller.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.setNeedsStatusBarAppearanceUpdate()
        } completion: { (_) in }

    }
    
    //MARK: - Selectors:
    
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOptions menuOption: MenuOptions?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded //similar a toggle()
        showMenuController(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
