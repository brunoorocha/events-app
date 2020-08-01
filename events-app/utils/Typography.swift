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
    case heading2
    case heading3
    case heading4
    case heading5
    case paragraph
    case label
    case small

    var toUIFont: UIFont {
        switch self {
        case .heading1:
            return UIFont(name: "Poppins-Bold", size: 32) ?? UIFont.boldSystemFont(ofSize: 32)
        case .heading2:
            return UIFont(name: "Poppins-Bold", size: 24) ?? UIFont.boldSystemFont(ofSize: 24)
        case .heading3:
            return UIFont(name: "Poppins-SemiBold", size: 20) ?? UIFont.boldSystemFont(ofSize: 20)
        case .heading4:
            return UIFont(name: "Poppins-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)
        case .heading5:
            return UIFont(name: "Poppins-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12)
        case .paragraph:
            return UIFont(name: "Poppins-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
        case .label:
            return UIFont(name: "Poppins-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16)
        case .small:
            return UIFont(name: "Poppins-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12)
        }
    }
}
