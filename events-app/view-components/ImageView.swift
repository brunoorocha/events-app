//
//  ImageView.swift
//  events-app
//
//  Created by Bruno Rocha on 24/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class ImageView: UIImageView {
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
        setupSubviews()
        showingPlaceholderImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init () {
        self.init(frame: .zero)
    }

    private func customize () {
        backgroundColor = Colors.lightGray.toUIColor
    }

    private func setupSubviews () {
        addSubview(imageView)
        imageView.edgesToSuperview()
    }

    func showingPlaceholderImage () {
        contentMode = .center
        image = Iconography.imagePlaceholder.toUIImage
    }

    func showingImage (_ image: UIImage?) {
        guard let image = image else {
            showingPlaceholderImage()
            return
        }

        imageView.alpha = 0
        imageView.image = image

        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.imageView.alpha = 1
        }
    }
}
