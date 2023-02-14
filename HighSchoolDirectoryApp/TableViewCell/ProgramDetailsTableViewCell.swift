//
//  ProgramDetailsTableViewCell.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation
import UIKit

class ProgramDetailsTableViewCell: UITableViewCell {
    private var customConstraints = [NSLayoutConstraint]()

    private lazy var iconImage: UIImageView = {
        let iconView = UIImageView(image: UIImage(systemName: Constants.bookIcon))
        iconView.contentMode = .scaleAspectFit
        iconView.accessibilityIdentifier = Constants.iconImageIdentifier
        iconView.accessibilityLabel = Constants.bookIconImage
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.isAccessibilityElement = true
        return iconView
    }()

    private lazy var languageClassesTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constants.smallFontSize, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.languageClassesLabelIdentifier
        label.isAccessibilityElement = true
        return label
    }()
    
    private lazy var languageClassesTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constants.smallFontSize, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.languageClassesTextLabelIdentifier
        label.isAccessibilityElement = true
        return label
    }()

    private lazy var advancedPlacementCoursesTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constants.smallFontSize, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.advancedPlacementCoursesTitleLabelIdentifier
        label.isAccessibilityElement = true
        return label
    }()
    
    private lazy var advancedPlacementCoursesTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constants.smallFontSize, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.advancedPlacementCoursesTextLabelIdentifier
        label.isAccessibilityElement = true
        return label
    }()
    
    private lazy var eligibilityTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constants.smallFontSize, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.eligibilityTitleLabelIdentifier
        label.isAccessibilityElement = true
        return label
    }()

    private lazy var eligibilityTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constants.smallFontSize, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.eligibilityTextLabelIdentifier
        label.isAccessibilityElement = true
        return label
    }()
    private lazy var languageClassesStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [languageClassesTitleLabel, languageClassesTextLabel])
        view.accessibilityIdentifier = Constants.languageClassesStackViewIdentifier
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .firstBaseline
        view.distribution = .fillProportionally
        view.setContentHuggingPriority(.required, for: .vertical)
        return view
    }()
    
    private lazy var advancedPlacementCoursesStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [advancedPlacementCoursesTitleLabel, advancedPlacementCoursesTextLabel])
        view.accessibilityIdentifier = Constants.advancedPlacementCoursesStackViewIdentifier
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .firstBaseline
        view.distribution = .fillProportionally
        view.setContentHuggingPriority(.required, for: .vertical)
        return view
    }()
    
    private lazy var eligibilityStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [eligibilityTitleLabel, eligibilityTextLabel])
        view.accessibilityIdentifier = Constants.eligibilityStackViewIdentifier
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .firstBaseline
        view.distribution = .fill
        view.setContentHuggingPriority(.required, for: .vertical)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [iconImage, languageClassesStackView, advancedPlacementCoursesStackView, eligibilityStackView])
        view.accessibilityIdentifier = Constants.stackViewIdentifier
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
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
        accessibilityElements = [iconImage, languageClassesTitleLabel, languageClassesTextLabel, advancedPlacementCoursesTitleLabel, advancedPlacementCoursesTextLabel, eligibilityTitleLabel, eligibilityTextLabel]
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

        customConstraints.append(languageClassesTitleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor))
        customConstraints.append(advancedPlacementCoursesTitleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor))
        customConstraints.append(eligibilityTitleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor))
        
        customConstraints.append(languageClassesTextLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor))
        customConstraints.append(advancedPlacementCoursesTextLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor))
        customConstraints.append(eligibilityTextLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor))
        
        customConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-(stackViewMargin)-[stackView]-(stackViewMargin)-|", metrics: metrics, views: views))
        customConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-(stackViewMargin)-[stackView]-(stackViewMargin)-|", metrics: metrics, views: views))

        NSLayoutConstraint.activate(customConstraints)
    }
    
    func configureCell(programOverview: ProgramOverview) {
        if let value = programOverview.getValueRow(.languageClasses).value {
            languageClassesTitleLabel.isHidden = value.isEmpty
            languageClassesTextLabel.isHidden = value.isEmpty
            languageClassesTitleLabel.text = programOverview.getValueRow(.languageClasses).title
            languageClassesTextLabel.text = programOverview.getValueRow(.languageClasses).value
        }
        if let value = programOverview.getValueRow(.advancedPlacementCourses).value {
            advancedPlacementCoursesTitleLabel.isHidden = value.isEmpty
            advancedPlacementCoursesTextLabel.isHidden = value.isEmpty
            advancedPlacementCoursesTitleLabel.text = programOverview.getValueRow(.advancedPlacementCourses).title
            advancedPlacementCoursesTextLabel.text = programOverview.getValueRow(.advancedPlacementCourses).value
        }
        
        if let value = programOverview.getValueRow(.eligibility).value {
            eligibilityTitleLabel.isHidden = value.isEmpty
            eligibilityTextLabel.isHidden = value.isEmpty
            eligibilityTitleLabel.text = programOverview.getValueRow(.eligibility).title
            eligibilityTextLabel.text = programOverview.getValueRow(.eligibility).value
        }
    }
}
