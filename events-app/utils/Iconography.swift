//
//  Iconography.swift
//  events-app
//
//  Created by Bruno Rocha on 14/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

enum Iconography {
    case calendar
    case location
    case info
    
    var toUIImage: UIImage? {
        switch self {
        case .calendar:
            return UIImage(named: "calendar_icon")
        case .location:
            return UIImage(named: "location_icon")
        case .info:
            return UIImage(named: "info_icon")
        }
    }
}
