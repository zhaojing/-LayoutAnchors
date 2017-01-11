//
//  ViewController.swift
//  Workshop
//
//  Created by JingZhao on 1/9/17.
//  Copyright © 2017 JingZhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    let tableView = UITableView()
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupConstraints()
    }
    
    // MARK: private
    func setupTable() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ViewCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(ViewCell.self))
        tableView.register(HeaderViewCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(HeaderViewCell.self))
        let estimateHeight = 900.0;
        tableView.estimatedRowHeight = CGFloat(estimateHeight)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
    }
    
    func setupConstraints()  {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(
            equalTo: view.topAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell;
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HeaderViewCell.self), for: indexPath)
            if let headerView = cell as? HeaderViewCell {
                headerView.configCellWithViewModel(viewModel: viewModel)
            }

        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ViewCell.self), for: indexPath)
            if let viewCell = cell as? ViewCell {
                viewCell.keyLabel.text = viewModel.stackViewContent[indexPath.row].0
                viewCell.valueLabel.text = viewModel.stackViewContent[indexPath.row].1
            }
        }

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let sectionNum = 2
        return sectionNum
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return 1
        }
        return viewModel.stackViewContent.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true);
    }
}

