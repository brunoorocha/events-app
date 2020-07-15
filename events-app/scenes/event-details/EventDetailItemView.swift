//
//  EventDetailItemView.swift
//  events-app
//
//  Created by Bruno Rocha on 14/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class EventDetailItemView: UIView {
    let titleLabel = Heading5Label()
    let descriptionLabel = ParagraphLabel()
    let iconView = IconView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews () {
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)

        iconView.topToSuperview()
        iconView.leftToSuperview(offset: 20)
        
        titleLabel.topToSuperview()
        titleLabel.leftToRight(of: iconView, offset: 20)
        titleLabel.rightToSuperview(offset: -20)
        
        descriptionLabel.topToBottom(of: titleLabel, offset: 4)
        descriptionLabel.left(to: titleLabel)
        descriptionLabel.right(to: titleLabel)

        bottom(to: descriptionLabel)
    }
}
