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

    override func setupSubviews () {
        addSubview(scrollView)
        scrollView.addSubview(stackView)

        scrollView.edgesToSuperview()
        stackView.edgesToSuperview(insets: .init(top: 0, left: 0, bottom: 40, right: 0))

        headerView.eventNameLabel.text = "Feira de adoção de animais"
        headerView.priceLabel.text = "R$ 29,99"
        
        dateItem.descriptionLabel.text = "28/08/2018"
        locationItem.descriptionLabel.text = "Avenida José Bonifácio, Porto Alegre, Rio Grande do Sul."
        descriptionItem.descriptionLabel.text = """
        O Patas Dadas estará na Redenção, nesse domingo, com cães para adoção e produtos à venda! Na ocasião, teremos bottons, bloquinhos e camisetas! Traga seu Pet, os amigos e o chima, e venha aproveitar esse dia de sol com a gente e com alguns de nossos peludinhos - que estarão prontinhos para ganhar o ♥ de um humano bem legal pra chamar de seu. Aceitaremos todos os tipos de doação:\n- guias e coleiras em bom estado\n- ração (as que mais precisamos no momento são sênior e filhote)\n- roupinhas \n- cobertas \n- remédios dentro do prazo de validade
        """

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
