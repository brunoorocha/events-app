//
//  EventsCoordinator.swift
//  events-app
//
//  Created by Bruno Rocha on 10/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

class EventsCoordinator: Coordinator<Void> {
    
    var navigationController: UINavigationController?
    
    init (navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    override func start() -> Observable<Void> {
        let eventsApiService = EventsApiService()
        let viewModel = EventsViewModel(service: eventsApiService)
        let eventsViewController = EventsViewController(with: viewModel)

        navigationController?.pushViewController(eventsViewController, animated: true)
        
        viewModel.selectedEvent
            .flatMap { [unowned self] (eventViewModel) in
                self.coordinateToEventDetails(eventViewModel: eventViewModel)
            }
            .subscribe()
            .disposed(by: disposeBag)

        return Observable.never()
    }
    
    private func coordinateToEventDetails (eventViewModel: EventViewModel) -> Observable<Void> {
        let eventDetailsCoordinator = EventDetailsCoordinator(
            event: eventViewModel.event,
            navigationController: navigationController
        )

        return coordinate(to: eventDetailsCoordinator)
    }
}
