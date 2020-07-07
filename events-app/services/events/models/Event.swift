//
//  Event.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import Foundation

struct Event: Decodable {
    let id: String
    let title: String
    let description: String
    let image: String
    let latitude: Double
    let longitude: Double
    let price: Double
    let cupons: [Cupom]
    let date: Date
}
