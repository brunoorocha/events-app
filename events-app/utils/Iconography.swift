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
    case arrowBack
    case imagePlaceholder
    case close
    case success

    var toUIImage: UIImage? {
        switch self {
        case .calendar:
            return UIImage(named: "calendar_icon")
        case .location:
            return UIImage(named: "location_icon")
        case .info:
            return UIImage(named: "info_icon")
        case .arrowBack:
            return UIImage(named: "arrow_back_icon")
        case .imagePlaceholder:
            return UIImage(named: "image_placeholder")
        case .close:
            return UIImage(named: "close_icon")
        case .success:
            return UIImage(named: "check_icon")
        }
    }
}
