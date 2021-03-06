//
//  EventsServiceProtocol.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

protocol EventsServiceProtocol {
    func getEvents () -> Single<[Event]>
    func getEvent (withId id: String) -> Single<Event>
    func checkin (_ payload: CheckinPayload) -> Completable
}
