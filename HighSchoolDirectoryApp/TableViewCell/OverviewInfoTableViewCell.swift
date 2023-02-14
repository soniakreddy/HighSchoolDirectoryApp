//
//  OverviewInfoTableViewCell.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation
import UIKit
import ExpandableLabel

class OverviewInfoTableViewCell: UITableViewCell {
    private var customConstraints = [NSLayoutConstraint]()
    
    private lazy var iconImage: UIImageView = {
        let iconView = UIImageView(image: UIImage(systemName: Constants.schoolIcon))
        iconView.accessibilityIdentifier = Constants.iconImageIdentifier
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: Constants.mediumFontSize, weight: .semibold)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.titleLabelIdentifier
        label.isAccessibilityElement = true
        return label
    }()
    
    var overviewTextLabel: ExpandableLabel = {
        let label = ExpandableLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: Constants.smallFontSize, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.overviewTextLabelIdentifier
        label.isAccessibilityElement = true
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [iconImage, titleLabel, overviewTextLabel])
        view.accessibilityIdentifier = Constants.stackViewIdentifier
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        view.alignment = .center
        view.distribution = .fill
        return view
    }()
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: nil)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separatorInset = UIEdgeInsets(top: 0, left: Constants.separatorInsetMargin, bottom: 0, right: 0)
        selectionStyle = .none
        layoutMargins = .zero
        
        isAccessibilityElement = false
        contentView.addSubview(stackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        defer { super.updateConstraints() }
        guard customConstraints.isEmpty else { return }
        
        let views = [
            "stackView": stackView
        ]
        
        let metrics = [
            "stackViewMargin": Constants.stackViewMargin
        ]
        
        customConstraints.append(iconImage.heightAnchor.constraint(equalToConstant: Constants.iconHeight))
        customConstraints.append(iconImage.widthAnchor.constraint(equalToConstant: Constants.iconHeight))
        customConstraints.append(iconImage.centerXAnchor.constraint(equalTo: centerXAnchor))
        
        customConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-(stackViewMargin)-[stackView]-(stackViewMargin)-|", metrics: metrics, views: views))
        customConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-(stackViewMargin)-[stackView]-(stackViewMargin)-|", metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(customConstraints)
    }
    
    func configureCell(generalDetails: GeneralDetails) {
        titleLabel.text = generalDetails.schoolName
        accessibilityLabel = Constants.schoolIconImage + Constants.titleAccessibilityTitle + generalDetails.schoolName + Constants.descriptionAccessibilityTitle + generalDetails.overview
    }
}
