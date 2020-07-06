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
    
    var toUIFont: UIFont {
        switch self {
        case .heading1:
            return UIFont(name: "Poppins-Bold", size: 32) ?? UIFont.boldSystemFont(ofSize: 32)
        }
    }
}
