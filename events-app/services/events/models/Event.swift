//
//  Event.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import Foundation

struct Event: Decodable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let latitude: Int
    let longitude: Int
    let price: Double
    let cupons: [Cupom]
}
