//
//  MenuOptions.swift
//  SideBarMenuLikeAPro
//
//  Created by Paolo Prodossimo Lopes on 21/09/21.
//

import UIKit

enum MenuOptions: Int, CaseIterable {
    case profile
    case inbox
    case notifications
    case settings
    
    var descriptionLabel: String {
        switch self {
        case .profile: return "Profile"
        case .inbox: return "Inbox"
        case .notifications: return "notifications"
        case .settings: return "Settings"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .profile: return UIImage(systemName: "person.crop.circle") ?? UIImage()
        case .inbox: return UIImage(systemName: "at") ?? UIImage()
        case .notifications: return UIImage(systemName: "checkmark") ?? UIImage()
        case .settings: return UIImage(systemName: "gearshape") ?? UIImage()
        }
    }
}
