//
//  MenuController.swift
//  SideBarMenuLikeAPro
//
//  Created by Paolo Prodossimo Lopes on 21/09/21.
//

import UIKit

private let MENU_OPTION_IDENTIFIER_CELL = "MenuOptionCell"

class MenuController: UIViewController {
    
    //MARK: - Properties:
    
    var delegate: HomeControllerDelegate?
    
    var tableView: UITableView!
    
    //MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .darkGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    //MARK: - Helpers
    
    func configureTableView() {
        tableView = UITableView()
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        tableView.backgroundColor = .darkGray
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: MENU_OPTION_IDENTIFIER_CELL)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width * 0.25)).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    //MARK: - Selectors:
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MENU_OPTION_IDENTIFIER_CELL, for: indexPath) as! MenuOptionCell
        let menuOption = MenuOptions(rawValue: indexPath.row)
        
        cell.descriptionLabel.text = menuOption?.descriptionLabel
        cell.imageView?.image = menuOption?.image?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = MenuOptions(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOptions: menu)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
