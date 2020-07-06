//
//  EventsViewModel.swift
//  events-app
//
//  Created by Bruno Rocha on 03/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

struct EventsViewModel {
    var service: EventsServiceProtocol
    
    let events: PublishSubject<[Event]> = PublishSubject()
    let isLoading: PublishSubject<Bool> = PublishSubject()
    let error: PublishSubject<Error> = PublishSubject()
    let disposeBag = DisposeBag()

    init(service: EventsServiceProtocol = EventsApiService()) {
        self.service = service
    }
    
    func getEvents () {
        isLoading.onNext(true)

        service.getEvents()
            .subscribe(onSuccess: { events in
                self.events.onNext(events)
                self.isLoading.onNext(false)
            }, onError: { error in
                self.error.onNext(error)
                self.isLoading.onNext(false)
            })
            .disposed(by: disposeBag)
    }
}