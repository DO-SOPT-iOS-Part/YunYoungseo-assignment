//
//  TenDaysForecastCollectionViewCell.swift
//  weather-app
//
//  Created by 윤영서 on 11/9/23.
//

import UIKit

class TenDaysForecastCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TenDaysForecastCollectionViewCell"
    
    private let dayNameLabel = UILabel()
    
    private let conditionStackView = UIStackView()
    private let conditionIcon = UIImageView()
    private let precipPercentLabel = UILabel()
    
    private let minTempLabel = UILabel()
    private let tempGradientView = UIImageView()
    private let maxTempLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        self.contentView.addSubViews(dayNameLabel, conditionStackView, minTempLabel, tempGradientView, maxTempLabel)
        
        conditionStackView.addArrangedSubviews(conditionIcon, precipPercentLabel) //오옷
        
        dayNameLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(14)
            $0.leading.equalTo(contentView).offset(16)
        }
        
        conditionStackView.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.centerX.equalTo(contentView).offset(-65)
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
    
    
    private func setStyle() {
        dayNameLabel.do {
            $0.font = .sfMedium(size: 22)
            $0.textColor = .white
        }
        
        conditionStackView.do {
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.alignment = .center
        }
        
        conditionIcon.do {
            $0.tintColor = .white
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
        self.conditionIcon.image = UIImage(systemName: data.icon)
        self.precipPercentLabel.text = data.precip
        self.minTempLabel.text = data.minTemp
        self.tempGradientView.image = UIImage(named: data.tempImage)
        self.maxTempLabel.text = data.maxTemp
    }
}
