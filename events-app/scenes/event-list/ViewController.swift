//
//  ViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    let eventsView = EventsView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = eventsView
    }
}

