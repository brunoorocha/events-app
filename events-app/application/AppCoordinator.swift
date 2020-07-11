//
//  AppCoordinator.swift
//  events-app
//
//  Created by Bruno Rocha on 10/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

class AppCoordinator: Coordinator<Void> {
    var window: UIWindow
    
    init (window: UIWindow) {
        self.window = window
    }

    override func start() -> Observable<Void> {
        let navigationController = BaseNavigationController()
        let eventsCoordinator = EventsCoordinator(navigationController: navigationController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return coordinate(to: eventsCoordinator)
    }
}
