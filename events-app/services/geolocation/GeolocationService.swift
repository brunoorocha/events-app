//
//  GeolocationService.swift
//  events-app
//
//  Created by Bruno Rocha on 26/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import MapKit
import RxSwift

enum GeolocationServiceError: Error {
    case locationNotFound
    case locationRequestFail
}

class GeolocationService {
    static let shared = GeolocationService()

    private init () {}

    func getAddress (latitude: Double, longitude: Double) -> Observable<String?> {
        let locationAddress: PublishSubject<String?> = PublishSubject()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let geocoder = CLGeocoder()
        var address = ""

        geocoder.reverseGeocodeLocation(location) { (places, error) in
            guard let places = places,
                let place = places.first else {
                locationAddress.onError(GeolocationServiceError.locationNotFound)
                return
            }

            if let _ = error {
                locationAddress.onError(GeolocationServiceError.locationRequestFail)
            }

            if let street = place.thoroughfare {
                address += "\(street), "
            }
            if let number = place.subThoroughfare {
                address += "\(number), "
            }
            if let city = place.locality {
                address += "\(city)-"
            }
            if let state = place.administrativeArea {
                address += "\(state), "
            }
            if let country = place.country {
                address += "\(country)"
            }

            locationAddress.onNext(address)
        }

        return locationAddress.asObservable()
    }
}
