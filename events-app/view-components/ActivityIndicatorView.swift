//
//  ActivityIndicatorView.swift
//  events-app
//
//  Created by Bruno Rocha on 06/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit
import TinyConstraints

class ActivityIndicatorView: UIView {
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews () {
        addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
        activityIndicator.color = Colors.mediumGray.toUIColor
    }
    
    func startAnimating () {
        activityIndicator.startAnimating()
    }

    func stopAnimating () {
        activityIndicator.stopAnimating()
    }
}
