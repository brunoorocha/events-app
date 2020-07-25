//
//  EventCellViewModel.swift
//  events-app
//
//  Created by Bruno Rocha on 07/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import Foundation

struct EventViewModel {
    let id: String
    let title: String
    let imageUrl: String
    let price: String
    let date: String
    let location: String
    let description: String

    init (fromEvent event: Event) {
        id = event.id
        title = event.title
        imageUrl = event.image
        price = CurrencyFormatter.format(event.price)
        date = DateFormatterUtils.format(event.date)
        description = event.description
        location = ""
    }
}

