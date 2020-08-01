//
//  ModalNavigationBar.swift
//  events-app
//
//  Created by Bruno Rocha on 28/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit
import TinyConstraints

class ModalNavigationBar: UIView {
    let titleLabel = ParagraphLabel()

    let closeButton: UIButton = {
        let button = UIButton()
        let closeIcon = Iconography.close.toUIImage
        button.setImage(closeIcon, for: .normal)
        button.width(20)
        button.height(20)

        return button
    }()

    let borderBottom: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightGray.toUIColor
        view.height(1)
        return view
    }()

    var title: String? = nil {
        didSet {
            titleLabel.text = title
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView () {
        backgroundColor = .white
        height(48)
    }
    
    private func setupSubviews () {
        addSubview(titleLabel)
        addSubview(closeButton)
        addSubview(borderBottom)

        titleLabel.font = Typography.label.toUIFont

        titleLabel.centerInSuperview()

        closeButton.centerYToSuperview()
        closeButton.rightToSuperview(offset: -20)

        borderBottom.leftToSuperview()
        borderBottom.rightToSuperview()
        borderBottom.bottomToSuperview()
    }
}
