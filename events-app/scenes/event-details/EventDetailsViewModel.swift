//
//  EventDetailsViewModel.swift
//  events-app
//
//  Created by Bruno Rocha on 31/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

class EventDetailsViewModel {
    let event = PublishSubject<EventViewModel>()
    let isLoading = PublishSubject<Bool>()
    let error = PublishSubject<Error>()

    let doCheckin = PublishSubject<Void>()

    let disposeBag = DisposeBag()
    let service: EventsApiService

    init (service: EventsApiService) {
        self.service = service
    }
    
    func getEvent (withId id: String) {
        isLoading.onNext(true)

        service.getEvent(withId: id)
            .subscribe(onSuccess: { [weak self] event in
                let eventViewModel = EventViewModel(fromEvent: event)
                self?.event.onNext(eventViewModel)
                self?.isLoading.onNext(false)
            }, onError: { [weak self] error in
                self?.error.onNext(error)
            })
            .disposed(by: disposeBag)
    }
}
