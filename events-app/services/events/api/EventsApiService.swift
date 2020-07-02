//
//  EventsApiService.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift
import Moya

final class EventsApiService: EventsServiceProtocol {
    private let provider = MoyaProvider<EventsApi>()

    func getEvents() -> Single<[Event]> {
        return provider
                .rx
                .request(.events)
                .filterSuccessfulStatusCodes()
                .map([Event].self)
    }

    func getEvent(withId id: Int) -> Single<Event> {
        return provider
                .rx
                .request(.event(eventId: id))
                .filterSuccessfulStatusCodes()
                .map(Event.self)
    }

    func checkin(_ payload: CheckinPayload) -> Completable {
        return provider
                .rx
                .request(.checkin)
                .filterSuccessfulStatusCodes()
                .asObservable()
                .ignoreElements()
    }
}
