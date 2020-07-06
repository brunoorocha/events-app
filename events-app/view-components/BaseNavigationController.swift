//
//  BaseNavigationController.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }

    fileprivate func configureNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .white
        navigationBarAppearance.shadowColor = nil
        navigationBarAppearance.shadowImage = nil

        navigationBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: Typography.heading1.toUIFont
        ]

        navigationBar.compactAppearance = navigationBarAppearance
        navigationBar.standardAppearance = navigationBarAppearance
        navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationBar.prefersLargeTitles = true
    }
}
