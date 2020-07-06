//
//  Colors.swift
//  events-app
//
//  Created by Bruno Rocha on 06/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

enum Colors {
    case primary
    case text
    case textLight
    case lightGray
    case mediumGray
    case background
    
    var toUIColor: UIColor {
        switch self {
        case .primary:
            return UIColor.rgba(76, 175, 80)
        case .text:
            return UIColor.rgba(0, 0, 0)
        case .textLight:
            return UIColor.rgba(153, 153, 153)
        case .lightGray:
            return UIColor.rgba(229, 229, 229)
        case .mediumGray:
            return UIColor.rgba(204, 204, 204)
        case .background:
            return UIColor.white
        }
    }
}
