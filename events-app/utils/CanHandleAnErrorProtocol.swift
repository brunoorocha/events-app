//
//  CanHandleAnErrorProtocol.swift
//  events-app
//
//  Created by Bruno Rocha on 05/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import Foundation

protocol CanHandleAnError {
    func onError (_ error: Error)
}
