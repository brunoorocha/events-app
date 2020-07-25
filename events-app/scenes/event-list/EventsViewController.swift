//
//  EventsViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 03/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class EventsViewController: BaseViewController {
    let eventsView = EventsView()
    let disposeBag = DisposeBag()
    let viewModel: EventsViewModel!
    
    init (with viewModel: EventsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Eventos"

        bindToViewModel()
        requestEvents()
    }

    override func loadView() {
        view = eventsView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func requestEvents () {
        viewModel.getEvents()
    }
    
    private func bindToViewModel () {
        viewModel.isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { isLoading in
                self.eventsView.isLoading = isLoading
            })
            .disposed(by: disposeBag)

        viewModel.error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] error in
                self?.onError(error)
            })
            .disposed(by: disposeBag)

        viewModel.events
            .bind(to: eventsView.tableView.rx.items(cellIdentifier: eventsView.cellIdentifier, cellType: EventTableViewCell.self)) { (row, event, cell) in
                cell.titleLabel.text = event.title
                cell.dateLabel.text = event.date
                cell.priceLabel.text = event.price

                RemoteFileService.shared
                    .getImage(from: event.imageUrl)
                    .observeOn(MainScheduler.instance)
                    .subscribe(onNext: { image in
                        cell.coverImageView.showingImage(image)
                    })
                    .disposed(by: self.disposeBag)

            }.disposed(by: disposeBag)

        eventsView.tableView.rx
            .modelSelected(EventViewModel.self)
            .bind(to: viewModel.selectedEvent)
            .disposed(by: disposeBag)
    }
}

