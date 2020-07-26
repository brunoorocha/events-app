//
//  EventDetailsView.swift
//  events-app
//
//  Created by Bruno Rocha on 10/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class EventDetailsView: BaseScreenView {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()

    let itemsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 20
        return stackView
    }()

    lazy var dateItem: EventDetailItemView = {
        return createItemView(with: Iconography.calendar.toUIImage, andTitle: "DATA")
    }()

    lazy var locationItem: EventDetailItemView = {
        return createItemView(with: Iconography.location.toUIImage, andTitle: "LOCAL")
    }()

    lazy var descriptionItem: EventDetailItemView = {
        return createItemView(with: Iconography.info.toUIImage, andTitle: "DESCRIÇÃO")
    }()

    let headerView = EventHeaderView()
    let coverView = EventCoverView()
    
    var name: String? = nil {
        didSet {
            headerView.eventNameLabel.text = name
        }
    }

    var price: String? = nil {
        didSet {
            headerView.priceLabel.text = price
        }
    }
    
    var date: String? = nil {
        didSet {
            dateItem.descriptionLabel.text = date
        }
    }

    var address: String? = nil {
        didSet {
            locationItem.descriptionLabel.text = address
        }
    }

    var descriptionText: String? = nil {
        didSet {
            descriptionItem.descriptionLabel.text = descriptionText
        }
    }

    var coverImage: UIImage? = nil {
        didSet {
            coverView.coverImageView.showingImage(coverImage)
        }
    }

    override func setupSubviews () {
        addSubview(scrollView)
        scrollView.addSubview(stackView)

        scrollView.edgesToSuperview()
        stackView.edgesToSuperview(insets: .init(top: 0, left: 0, bottom: 40, right: 0))

        stackView.addArrangedSubview(coverView)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(itemsStackView)

        itemsStackView.addArrangedSubview(dateItem)
        itemsStackView.addArrangedSubview(locationItem)
        itemsStackView.addArrangedSubview(descriptionItem)

        itemsStackView.width(to: self)

        coverView.heightConstraint = coverView.height(to: self, multiplier: 0.4)
        coverView.heightConstraint?.isActive = true
        
    }

    private func createItemView (with iconImage: UIImage? = nil, andTitle title: String? = nil) -> EventDetailItemView {
        let item = EventDetailItemView()
        item.iconView.image = iconImage
        item.titleLabel.text = title
        return item
    }
}
