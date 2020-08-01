//
//  CheckinView.swift
//  events-app
//
//  Created by Bruno Rocha on 28/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit
import TinyConstraints

class ChekinView: BaseScreenView {
    let navigationBar = ModalNavigationBar()

    override func setupSubviews() {
        addSubview(navigationBar)

        navigationBar.title = "Checkin"
        navigationBar.topToSuperview()
        navigationBar.leftToSuperview()
        navigationBar.rightToSuperview()
    }
}
