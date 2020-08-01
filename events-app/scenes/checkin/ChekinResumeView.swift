//
//  ChekinResumeView.swift
//  events-app
//
//  Created by Bruno Rocha on 01/08/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class CheckinResumeView: UIView {
    lazy var titleLabel = Heading3Label()
    lazy var priceLabel = ParagraphLabel()
    lazy var discountLabel = ParagraphLabel()
    lazy var totalLabel = ParagraphLabel()

    lazy var priceValueLabel = ParagraphLabel()
    lazy var discountValueLabel = ParagraphLabel()
    lazy var totalValueLabel = ParagraphLabel()

    lazy var borderTop = HorizontalSeparator()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView () {
        backgroundColor = Colors.background.toUIColor
    }

    private func setupSubviews () {
        addSubview(borderTop)
        addSubview(titleLabel)

        addSubview(priceLabel)
        addSubview(discountLabel)
        addSubview(totalLabel)

        addSubview(priceValueLabel)
        addSubview(discountValueLabel)
        addSubview(totalValueLabel)

        borderTop.leftToSuperview()
        borderTop.rightToSuperview()
        borderTop.topToSuperview()
        
        titleLabel.topToSuperview(offset: 24)
        titleLabel.leftToSuperview(offset: 20)
        titleLabel.rightToSuperview(offset: -20)
        
        priceLabel.topToBottom(of: titleLabel, offset: 20)
        priceLabel.left(to: titleLabel)
        priceLabel.rightToLeft(of: priceValueLabel, offset: -20, relation: .equalOrLess)

        priceValueLabel.top(to: priceLabel)
        priceValueLabel.rightToSuperview(offset: -20)

        discountLabel.topToBottom(of: priceLabel, offset: 10)
        discountLabel.left(to: titleLabel)
        discountLabel.rightToLeft(of: discountValueLabel, offset: -20, relation: .equalOrLess)
        
        discountValueLabel.top(to: discountLabel)
        discountValueLabel.rightToSuperview(offset: -20)

        totalLabel.topToBottom(of: discountLabel, offset: 10)
        totalLabel.left(to: titleLabel)
        totalLabel.rightToLeft(of: totalValueLabel, offset: -20, relation: .equalOrLess)

        totalValueLabel.top(to: totalLabel)
        totalValueLabel.rightToSuperview(offset: -20)

        bottom(to: totalLabel, offset: 32)

        titleLabel.text = "Resumo"
        priceLabel.text = "Preço:"
        discountLabel.text = "Desconto:"
        totalLabel.text = "Total:"
        
        priceValueLabel.text = "R$ 29,99"
        discountValueLabel.text = "-R$ 7,00"
        totalValueLabel.text = "R$ 22,99"

        discountValueLabel.textColor = Colors.textLight.toUIColor
        totalValueLabel.textColor = Colors.primary.toUIColor
        totalValueLabel.font = Typography.label.toUIFont
    }
}
