//
//  StatisticsTableViewCell.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation
import UIKit

class StatisticsTableViewCell: UITableViewCell {
    private var customConstraints = [NSLayoutConstraint]()
    
    private lazy var iconImage: UIImageView = {
        let iconView = UIImageView(image: UIImage(systemName: Constants.graduationCapIcon))
        iconView.contentMode = .scaleAspectFit
        iconView.accessibilityIdentifier = Constants.iconImageIdentifier
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private lazy var graduationRateTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: Constants.smallFontSize, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.graduationRateTitleLabelIdentifier
        return label
    }()
    
    private lazy var graduationRateTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constants.largeFontSize, weight: .semibold)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.graduationRateTextLabelIdentifier
        return label
    }()
    
    private lazy var collegeCareerRateTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: Constants.smallFontSize, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.collegeCareerRateTitleLabelIdentifier
        return label
    }()
    
    private lazy var collegeCareerRateTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: Constants.largeFontSize, weight: .semibold)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityIdentifier = Constants.collegeCareerRateTextLabelIdentifier
        return label
    }()
    
    private lazy var graduationRateStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [graduationRateTextLabel, graduationRateTitleLabel])
        view.accessibilityIdentifier = Constants.graduationRateStackViewIdentifier
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        view.alignment = .center
        view.distribution = .fill
        view.setContentHuggingPriority(.required, for: .vertical)
        return view
    }()
    
    private lazy var collegeCareerRateStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [collegeCareerRateTextLabel, collegeCareerRateTitleLabel])
        view.accessibilityIdentifier = Constants.collegeCareerRateTextStackViewIdentifier
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        view.alignment = .center
        view.distribution = .fill
        view.setContentHuggingPriority(.required, for: .vertical)
        return view
    }()
    
    private lazy var ratesStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [graduationRateStackView, collegeCareerRateStackView])
        view.accessibilityIdentifier = Constants.ratesStackViewIdentifier
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 20
        view.alignment = .center
        view.distribution = .fill
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [iconImage, ratesStackView])
        view.accessibilityIdentifier = Constants.stackViewIdentifier
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 5
        view.alignment = .center
        view.distribution = .fill
        view.isAccessibilityElement = true
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
        accessibilityElements = [stackView]
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
    
    func configureCell(statisticsOverview: StatisticsOverview) {
        graduationRateTitleLabel.text = Constants.graduationRate
        graduationRateTextLabel.text = statisticsOverview.graduationRate.convertStringToPercent()

        collegeCareerRateTitleLabel.text = Constants.collegeCareerRate
        collegeCareerRateTextLabel.text = statisticsOverview.collegeCareerRate.convertStringToPercent()
        
        stackView.accessibilityLabel = Constants.graduationCapIconImage + Constants.graduationRateAccessibilityTitle + statisticsOverview.graduationRate.convertStringToPercent() + Constants.collegeCareerRateAccessibilityTitle + statisticsOverview.collegeCareerRate.convertStringToPercent()
    }
}
