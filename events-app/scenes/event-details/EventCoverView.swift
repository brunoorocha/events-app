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
    
    
    var heightConstraint: NSLayoutConstraint?
    var coverImageHeightConstraint: NSLayoutConstraint?
    var coverImageBottomConstraint: NSLayoutConstraint?

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
        
        coverImageView.leftToSuperview()
        coverImageView.rightToSuperview()

        coverImageHeightConstraint = coverImageView.heightToSuperview()
        coverImageBottomConstraint = coverImageView.bottomToSuperview()

        coverImageHeightConstraint?.isActive = true
        coverImageBottomConstraint?.isActive = true

        gradientOverlayView.top(to: coverImageView)
        gradientOverlayView.leftToSuperview()
        gradientOverlayView.rightToSuperview()
        gradientOverlayView.heightToSuperview(multiplier: 0.5)

        gradientOverlayView.layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
    }

    private func updateGradientFrame () {
        gradientLayer.frame = gradientOverlayView.bounds
    }

    func stretchWhenScroll (_ scrollView: UIScrollView) {
        guard let heightConstraint = heightConstraint,
            let coverImageBottomConstraint = coverImageBottomConstraint,
            let coverImageHeightConstraint = coverImageHeightConstraint else {
            return
        }

        let offsetY = scrollView.contentOffset.y
        let contentInsetTop = scrollView.contentInset.top
        let headerOffset = -(offsetY + contentInsetTop)
        let parallaxFactor: CGFloat = 0.5

        heightConstraint.constant = contentInsetTop
        clipsToBounds = headerOffset <= 0

        coverImageBottomConstraint.constant = headerOffset >= 0 ? 0 : -headerOffset * parallaxFactor
        coverImageHeightConstraint.constant = max(headerOffset, contentInsetTop)
    }
}
