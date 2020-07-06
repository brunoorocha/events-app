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
                .catchError(handleError)
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
    
    private func handleError (_ error: Error) throws -> PrimitiveSequence<SingleTrait, [Event]> {
        guard let errorAsMoyaError = error as? MoyaError else {
            throw error
        }

        switch errorAsMoyaError {
        case .objectMapping(_, _):
            throw NetworkErrors.responseDecoding

        case .encodableMapping(_):
            throw NetworkErrors.responseDecoding

        case .statusCode(let response):
            if (response.statusCode == 404) {
                throw NetworkErrors.resourceNotFound
            }

            if ((500...599).contains(response.statusCode)) {
                throw NetworkErrors.serverError
            }
            
            throw NetworkErrors.unknown
        default:
            throw NetworkErrors.unknown
        }
    }
}
