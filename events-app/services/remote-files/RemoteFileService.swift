//
//  RemoteFilesService.swift
//  events-app
//
//  Created by Bruno Rocha on 24/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift
import UIKit

enum RemoteFileServiceError: Error {
    case invalidUrl
}

class RemoteFileService {
    static let shared = RemoteFileService()
    private let disposeBag = DisposeBag()

    private init() {}

    func get (from url: URL) -> Observable<Data> {
        let request = URLRequest(url: url)

        return URLSession.shared.rx
                .data(request: request)
                .asObservable()
    }

    func get (from urlString: String) -> Observable<Data> {
        guard let url = URL(string: urlString) else {
            return Observable.error(RemoteFileServiceError.invalidUrl)
        }

        return get(from: url)
    }
}

extension RemoteFileService {
    func getImage (from urlString: String) -> Observable<UIImage?> {
        return get(from: urlString)
            .map { UIImage(data: $0) }
            .asObservable()
    }
}
