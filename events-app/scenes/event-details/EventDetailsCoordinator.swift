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
    let event: Event

    init (event: Event, navigationController: UINavigationController?) {
        self.navigationController = navigationController
        self.event = event
    }

    override func start() -> Observable<Void> {
        let eventsApiService = EventsApiService()
        let eventDetailsViewModel = EventDetailsViewModel(service: eventsApiService)
        let eventDetailsViewController = EventDetailsViewController(viewModel: eventDetailsViewModel)
        navigationController?.pushViewController(eventDetailsViewController, animated: true)

        eventDetailsViewModel.getEvent(withId: event.id)
        return Observable.never()
    }

    func coordinateToCheckin () -> Observable<Void> {
        let viewModel = CheckinViewModel(event: event)
        let checkinCoordinator = CheckinCoordinator(viewModel: viewModel, navigationController: navigationController)

        return coordinate(to: checkinCoordinator)
    }
}
