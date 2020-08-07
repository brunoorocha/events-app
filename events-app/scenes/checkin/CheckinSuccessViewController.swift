//
//  CheckinSuccessViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 03/08/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit
import RxSwift

class CheckinSuccessViewController: UIViewController {
    lazy var successView = CheckinSuccessView()
    
    let viewModel: CheckinSuccessViewModel
    private let disposeBag = DisposeBag()

    init (viewModel: CheckinSuccessViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presentationController?.delegate = self
        bindToViewModel()
    }

    override func loadView() {
        view = successView
    }
    
    private func bindToViewModel () {
        successView.okButton.rx.tap
            .bind(to: viewModel.didDismiss)
            .disposed(by: disposeBag)
    }
}

extension CheckinSuccessViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        viewModel.didDismiss.onNext(())
    }
}
