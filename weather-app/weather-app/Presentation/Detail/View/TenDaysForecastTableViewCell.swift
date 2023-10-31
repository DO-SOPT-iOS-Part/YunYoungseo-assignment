//
//  TenDaysForecastTableViewCell.swift
//  weather-app
//
//  Created by 윤영서 on 10/30/23.
//

import UIKit


class TenDaysForecastTableViewCell: UITableViewCell {
    
    static let identifier: String = "TenDaysForecastTableViewCell"
    
    private let dayNameLabel = UILabel()
    
    private let conditionStackView = UIStackView()
    private let conditionIcon = UIImageView()
    private let precipPercentLabel = UILabel()
    
    private let minTempLabel = UILabel()
    private let tempGradientView = UIImageView()
    private let maxTempLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        self.contentView.addSubViews(dayNameLabel, conditionStackView, minTempLabel, tempGradientView, maxTempLabel)
        
        conditionStackView.addArrangedSubviews(conditionIcon, precipPercentLabel)
        
        dayNameLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(14)
            $0.leading.equalTo(contentView).offset(16)
        }
        
        conditionStackView.snp.makeConstraints {
            $0.top.equalTo(dayNameLabel)
            $0.leading.equalTo(dayNameLabel.snp.leading).offset(65)
        }
        
        minTempLabel.snp.makeConstraints {
            $0.top.equalTo(dayNameLabel)
            $0.leading.equalTo(dayNameLabel.snp.leading).offset(114)
        }
        
        tempGradientView.snp.makeConstraints {
            $0.width.equalTo(108)
            $0.height.equalTo(12)
            $0.top.equalTo(contentView).offset(22)
            $0.trailing.equalTo(contentView).offset(-58)
        }
        
        maxTempLabel.snp.makeConstraints {
            $0.top.equalTo(dayNameLabel)
            $0.trailing.equalTo(contentView).offset(-17)
        }
    }
    
    
    private func setStyle() { //아이콘 넣어야해
        dayNameLabel.do {
            $0.font = .sfMedium(size: 22)
            $0.textColor = .white
        }
        
        conditionStackView.do {
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.spacing = 0.85
            $0.alignment = .center
        }
        
        precipPercentLabel.do {
            $0.font = .sfMedium(size: 15)
            $0.textColor = UIColor(red: 0.506, green: 0.812, blue: 0.98, alpha: 1)
        }
        
        minTempLabel.do {
            $0.font = .sfMedium(size: 22)
            $0.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        maxTempLabel.do {
            $0.font = .sfMedium(size: 22)
            $0.textColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func bindData(data: TenDaysForecastData) {
        self.dayNameLabel.text = data.day
        self.conditionIcon.image = UIImage(named: data.icon)
        self.precipPercentLabel.text = data.precip
        self.minTempLabel.text = data.minTemp
        self.tempGradientView.image = UIImage(named: data.tempImage)
        self.maxTempLabel.text = data.maxTemp
    }
}
