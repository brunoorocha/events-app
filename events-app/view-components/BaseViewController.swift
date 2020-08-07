//
//  BaseViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, CanHandleAnError {
    var shouldHideNavigationBarShadow = false {
        didSet {
            if (shouldHideNavigationBarShadow) {
                navigationController?.navigationBar.layer.shadowOpacity = 0
                return
            }

            navigationController?.navigationBar.layer.shadowOpacity = 1
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.backgroundColor = Colors.background.toUIColor
        navigationController?.navigationBar.tintColor = Colors.primary.toUIColor

        navigationController?.navigationBar.layer.shadowColor = Colors.lightGray.toUIColor.cgColor
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1)
        navigationController?.navigationBar.layer.shadowRadius = 0
        navigationController?.navigationBar.layer.shadowOpacity = shouldHideNavigationBarShadow ? 0 : 1
        navigationController?.navigationBar.shadowImage = UIImage()

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
        navigationItem.backBarButtonItem?.title = ""
    }

    @objc private func navigateBack () {
        navigationController?.popViewController(animated: true)
    }

    func onPopViewController () {}
}

extension BaseViewController: UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(fromViewController) else {
            return
        }

        if (fromViewController is BaseViewController) {
            onPopViewController()
        }
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
