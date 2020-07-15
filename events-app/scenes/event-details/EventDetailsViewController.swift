//
//  EventDetailsViewController.swift
//  events-app
//
//  Created by Bruno Rocha on 10/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit

class EventDetailsViewController: BaseViewController {
    private let eventDetailsView = EventDetailsView()
    var changeStatusBarStyleOffset: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        eventDetailsView.scrollView.delegate = self
        changeStatusBarStyleOffset = 320
        customizeNavigationBar()
    }

    override func loadView() {
        view = eventDetailsView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        customizeNavigationBar()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarUIView?.backgroundColor = Colors.background.toUIColor
        navigationController?.navigationBar.barStyle = .default
    }

    func customizeNavigationBar () {
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
}

extension EventDetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        eventDetailsView.coverView.stretchWhenScroll(scrollView)
        updatedNavigationBarOpacityWhenScroll(scrollView)
        updateStatusBarStyleWhenScroll(scrollView)
    }
}
