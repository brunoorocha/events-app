//
//  EventDetailsViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 10/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import RxSwift
import UIKit

class EventDetailsViewController: BaseViewController {
    let eventDetailsView = EventDetailsView()
    var changeStatusBarStyleOffset: CGFloat = 0

    var viewModel: EventDetailsViewModel

    let disposeBag = DisposeBag()

    init (viewModel: EventDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        eventDetailsView.scrollView.delegate = self
        changeStatusBarStyleOffset = 320
        customizeNavigationBar()
        bindToViewModel()
    }

    override func loadView() {
        view = eventDetailsView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeNavigationBar()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarUIView?.backgroundColor = Colors.background.toUIColor
        navigationController?.navigationBar.barStyle = .default
    }

    func customizeNavigationBar () {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .none
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white

        UIApplication.shared.statusBarUIView?.backgroundColor = .none
        navigationItem.backBarButtonItem?.title = ""
        title = "Evento"
    }

    private func updateStatusBarStyleWhenScroll (_ scrollView: UIScrollView) {
        let shouldChangeBarStyle = scrollView.contentOffset.y > (changeStatusBarStyleOffset / 2)
        navigationController?.navigationBar.barStyle = shouldChangeBarStyle ? .default : .black
    }

    func updatedNavigationBarOpacityWhenScroll (_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if (offsetY < 0 || offsetY > changeStatusBarStyleOffset) {
            return
        }

        let barOpacity = offsetY / changeStatusBarStyleOffset
        let roundedBarOpacity = (barOpacity * 100).rounded() / 100
        let newTitleColor = UIColor(hue: 0, saturation: 0, brightness: 1 - roundedBarOpacity, alpha: 1)
        let newBackgroundColor = UIColor.white.withAlphaComponent(roundedBarOpacity)

        navigationController?.navigationBar.tintColor = newTitleColor
        navigationController?.navigationBar.backgroundColor = newBackgroundColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: newTitleColor]
        UIApplication.shared.statusBarUIView?.backgroundColor = newBackgroundColor
    }

    private func bindToViewModel () {
        viewModel.isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                self?.eventDetailsView.isLoading = isLoading
            })
            .disposed(by: disposeBag)

        viewModel.event
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] eventViewModel in
                self?.eventDetailsView.name = eventViewModel.title
                self?.eventDetailsView.price = eventViewModel.price
                self?.eventDetailsView.date = eventViewModel.date
                self?.eventDetailsView.descriptionText = eventViewModel.description

                guard let disposeBag = self?.disposeBag else { return }

                RemoteFileService.shared
                    .getImage(from: eventViewModel.imageUrl)
                    .observeOn(MainScheduler.instance)
                    .subscribe(onNext: { [weak self] image in
                        self?.eventDetailsView.coverImage = image
                    })
                    .disposed(by: disposeBag)

                GeolocationService.shared
                    .getAddress(latitude: eventViewModel.latitude, longitude: eventViewModel.longitude)
                    .observeOn(MainScheduler.instance)
                    .subscribe(onNext: { address in
                        self?.eventDetailsView.address = address
                    })
                    .disposed(by: disposeBag)
            })
            .disposed(by: disposeBag)
    }
}

extension EventDetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        eventDetailsView.coverView.stretchWhenScroll(scrollView)
        updatedNavigationBarOpacityWhenScroll(scrollView)
        updateStatusBarStyleWhenScroll(scrollView)
    }
}
