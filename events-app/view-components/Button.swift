//
//  Button.swift
//  events-app
//
//  Created by Bruno Rocha on 26/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class Button: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }

    override var isEnabled: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.backgroundColor = self.isEnabled ? Colors.primary.toUIColor : Colors.mediumGray.toUIColor
                self.layer.shadowOpacity = self.isEnabled ? 0.15 : 0
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customize () {
        backgroundColor = Colors.primary.toUIColor
        setTitleColor(.white, for: .normal)
        titleLabel?.font = Typography.label.toUIFont
        layer.shadowColor = UIColor.rgba(0, 0, 0).cgColor
        layer.shadowOpacity = 0.15
        layer.shadowRadius = 20
        layer.shadowOffset = CGSize(width: 0, height: 4)
        height(64)
    }
}
