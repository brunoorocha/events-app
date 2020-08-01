//
//  EventsViewModel.swift
//  events-app
//
//  Created by Bruno Rocha on 03/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

class EventsViewModel {
    var service: EventsServiceProtocol

    let events: PublishSubject<[EventViewModel]> = PublishSubject()
    let selectedEvent: PublishSubject<EventViewModel> = PublishSubject()

    let isLoading: PublishSubject<Bool> = PublishSubject()
    let error: PublishSubject<Error> = PublishSubject()
    let disposeBag = DisposeBag()

    init(service: EventsServiceProtocol) {
        self.service = service
    }
    
    func getEvents () {
        isLoading.onNext(true)

        service.getEvents()
            .subscribe(onSuccess: { [weak self] events in
                let eventsViewModels = events.map { EventViewModel(fromEvent: $0) }
                self?.events.onNext(eventsViewModels)
                self?.isLoading.onNext(false)
            }, onError: { error in
                self.error.onNext(error)
                self.isLoading.onNext(false)
            })
            .disposed(by: disposeBag)
    }
}
