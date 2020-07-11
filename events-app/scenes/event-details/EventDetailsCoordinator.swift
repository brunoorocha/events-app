//
//  EventDetailsCoordinator.swift
//  events-app
//
//  Created by Bruno Rocha on 10/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

class EventDetailsCoordinator: Coordinator<Void> {
    var navigationController: UINavigationController?
    
    init (navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    override func start() -> Observable<Void> {
        let eventDetailsViewController = EventDetailsViewController()
        navigationController?.pushViewController(eventDetailsViewController, animated: true)
        return Observable.never()
    }
}
