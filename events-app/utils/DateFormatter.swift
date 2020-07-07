//
//  DateFormatter.swift
//  events-app
//
//  Created by Bruno Rocha on 07/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import Foundation

struct DateFormatterUtils {
    static func format (_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
