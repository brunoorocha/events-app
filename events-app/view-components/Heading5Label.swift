//
//  Heading5Label.swift
//  events-app
//
//  Created by Bruno Rocha on 14/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class Heading5Label: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func customize () {
        translatesAutoresizingMaskIntoConstraints = false
        font = Typography.heading5.toUIFont
        textColor = Colors.text.toUIColor
        sizeToFit()
        numberOfLines = 0
    }
}



