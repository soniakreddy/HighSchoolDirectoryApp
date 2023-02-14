//
//  AdmissionsViewController.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import UIKit

class AdmissionsViewController: UIViewController {
    private var admissions: Admissions
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = Constants.tableViewIdentifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellIdentifier)
        tableView.layer.cornerRadius = Constants.cornerRadius
        tableView.separatorInset = UIEdgeInsets(top: 0, left: Constants.seperatorInsetSideMargin, bottom: 0, right: Constants.seperatorInsetSideMargin)
        tableView.backgroundColor = .victoriaBlueColor
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    init(admissions: Admissions) {
        self.admissions = admissions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.backgroundColor = .victoriaBlueColor
        
        setupNavigationBar()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:  UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        title = Constants.requirementsDetailsTitle
    }
    
    private func setupConstraints() {
        var customConstraints = [NSLayoutConstraint]()
        
        customConstraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        customConstraints.append(tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        customConstraints.append(tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        customConstraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))

        NSLayoutConstraint.activate(customConstraints)
        
    }
}

extension AdmissionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.sectionHeaderHeight
        
    }
}

extension AdmissionsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return admissions.valueRows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return admissions.valueRows[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        cell.textLabel?.text = admissions.valueRows[indexPath.section].value
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .victoriaBlueColor
            headerView.textLabel?.textColor = .white
        }
    }
    
}
