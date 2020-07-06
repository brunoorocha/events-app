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
    let cellIdentifier = "cellId"
    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews () {
        addSubview(tableView)
    }
    
    private func setupConstraints () {
        tableView.edgesToSuperview()
    }
    
    private func setupTableView () {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}
