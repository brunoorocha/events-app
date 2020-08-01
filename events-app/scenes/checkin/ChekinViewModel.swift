//
//  ChekinViewModel.swift
//  events-app
//
//  Created by Bruno Rocha on 28/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

class CheckinViewModel {
    let event: Event

    let didDismiss = PublishSubject<Void>()

    init (event: Event) {
        self.event = event
    }
}
