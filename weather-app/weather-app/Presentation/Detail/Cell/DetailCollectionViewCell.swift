//
//  DetailCollectionViewCell.swift
//  weather-app
//
//  Created by 윤영서 on 11/7/23.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "DetailCollectionViewCell"
    
    private let locationLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let conditionLabel = UILabel()
    private let temperatureStackView = UIStackView()
    private let minTemperatureLabel = UILabel()
    private let maxTemperatureLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayout() {
        self.contentView.addSubViews(locationLabel, temperatureLabel, conditionLabel, temperatureStackView)
        
        self.temperatureStackView.addArrangedSubviews(minTemperatureLabel, maxTemperatureLabel)
        
        self.contentView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(78)
            $0.height.equalTo(212)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.centerX.equalTo(self)
        }
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).inset(4)
            $0.centerX.equalTo(self)
        }
        conditionLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(154) 
            $0.centerX.equalTo(self)
        }
        temperatureStackView.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(188)
            $0.centerX.equalTo(self)
        }
    }
    
    private func setStyle() {
        locationLabel.setupLabel(font: .sfRegular(size: 36), textColor: .white)
        
        temperatureLabel.setupLabel(font: .sfThin(size: 102), textColor: .white)
        
        conditionLabel.setupLabel(font: .sfRegular(size: 24), textColor: .white)
        
        temperatureStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .equalSpacing
        }
        
        minTemperatureLabel.setupLabel(font: .sfMedium(size: 20), textColor: .white)

        maxTemperatureLabel.setupLabel(font: .sfMedium(size: 20), textColor: .white)
    }
}
