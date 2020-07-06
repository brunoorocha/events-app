//
//  Typography.swift
//  events-app
//
//  Created by Bruno Rocha on 05/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

enum Typography {
    case heading1
    case heading3
    case paragraph
    case small
    
    var toUIFont: UIFont {
        switch self {
        case .heading1:
            return UIFont(name: "Poppins-Bold", size: 32) ?? UIFont.boldSystemFont(ofSize: 32)
        case .heading3:
            return UIFont(name: "Poppins-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)
        case .paragraph:
            return UIFont(name: "Poppins-Regular", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)
        case .small:
            return UIFont(name: "Poppins-Regular", size: 12) ?? UIFont.boldSystemFont(ofSize: 12)
        }
    }
}
