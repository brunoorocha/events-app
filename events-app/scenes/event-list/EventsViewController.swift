//
//  EventsViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 03/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift
import UIKit

class EventsViewController: BaseViewController {
    let eventsView = EventsView()
    let viewModel = EventsViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Eventos"

        bindToViewModel()
//        requestEvents()
    }

    override func loadView() {
        view = eventsView
    }
    
    private func requestEvents () {
        viewModel.getEvents()
    }
    
    private func bindToViewModel () {
        viewModel.isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {
                print($0)
            })
            .disposed(by: disposeBag)

        viewModel.error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] error in
                self?.onError(error)
            })
            .disposed(by: disposeBag)

        viewModel.events
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { events in
                print(events)
            })
            .disposed(by: disposeBag)
    }
}

