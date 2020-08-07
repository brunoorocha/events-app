//
//  CheckinSuccessView.swift
//  events-app
//
//  Created by Bruno Rocha on 03/08/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class CheckinSuccessView: BaseScreenView {
    lazy var successIcon: UIImageView = {
        let imageView = UIImageView(image: Iconography.success.toUIImage)
        imageView.width(120)
        imageView.height(120)

        return imageView
    }()

    lazy var okButton = Button()

    lazy var messageLabel = Heading2Label()

    override func setupSubviews () {
        addSubview(successIcon)
        addSubview(messageLabel)
        addSubview(okButton)

        successIcon.centerXToSuperview()
        successIcon.centerYToSuperview(offset: -60)

        messageLabel.topToBottom(of: successIcon, offset: 40)
        messageLabel.centerXToSuperview()

        messageLabel.textColor = Colors.primary.toUIColor
        messageLabel.text = "Você está inscrito!"

        okButton.leftToSuperview()
        okButton.rightToSuperview()
        okButton.bottomToSuperview()

        okButton.setTitle("OK", for: .normal)
    }
}
