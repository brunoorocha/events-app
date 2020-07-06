//
//  EventsView.swift
//  events-app
//
//  Created by Bruno Rocha on 02/07/20.
//  Copyright © 2020 Bruno Rocha. All rights reserved.
//

import UIKit
import TinyConstraints

class EventsView: BaseScreenView {
    let cellIdentifier = "EventTableViewCell"
    let tableView = UITableView()
    let loadingView = ActivityIndicatorView()
    
    var isLoading = false {
        didSet {
            if (isLoading) {
                showLoadingView()
                return
            }

            showTableView()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews () {
        addSubview(tableView)
        addSubview(loadingView)

        tableView.edgesToSuperview()
        loadingView.edgesToSuperview()
    }
    
    private func setupTableView () {
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.separatorColor = .clear
    }

    func showLoadingView () {
        loadingView.isHidden = false
        loadingView.startAnimating()
        tableView.isHidden = true
    }

    func showTableView () {
        loadingView.isHidden = true
        loadingView.stopAnimating()
        tableView.isHidden = false
    }
}
