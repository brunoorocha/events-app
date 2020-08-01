//
//  EventCellViewModel.swift
//  events-app
//
//  Created by Bruno Rocha on 07/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import Foundation

struct EventViewModel {
    let title: String
    let imageUrl: String
    let price: String
    let date: String
    var latitude: Double
    var longitude: Double
    let description: String

    let event: Event

    init (fromEvent event: Event) {
        self.event = event
        title = event.title
        imageUrl = event.image
        price = CurrencyFormatter.format(event.price)
        date = DateFormatterUtils.format(event.date)
        description = event.description
        latitude = event.latitude
        longitude = event.longitude
    }
}

