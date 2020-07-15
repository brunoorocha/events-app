//
//  EventCoverView.swift
//  events-app
//
//  Created by Bruno Rocha on 15/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class EventCoverView: UIView {
    lazy var coverImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = Colors.lightGray.toUIColor
        return image
    }()

    lazy var gradientOverlayView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        ]

        return gradientLayer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews () {
        addSubview(coverImageView)
        addSubview(gradientOverlayView)
        
        coverImageView.edgesToSuperview()

        gradientOverlayView.topToSuperview()
        gradientOverlayView.leftToSuperview()
        gradientOverlayView.rightToSuperview()
        gradientOverlayView.heightToSuperview(multiplier: 0.4)

        gradientOverlayView.layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
    }

    private func updateGradientFrame () {
        gradientLayer.frame = gradientOverlayView.bounds
    }
}
