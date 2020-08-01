//
//  CheckinCoordinator.swift
//  events-app
//
//  Created by Bruno Rocha on 28/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

class CheckinCoordinator: Coordinator<Void> {
    var navigationController: UINavigationController?
    let event: Event
    
    init (event: Event, navigationController: UINavigationController?) {
        self.navigationController = navigationController
        self.event = event
    }
    
    override func start() -> Observable<Void> {
        let viewModel = CheckinViewModel(event: event)
        let checkinViewController = CheckinViewController(viewModel: viewModel)
        checkinViewController.modalPresentationStyle = .formSheet
        navigationController?.present(checkinViewController, animated: true)

        let didDismiss = viewModel.didDismiss.map { _ in () }

        return didDismiss
                .take(1)
                .do(onNext: { _ in
                    checkinViewController.dismiss(animated: true)
                })
    }
}
