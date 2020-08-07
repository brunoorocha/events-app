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
        navigationController?.pushViewController(checkinViewController, animated: true)

        let didDismiss = viewModel.didDismiss.map { _ in () }
        let didDismissSuccess = viewModel.didCheckin
            .flatMap({ [unowned self] _ in
                self.coordinateToCheckinSuccess()
            })

        return Observable
                .merge(didDismiss, didDismissSuccess)
                .take(1)
    }

    func coordinateToCheckinSuccess () -> Observable<Void> {
        let successViewModel = CheckinSuccessViewModel()
        let successViewController = CheckinSuccessViewController(viewModel: successViewModel)
        successViewController.modalPresentationStyle = .overFullScreen
        navigationController?.present(successViewController, animated: true)

        let didDismissSuccess = successViewModel.didDismiss.map { _ in () }

        return didDismissSuccess
                .do(onNext: { [weak self] _ in
                    successViewController.dismiss(animated: true)
                    self?.navigationController?.popViewController(animated: false)
                })
    }
}
