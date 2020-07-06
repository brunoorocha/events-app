//
//  RoundedCornersImageView.swift
//  events-app
//
//  Created by Bruno Rocha on 06/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class RoundedCornersImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customize () {
        backgroundColor = Colors.lightGray.toUIColor
        layer.cornerRadius = 16
        clipsToBounds = true
    }
}
