//
//  Coordinator.swift
//  events-app
//
//  Created by Bruno Rocha on 10/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift

class Coordinator<ResultType>: NSObject {
    public typealias CoordinatorResult = ResultType
    
    let disposeBag = DisposeBag()
    private let identifier = UUID()
    private var childCoordinators = [UUID : Any]()
    
    private func store<T> (coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
    }

    private func release<T> (coordinator: Coordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }
    
    @discardableResult
    func coordinate<T> (to coordinator: Coordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)

        return coordinator.start()
            .do(onNext: { [weak self] _ in
                self?.release(coordinator: coordinator)
            })
    }

    func start () -> Observable<ResultType> {
        fatalError("start() method should be implemented")
    }
}

