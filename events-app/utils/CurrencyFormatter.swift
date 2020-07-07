//
//  CurrencyFormatter.swift
//  events-app
//
//  Created by Bruno Rocha on 07/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import Foundation

struct CurrencyFormatter {
    static func format (_ number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "pt_BR")

        guard let formattedPrice = numberFormatter.string(from: number as NSNumber) else {
            return "R$ 0,00"
        }
        
        return formattedPrice
    }
}
