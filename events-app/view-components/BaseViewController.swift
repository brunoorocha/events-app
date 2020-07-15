//
//  BaseViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, CanHandleAnError {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.backgroundColor = Colors.background.toUIColor
        navigationController?.navigationBar.tintColor = Colors.primary.toUIColor
        navigationController?.interactivePopGestureRecognizer?.delegate = self

        if let viewControllersCount = navigationController?.viewControllers.count {
            navigationItem.leftBarButtonItem = viewControllersCount > 1
                ? UIBarButtonItem(image: Iconography.arrowBack.toUIImage, style: .plain, target: self, action: #selector(navigateBack))
                : nil
            navigationItem.hidesBackButton = true
        }

        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: Typography.heading4.toUIFont
        ]
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: Typography.heading1.toUIFont
        ]

        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @objc private func navigateBack () {
        navigationController?.popViewController(animated: true)
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {}
