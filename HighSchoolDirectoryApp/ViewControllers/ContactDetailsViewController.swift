//
//  ContactDetailsViewController.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    private var contactDetails: ContactDetails
    
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
    
    init(contactDetails: ContactDetails) {
        self.contactDetails = contactDetails
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
        let shareDetails = UIBarButtonItem(image: UIImage(systemName: Constants.shareIcon), style: .plain, target: self, action: #selector(shareDetailsTapped))
        shareDetails.accessibilityLabel = Constants.shareDetailsAccessibilityLabel
        shareDetails.accessibilityHint = Constants.shareDetailsAccessibilityHint
        navigationItem.rightBarButtonItem = shareDetails
        navigationController?.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:  UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        title = Constants.contactDetailsTitle
    }
    
    private func setupConstraints() {
        var customConstraints = [NSLayoutConstraint]()
        
        customConstraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        customConstraints.append(tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        customConstraints.append(tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        customConstraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))

        NSLayoutConstraint.activate(customConstraints)
        
    }
    
    @objc private func shareDetailsTapped(_ sender: UIButton) {
        var textToShare = ""
        for (index, element) in contactDetails.valueRows.enumerated() {
            textToShare += element.title + element.value
            if index < contactDetails.valueRows.count {
                textToShare += "\n"
            }
        }
        let objectsToShare: [Any] = [textToShare]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

        activityViewController.popoverPresentationController?.sourceView = sender
        self.present(activityViewController, animated: true, completion: nil)
    }
}

extension ContactDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 || indexPath.section == 1 {
            let number = contactDetails.valueRows[indexPath.section].value
            if let url = URL(string: "tel://\(number)") {
                UIApplication.shared.open(url)
            }
        } else if indexPath.section == 2 {
            let email = contactDetails.valueRows[indexPath.section].value
            if let url = URL(string: "mailto:\(email)") {
                UIApplication.shared.open(url)
            }
        } else if indexPath.section == 3 {
            let urlString = contactDetails.valueRows[indexPath.section].value
            let urlHasHttpPrefix = urlString.hasPrefix("http://")
            let urlHasHttpsPrefix = urlString.hasPrefix("https://")
            let validUrlString = (urlHasHttpPrefix || urlHasHttpsPrefix) ? urlString : "http://\(urlString)"

            if let url = URL(string: validUrlString) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.sectionHeaderHeight
        
    }
}

extension ContactDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactDetails.valueRows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contactDetails.valueRows[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellIdentifier, for: indexPath)
        var text = ""
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = .systemBlue
        if indexPath.section == 0 || indexPath.section == 1 {
            text = contactDetails.valueRows[indexPath.section].value.toPhoneNumber()
        } else if indexPath.section == 2 {
            text = contactDetails.valueRows[indexPath.section].value
        } else if indexPath.section == 3 {
            text = contactDetails.valueRows[indexPath.section].value
        }
        cell.textLabel?.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .victoriaBlueColor
            headerView.textLabel?.textColor = .white
        }
    }
    
}
