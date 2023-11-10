//
//  WeatherTableViewHeader.swift
//  weather-app
//
//  Created by 윤영서 on 10/31/23.
//

import UIKit


class WeatherTableViewHeader: UITableViewHeaderFooterView {
    static let identifier = "WeatherTableViewHeader"
    
    let headerStackView = UIStackView()
    let calenderImageView = UIImageView()
    let headerTextLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        
        headerStackView.do {
            $0.axis = .horizontal
            $0.spacing = 5
            $0.distribution = .equalSpacing
        }
        
        calenderImageView.do {
            $0.image = UIImage(systemName: "calendar")
            $0.tintColor = UIColor.lightGray
        }
        
        headerTextLabel.do {
            $0.text = "10일간의 일기예보"
            $0.font = .sfMedium(size: 15)
            $0.textColor = UIColor.lightGray
        }
    }
    
    private func setLayout() {
        
        contentView.addSubViews(headerStackView)
        headerStackView.addArrangedSubviews(calenderImageView, headerTextLabel)
        
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(-10)
            $0.leading.equalTo(contentView.snp.leading).offset(20)
        }
    
    }
}
