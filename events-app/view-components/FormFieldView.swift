//
//  FormFieldView.swift
//  events-app
//
//  Created by Bruno Rocha on 01/08/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class FormFieldView: UIView {
    lazy var label = Heading4Label()
    lazy var bottomBorder = HorizontalSeparator()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = Typography.paragraph.toUIFont
        return textField
    }()

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
        addSubview(label)
        addSubview(textField)
        addSubview(bottomBorder)

        label.topToSuperview(offset: 20)
        label.leftToSuperview(offset: 20)
        label.rightToSuperview(offset: -20)
        
        textField.topToBottom(of: label, offset: 10)
        textField.left(to: label)
        textField.right(to: label)

        bottomBorder.topToBottom(of: textField, offset: 20)
        bottomBorder.leftToSuperview()
        bottomBorder.rightToSuperview()

        bottom(to: bottomBorder)
    }
}
