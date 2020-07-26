//
//  GeolocationService.swift
//  events-app
//
//  Created by Bruno Rocha on 26/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import MapKit

class GeolocationService {
    static func getAddressForLocationWith (latitude: Double, longitude: Double, completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let geocoder = CLGeocoder()
        var address = ""

        geocoder.reverseGeocodeLocation(location) { (places, error) in
            guard let places = places,
                let place = places.first else {
                completion(nil)
                return
            }

            if let _ = error {
                completion(nil)
                return
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

            completion(address)
        }
    }
}
