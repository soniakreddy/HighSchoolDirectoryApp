//
//  SATScoreViewController.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation
import SwiftUI
import UIKit

class SATScoreViewController: UIViewController {
    private var satScore: SATScore
    
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
    
    init(satScore: SATScore) {
        self.satScore = satScore
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
        title = Constants.satScoresTitle
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

extension SATScoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.sectionHeaderHeight
        
    }
}

extension SATScoreViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        if section == 0 {
            title = Constants.satTotalParticipantsTitle
        } else if section == 1 {
            title = Constants.mathScoreTitle
        } else if section == 2 {
            title = Constants.writingScoreTitle
        } else if section == 3 {
            title = Constants.criticalReadingScoreTitle
        } else if section == 4 {
            title = ""
        }
        
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        if indexPath.section == 0 {
            cell.textLabel?.text = satScore.numOfSatTestTakers
        } else if indexPath.section == 1 {
            cell.textLabel?.text = satScore.satMathAvgScore
        } else if indexPath.section == 2 {
            cell.textLabel?.text = satScore.satWritingAvgScore
        } else if indexPath.section == 3 {
            cell.textLabel?.text = satScore.satCriticalReadingAvgScore
        } else if indexPath.section == 4 {
            let stackedBarData: [BarChartDataType] = [
                .init(color: Constants.mathAvgTitle, type: Constants.values, count: Int(satScore.satMathAvgScore) ?? 0),
                .init(color: Constants.writingAvgTitle, type: Constants.values, count: Int(satScore.satWritingAvgScore) ?? 0),
                .init(color: Constants.criticalReadingAvgTitle, type: Constants.values, count: Int(satScore.satCriticalReadingAvgScore) ?? 0)
            ]
            cell.contentConfiguration = UIHostingConfiguration {
                HStack {
                    Text(Constants.barChartTitle)
                    Spacer()
                    BarChart(stackedBarData: stackedBarData)
                }
            }
        }
         
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .victoriaBlueColor
            headerView.textLabel?.textColor = .white
        }
    }
    
}
