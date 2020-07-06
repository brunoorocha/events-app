//
//  EventsApi.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import Moya

enum EventsApi {
    case events
    case event(eventId: Int)
    case checkin
}

extension EventsApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://5b840ba5db24a100142dcd8c.mockapi.io/api/")!
    }
    
    var path: String {
        switch self {
        case .events:
            return "events"
        case .event(let eventId):
            return "events/\(eventId)"
        case .checkin:
            return "checkin"
        }
    }
    
    var method: Method {
        switch self {
        case .checkin:
            return .post
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .checkin:
            return .requestPlain
        default:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
