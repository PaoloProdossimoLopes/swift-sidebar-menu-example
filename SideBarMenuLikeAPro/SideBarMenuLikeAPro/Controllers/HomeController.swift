//
//  HomeController.swift
//  SideBarMenuLikeAPro
//
//  Created by Paolo Prodossimo Lopes on 21/09/21.
//

import UIKit

class HomeController: UIViewController {
    //MARK: - Properties:
    
    var delegate: HomeControllerDelegate?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    //MARK: - Helpers
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        navigationItem.title = "Side Menu"
        
        let image = UIImage(systemName: "list.bullet")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image,
            style: .done, target: self, action: #selector(handleMenuToggle))
    }
    
    //MARK: - Selectors:
    
    @objc func handleMenuToggle() {
        print("Toggle menu")
        delegate?.handleMenuToggle(forMenuOptions: nil)
    }
}
