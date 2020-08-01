//
//  EventHeaderView.swift
//  events-app
//
//  Created by Bruno Rocha on 14/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class EventHeaderView: UIView {
    let eventNameLabel = Heading2Label()
    let priceLabel = Heading3Label()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews () {
        addSubview(eventNameLabel)
        addSubview(priceLabel)

        eventNameLabel.topToSuperview(offset: 32)
        eventNameLabel.leftToSuperview(offset: 20)
        eventNameLabel.rightToSuperview(offset: -20)

        priceLabel.topToBottom(of: eventNameLabel, offset: 10)
        priceLabel.left(to: eventNameLabel)
        priceLabel.right(to: eventNameLabel)
        priceLabel.bottomToSuperview(offset: -40)

        priceLabel.textColor = Colors.primary.toUIColor
        backgroundColor = Colors.background.toUIColor
    }
}
