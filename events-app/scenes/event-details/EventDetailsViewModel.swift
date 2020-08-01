//
//  EventDetailsViewModel.swift
//  events-app
//
//  Created by Bruno Rocha on 31/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

struct EventDetailsViewModel {
    let event: PublishSubject<EventViewModel> = PublishSubject()
    let isLoading: PublishSubject<Bool> = PublishSubject()
    let error: PublishSubject<Error> = PublishSubject()

    let disposeBag = DisposeBag()
    let service: EventsApiService

    init (service: EventsApiService) {
        self.service = service
    }
    
    func getEvent (withId id: String) {
        isLoading.onNext(true)

        service.getEvent(withId: id)
            .subscribe(onSuccess: { event in
                let eventViewModel = EventViewModel(fromEvent: event)
                self.event.onNext(eventViewModel)
                self.isLoading.onNext(false)
            }, onError: { error in
                self.error.onNext(error)
            })
            .disposed(by: disposeBag)
    }
}
