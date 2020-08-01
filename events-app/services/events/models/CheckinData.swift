//
//  CheckinData.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import Foundation

struct CheckinPayload: Encodable {
    let name: String
    let email: String
    let eventId: String
}
