//
//  CheckinViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 28/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit
import RxSwift

class CheckinViewController: UIViewController {
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
        presentationController?.delegate = self
        bindToViewModel()
    }

    private func bindToViewModel () {
        checkinView.navigationBar.closeButton.rx.tap
            .bind(to: viewModel.didDismiss)
            .disposed(by: disposeBag)

        checkinView.nameField.textField.rx.text.orEmpty
            .bind(to: viewModel.name)
            .disposed(by: disposeBag)

        checkinView.emailField.textField.rx.text.orEmpty
            .bind(to: viewModel.email)
            .disposed(by: disposeBag)

        checkinView.cupomField.textField.rx.text.orEmpty
            .bind(to: viewModel.cupom)
            .disposed(by: disposeBag)

        viewModel.isCheckinActive
            .bind(to: checkinView.confirmButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}

extension CheckinViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        viewModel.didDismiss.onNext(())
    }
}
