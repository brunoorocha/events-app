//
//  CheckinViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 28/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit
import RxSwift

class CheckinViewController: BaseViewController {
    let viewModel: CheckinViewModel
    let checkinView = ChekinView()

    private let disposeBag = DisposeBag()

    init (viewModel: CheckinViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = checkinView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar () {
        title = "Checkin"
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func bindToViewModel () {
        checkinView.nameField.textField.rx.text.orEmpty
            .bind(to: viewModel.name)
            .disposed(by: disposeBag)

        checkinView.emailField.textField.rx.text.orEmpty
            .bind(to: viewModel.email)
            .disposed(by: disposeBag)

        viewModel.isCheckinActive
            .bind(to: checkinView.confirmButton.rx.isEnabled)
            .disposed(by: disposeBag)

        checkinView.confirmButton.rx.tap
            .bind(to: viewModel.didCheckin)
            .disposed(by: disposeBag)
    }

    override func onPopViewController () {
        viewModel.didDismiss.onNext(())
    }
}

