//
//  SettingsController.swift
//  SideBarMenuLikeAPro
//
//  Created by Paolo Prodossimo Lopes on 21/09/21.
//

import UIKit

class SettingsController: UIViewController {
    
    //MARK: - Properties:
    
    
    
    //MARK: - Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers:
    
    func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Settings"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .darkGray
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark")?.withTintColor(.white, renderingMode: .alwaysOriginal),
                                                           style: .plain, target: self, action: #selector(dismisalHandler))
    }
    
    //MARK: - Selectors:
    
    @objc func dismisalHandler() {
        dismiss(animated: true, completion: nil)
    }
}
