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
    let viewModel: CheckinViewModel
    
    init (viewModel: CheckinViewModel, navigationController: UINavigationController?) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    override func start() -> Observable<Void> {
        let checkinViewController = CheckinViewController(viewModel: viewModel)
        checkinViewController.modalPresentationStyle = .formSheet
        navigationController?.present(checkinViewController, animated: true)

        return Observable.never()
    }
}
