//
//  FacilitiesViewController.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation
import UIKit
import ExpandableLabel

class FacilitiesViewController: UIViewController {
    private var facilities: Facilities
    private var isExpanded = false
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = Constants.tableViewIdentifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellIdentifier)
        tableView.layer.cornerRadius = Constants.cornerRadius
        tableView.separatorInset = UIEdgeInsets(top: 0, left: Constants.seperatorInsetSideMargin, bottom: 0, right: Constants.seperatorInsetSideMargin)
        tableView.register(OverviewInfoTableViewCell.self, forCellReuseIdentifier: Constants.overviewInfoTableViewCellIdentifier)
        tableView.backgroundColor = .victoriaBlueColor
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    init(facilities: Facilities) {
        self.facilities = facilities
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
        title = Constants.facilityTitle
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

extension FacilitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.sectionHeaderHeight
        
    }
}

extension FacilitiesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return facilities.valueRows.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facilities.valueRows[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let details = facilities.valueRows[indexPath.section][indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: Constants.tableViewCellIdentifier)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        cell.detailTextLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        cell.accessoryType = details.boolValue ? .checkmark : .none
        cell.textLabel?.text = details.title
        cell.selectionStyle = .none
        if facilities.isGeoEligible {
            cell.detailTextLabel?.text =  !details.boolValue ? details.value : ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        if section == 0 {
            title = Constants.detailsTitle
        } else if section == 1 {
            title = Constants.sportsTitle
        } else if section == 2 {
            title = Constants.extracurricularActivitiesTitle
        }
        
        return title
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .victoriaBlueColor
            headerView.textLabel?.textColor = .white
        }
    }
}

extension FacilitiesViewController: ExpandableLabelDelegate {
    func willExpandLabel(_ label: ExpandableLabel) {
        isExpanded = true
        tableView.beginUpdates()
    }
    
    func didExpandLabel(_ label: ExpandableLabel) {
        let point = label.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) as IndexPath? {
            tableView.reloadRows(at: [indexPath], with: .automatic)
            DispatchQueue.main.async { [weak self] in
                self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        tableView.endUpdates()
    }
    
    func willCollapseLabel(_ label: ExpandableLabel) {
        isExpanded = false
        tableView.beginUpdates()
    }
    
    func didCollapseLabel(_ label: ExpandableLabel) {
        let point = label.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) as IndexPath? {
            tableView.reloadRows(at: [indexPath], with: .automatic)
            DispatchQueue.main.async { [weak self] in
                self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        tableView.endUpdates()
    }
}
