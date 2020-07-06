//
//  UIViewController+CanHandleAnError.swift
//  events-app
//
//  Created by Bruno Rocha on 05/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

extension CanHandleAnError where Self:UIViewController {
    func onError (_ error: Error) {
        guard let error = error as? NetworkErrors else {
            presentAlertController(withTitle: "Oops, algo de errado não está certo", message: "Desculpe, mas ocorreu um erro desconhecido", actionTitle: "Ok")
            return
        }

        presentAlertController(withTitle: "Oops, algo de errado não está certo", message: error.localizedDescription, actionTitle: "Ok")
    }
}

