//
//  ChekinViewModel.swift
//  events-app
//
//  Created by Bruno Rocha on 28/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

class CheckinViewModel {
    let event: Event

    let name = BehaviorSubject<String>(value: "")
    let email = BehaviorSubject<String>(value: "")
    let cupom = BehaviorSubject<String>(value: "")
    let isCheckinActive = BehaviorSubject<Bool>(value: false)

    let didDismiss = PublishSubject<Void>()
    private let disposeBag = DisposeBag()

    init (event: Event) {
        self.event = event

        Observable.combineLatest(name, email)
            .map { !($0.isEmpty || $1.isEmpty) }
            .bind(to: isCheckinActive)
            .disposed(by: disposeBag)
    }
}
