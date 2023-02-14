//
//  DetailsViewController.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import ExpandableLabel
import Foundation
import UIKit

public struct IndexPathCollapsedState {
    let indexPath: IndexPath
    var collapsedState: Bool
}

class DetailsViewController: UIViewController {
    private let schoolDataContainer: SchoolDataContainer
    private var indexPathCollapsedStates = [IndexPathCollapsedState]()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = Constants.tableViewIdentifier
        tableView.layer.cornerRadius = Constants.cornerRadius
        tableView.separatorStyle = .singleLine
        tableView.register(OverviewInfoTableViewCell.self, forCellReuseIdentifier: Constants.overviewInfoTableViewCellIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellIdentifier)
        tableView.register(ProgramDetailsTableViewCell.self, forCellReuseIdentifier: Constants.programDetailsTableViewCellIdentifier)
        tableView.register(StatisticsTableViewCell.self, forCellReuseIdentifier: Constants.statisticsTableViewCellIdentifier)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: Constants.seperatorInsetSideMargin, bottom: 0, right: Constants.seperatorInsetSideMargin)
        tableView.backgroundColor = .victoriaBlueColor
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    init(schoolDataContainer: SchoolDataContainer) {
        self.schoolDataContainer = schoolDataContainer
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:  UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        title = Constants.detailsTitle
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

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 && indexPath.row == 1 {
            let locationsViewController = LocationsViewController(locationDetails: schoolDataContainer.locationDetails)
            navigationController?.pushViewController(locationsViewController, animated: true)
        } else if indexPath.section == 0 && indexPath.row == 2 {
            let contactDetailsViewController = ContactDetailsViewController(contactDetails: schoolDataContainer.contactDetails)
            navigationController?.pushViewController(contactDetailsViewController, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 1 {
            let admissionsViewController = AdmissionsViewController(admissions: schoolDataContainer.programDetails.admissions)
            navigationController?.pushViewController(admissionsViewController, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 2 {
            let scoresViewController = SATScoreViewController(satScore: schoolDataContainer.programDetails.satScore)
            navigationController?.pushViewController(scoresViewController, animated: true)
        } else if indexPath.section == 1 && indexPath.row == 3 {
            let facilitiesViewController = FacilitiesViewController(facilities: schoolDataContainer.programDetails.facilities)
            navigationController?.pushViewController(facilitiesViewController, animated: true)
        } else if indexPath.section == 2 && indexPath.row == 1 {
            let statisticsViewController = StatisticsViewController(statisticsInfo: schoolDataContainer.statistics.statisticsInfo)
            navigationController?.pushViewController(statisticsViewController, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .victoriaBlueColor
            headerView.textLabel?.textColor = .white
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        if section == 0 {
            title = Constants.overviewTitle
        } else if section == 1 {
            title = Constants.programDetailsTitle
        } else if section == 2 {
            title = Constants.statisticsTitle
        }
        
        return title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowsCount = 0
        if section == 0 {
            rowsCount = 3
        } else if section == 1 {
            if schoolDataContainer.programDetails.facilities.valueRows.count > 0 {
                rowsCount += 1
            }
            if schoolDataContainer.programDetails.admissions.valueRows.count > 0 {
                rowsCount += 1
            }
            rowsCount += 2 // Overview & sat scores
        } else if section == 2 {
            rowsCount = 2
        }
        return rowsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath as IndexPath)
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell: OverviewInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.overviewInfoTableViewCellIdentifier)  as! OverviewInfoTableViewCell
            cell.overviewTextLabel.delegate = self
            cell.overviewTextLabel.setLessLinkWith(lessLink: Constants.showLess, attributes: [.foregroundColor: UIColor.brightBlueColor, .font: UIFont.boldSystemFont(ofSize: Constants.smallFontSize)], position: nil)
            let readMore = NSMutableAttributedString(string: Constants.readMore)
            readMore.addAttributes([.foregroundColor: UIColor.mossGreenColor, .font: UIFont.boldSystemFont(ofSize: Constants.smallFontSize)], range: NSRange(location: 0, length: readMore.length))
            cell.overviewTextLabel.collapsedAttributedLink = readMore
            cell.layoutIfNeeded()
            cell.overviewTextLabel.shouldCollapse = true
            cell.overviewTextLabel.textReplacementType = .character
            cell.overviewTextLabel.numberOfLines = 3
            if let indexPathCollapsedState = indexPathCollapsedStates.filter({ $0.indexPath.row == indexPath.row && $0.indexPath.section == indexPath.section }).first {
                cell.overviewTextLabel.collapsed = indexPathCollapsedState.collapsedState
            } else {
                cell.overviewTextLabel.collapsed = true
            }
            cell.selectionStyle = .none
            cell.overviewTextLabel.text = schoolDataContainer.generalDetails.overview
            cell.configureCell(generalDetails: schoolDataContainer.generalDetails)
            return cell
        } else if indexPath.section == 0 && indexPath.row == 1 {
            cell.textLabel?.text = Constants.viewLocationDetailsTitle
            cell.accessibilityHint = Constants.tapToViewDetails
            cell.textLabel?.textColor = .systemBlue
            cell.accessoryType = .disclosureIndicator
        } else if indexPath.section == 0 && indexPath.row == 2 {
            cell.textLabel?.text = Constants.viewContactDetailsTitle
            cell.accessibilityHint = Constants.tapToViewDetails
            cell.textLabel?.textColor = .systemBlue
            cell.accessoryType = .disclosureIndicator
        } else if indexPath.section == 1 && indexPath.row == 0 {
            let cell: ProgramDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.programDetailsTableViewCellIdentifier)  as! ProgramDetailsTableViewCell
            cell.configureCell(programOverview: schoolDataContainer.programDetails.programOverview)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 && indexPath.row == 1 {
            cell.textLabel?.text = Constants.viewAdmissionDetailsTitle
            cell.accessibilityHint = Constants.tapToViewDetails
            cell.textLabel?.textColor = .systemBlue
            cell.accessoryType = .disclosureIndicator
        } else if indexPath.section == 1 && indexPath.row == 2 {
            cell.textLabel?.text = Constants.viewSATDetailsTitle
            cell.accessibilityHint = Constants.tapToViewDetails
            cell.textLabel?.textColor = .systemBlue
            cell.accessoryType = .disclosureIndicator
        } else if indexPath.section == 1 && indexPath.row == 3 {
            cell.textLabel?.text = Constants.viewFacilityDetailsTitle
            cell.accessibilityHint = Constants.tapToViewDetails
            cell.textLabel?.textColor = .systemBlue
            cell.accessoryType = .disclosureIndicator
        } else if indexPath.section == 2 && indexPath.row == 0 {
            let cell: StatisticsTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.statisticsTableViewCellIdentifier)  as! StatisticsTableViewCell
            cell.configureCell(statisticsOverview: schoolDataContainer.statistics.statisticsOverview)
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 2 && indexPath.row == 1 {
            cell.textLabel?.text = Constants.viewStatisticsTitle
            cell.accessibilityHint = Constants.tapToViewDetails
            cell.textLabel?.textColor = .systemBlue
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
}

extension DetailsViewController: ExpandableLabelDelegate {
    func willExpandLabel(_ label: ExpandableLabel) {
        tableView.beginUpdates()
    }
    
    func didExpandLabel(_ label: ExpandableLabel) {
        let point = label.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) as IndexPath? {
            let indexPathCollapsedState = IndexPathCollapsedState(indexPath: indexPath, collapsedState: false)
            indexPathCollapsedStates.addIndexPathCollapsedState(indexPathCollapsedState: indexPathCollapsedState)
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
            DispatchQueue.main.async { [weak self] in
                self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        tableView.endUpdates()
    }
    
    func willCollapseLabel(_ label: ExpandableLabel) {
        tableView.beginUpdates()
    }
    
    func didCollapseLabel(_ label: ExpandableLabel) {
        let point = label.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) as IndexPath? {
            let indexPathCollapsedState = IndexPathCollapsedState(indexPath: indexPath, collapsedState: true)
            indexPathCollapsedStates.addIndexPathCollapsedState(indexPathCollapsedState: indexPathCollapsedState)
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
            DispatchQueue.main.async { [weak self] in
                self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
        tableView.endUpdates()
    }
}

public extension Array where Element == IndexPathCollapsedState {
    mutating func addIndexPathCollapsedState(indexPathCollapsedState: IndexPathCollapsedState) {
        removeAll(where: { $0.indexPath == indexPathCollapsedState.indexPath })
        append(indexPathCollapsedState)
    }
}
