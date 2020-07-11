//
//  EventDetailsViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 10/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class EventDetailsViewController: BaseViewController {
    private let eventDetailsView = EventDetailsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Evento"
    }

    override func loadView() {
        view = eventDetailsView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
