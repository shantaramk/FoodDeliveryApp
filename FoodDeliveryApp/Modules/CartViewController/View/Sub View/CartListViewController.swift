//
//  CartListViewController.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 01/11/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import Foundation
import UIKit

class CartListViewController: UIViewController, UITableViewDelegate {
     //MARK: - UI Properites

    lazy var weekTableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.backgroundColor = .white
        tableView.separatorInset = .zero
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.refreshControl = refreshControl
        return tableView
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .green
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        return refreshControl
    }()

    // MARK: -  Helper Methods

    private func configureTableView() {
        weekTableView.register(WeekDayTableViewCell.self, forCellReuseIdentifier: "WeekDayTableViewCell")

        weekTableView.dataSource = self
        weekTableView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = .red
        setupView()
        configureTableView()
        self.weekTableView.reloadData()

    }

    func setupView() {
        view.addSubview(weekTableView)

        weekTableView.topAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        weekTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weekTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        weekTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

//MARK: - Action

extension CartListViewController {

    @objc private func refresh(_ sender: UIRefreshControl) {
     }
}

//MARK: - UITable View DataSource

extension CartListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeekDayTableViewCell", for: indexPath) as? WeekDayTableViewCell else {
            fatalError("unable to Dequeue Week Day Table View Cell")
        }


        return cell
    }
}

