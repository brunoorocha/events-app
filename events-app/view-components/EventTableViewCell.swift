//
//  EventTableViewCell.swift
//  events-app
//
//  Created by Bruno Rocha on 06/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit
import TinyConstraints

class EventTableViewCell: UITableViewCell {
    let coverImageView = RoundedCornersImageView(frame: .zero)
    let titleLabel = Heading4Label()
    let priceLabel = Heading4Label()
    let dateLabel = SmallLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell () {
        selectionStyle = .none
    }
    
    private func setupSubviews () {
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(dateLabel)

        coverImageView.topToSuperview(offset: 8)
        coverImageView.leftToSuperview(offset: 20)
        coverImageView.rightToSuperview(offset: -20)
        coverImageView.height(140)

        titleLabel.topToBottom(of: coverImageView, offset: 10)
        titleLabel.leftToSuperview(offset: 20)
        titleLabel.rightToLeft(of: priceLabel, offset: -20, relation: .equalOrLess, priority: .required)

        priceLabel.textColor = Colors.primary.toUIColor
        priceLabel.top(to: titleLabel)
        priceLabel.rightToSuperview(offset: -20)

        dateLabel.textColor = Colors.textLight.toUIColor
        dateLabel.topToBottom(of: titleLabel, offset: 4)
        dateLabel.bottom(to: contentView, offset: -20)
        dateLabel.left(to: titleLabel)
        dateLabel.width(100)
        dateLabel.height(18)
    }
}
