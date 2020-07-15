//
//  IconView.swift
//  events-app
//
//  Created by Bruno Rocha on 14/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class IconView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init () {
        self.init(image: nil)
    }

    private func setupView () {
        contentMode = .scaleAspectFit
        width(24)
        height(24)
    }
}
