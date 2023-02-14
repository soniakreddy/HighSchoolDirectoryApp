//
//  ViewController.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import UIKit

class ViewController: UIViewController {
    private var schools: [School]?
    private var satScores: [SATScore]?
    private var schoolDict = [String: [School]]()
    private var sectionTitles = [String]()
    private var searchedSchoolDict = [String: [School]]()
    private var searchedSectionTitles = [String]()
    private var schoolDictionary = [String: [School]]()
    private var sectionTitlesArray = [String]()
    private var schoolDataArray: [SchoolData] = []
    
    private var isSearching = false {
        didSet {
            sectionTitlesArray = isSearching ? searchedSectionTitles : sectionTitles
            schoolDictionary = isSearching ? searchedSchoolDict : schoolDict
        }
    }
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
        return activityIndicator
    }()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = Constants.tableViewIdentifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.tableViewCellIdentifier)
        tableView.layer.cornerRadius = Constants.cornerRadius
        tableView.separatorInset = UIEdgeInsets(top: 0, left: Constants.seperatorInsetSideMargin, bottom: 0, right: Constants.seperatorInsetSideMargin)
        tableView.tableHeaderView = searchBar
        tableView.backgroundColor = .victoriaBlueColor
        tableView.sectionIndexColor = .white
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private lazy var searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(origin: .zero, size: searchBar.intrinsicContentSize)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.accessibilityIdentifier = Constants.searchBarIdentifier
        searchBar.searchBarStyle = .prominent
        searchBar.placeholder = Constants.placeholder
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.backgroundColor = .clear
        searchBar.barTintColor = .victoriaBlueColor
        searchBar.tintColor = .victoriaBlueColor
        searchBar.layer.borderColor = UIColor.victoriaBlueColor.cgColor
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .systemBackground
        searchBar.showsCancelButton = false
        searchBar.delegate = self
        searchBar.searchTextField.layer.cornerRadius = 20
        searchBar.searchTextField.layer.masksToBounds = true
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        view.backgroundColor =  .victoriaBlueColor
        
        setupNavigationBar()
        addConstraints()
        hideKeyboardWhenTappedAround()
        makeNetworkCalls()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .victoriaBlueColor
        navigationController?.isNavigationBarHidden = false
        updateNavigationTitle()
    }
    
    private func updateNavigationTitle() {
        title = Constants.schoolsListTitle
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: Constants.fontName, size: Constants.mediumFontSize)!
        ]
    }
    
    private func makeNetworkCalls() {
        activityIndicator.startAnimating()
        let queue = DispatchQueue(label: "some.queue.com")
        
        let group = DispatchGroup()
        group.enter()
        
        NetworkManager.shared.fetchData { [weak self] (schools, error) in
            guard let self = self else { return }
            if let schools = schools {
                self.activityIndicator.stopAnimating()
                
                self.schools = schools.sorted(by: { $0.schoolName < $1.schoolName })
                self.updateSchoolDict()
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print(Constants.noSchoolsFound)
            }
            
            group.leave()
        }
        
        group.notify(queue: queue) {
            NetworkManager.shared.fetchSATScoreData { [weak self] (satScores, error) in
                guard let self = self else { return }
                if let satScores = satScores {
                    self.satScores = satScores.sorted(by: { $0.schoolName < $1.schoolName })
                    self.updateSchoolDataArray()
                } else {
                    print(Constants.noSATScoresFound)
                }
            }
        }
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        updateNavigationTitle()
    }
    
    private func addConstraints() {
        var customConstraints = [NSLayoutConstraint]()
        customConstraints.append(activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        customConstraints.append(activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        customConstraints.append(searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15))
        customConstraints.append(searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        customConstraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        customConstraints.append(tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        customConstraints.append(tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        customConstraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        NSLayoutConstraint.activate(customConstraints)
    }
    
    private func updateSchoolDict() {
        guard let schools = schools else { return }
        for school in schools {
            let sectionTitleKey = String(school.schoolName.prefix(1))
            if var schoolValues = schoolDict[sectionTitleKey] {
                schoolValues.append(school)
                schoolDict[sectionTitleKey] = schoolValues
            } else {
                schoolDict[sectionTitleKey] = [school]
            }
        }
        
        // Get the section titles from the dictionary's keys and sort them in ascending order
        sectionTitles = [String](schoolDict.keys).sorted(by: { $0 < $1 })
        self.isSearching = false
    }
    
    private func updateSchoolDataArray() {
        guard let schools = self.schools, let satScores = self.satScores else { return }
        schools.forEach({ sch in
            
            // mapping School with SATScore using dbn value as it uniqely identifies schools
            if let satScore = satScores.filter({ $0.dbn == sch.dbn }).first {
                let schoolData = SchoolData(school: sch, satScore: satScore)
                schoolDataArray.append(schoolData)
            }
        })
    }
    
    private func getSearchResults(_ searchText: String) {
        let dictionary = schoolDict.mapValues { schoolArray in
            schoolArray.filter({ $0.schoolName.lowercased().contains(searchText.lowercased()) })
        }
        
        searchedSchoolDict = dictionary.filter{ !$0.value.isEmpty }
        searchedSectionTitles = [String](searchedSchoolDict.keys).sorted(by: { $0 < $1 })
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sectionTitleKey = sectionTitlesArray[indexPath.section]
        if let schoolValues = schoolDictionary[sectionTitleKey], let selectedSchoolData = schoolDataArray.filter({ $0.school.dbn == schoolValues[indexPath.row].dbn }).first {
            
            let detailsViewController = DetailsViewController(schoolDataContainer: selectedSchoolData.containerForSchoolData())
            navigationController?.pushViewController(detailsViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "", message: Constants.rowSelectionFailureMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: Constants.ok, style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.sectionHeaderHeight
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = .white
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitlesArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitlesArray[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitleKey = sectionTitlesArray[section]
        guard let schoolValues = schoolDictionary[sectionTitleKey] else { return 0 }
        return schoolValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: Constants.tableViewCellIdentifier)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.numberOfLines = 0
        cell.accessibilityHint = Constants.tapToViewDetails
        let sectionTitleKey = sectionTitlesArray[indexPath.section]
        if let schoolValues = schoolDictionary[sectionTitleKey] {
            cell.textLabel?.text = schoolValues[indexPath.row].schoolName
        }
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitlesArray
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let index = sectionTitles.firstIndex(of: title) else { return -1 }
        return index
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getSearchResults(searchText)
        isSearching = !searchText.isEmpty
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        searchBar.resignFirstResponder()
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
