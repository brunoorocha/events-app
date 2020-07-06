//
//  UIViewController+presentAlertController.swift
//  events-app
//
//  Created by Bruno Rocha on 05/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//


import UIKit

extension UIViewController {
    func presentAlertController (withTitle title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
//        action.setValue(AppStyleGuide.Colors.pink.uiColor, forKey: "titleTextColor")
        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
}
