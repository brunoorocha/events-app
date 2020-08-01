//
//  HorizontalSeparator.swift
//  events-app
//
//  Created by Bruno Rocha on 01/08/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class HorizontalSeparator: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView () {
        backgroundColor = Colors.lightGray.toUIColor
        height(1)
    }
}
