//
//  TodayForecastCollectionViewCell.swift
//  weather-app
//
//  Created by 윤영서 on 11/7/23.
//

import UIKit

class TodayForecastCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TodayForecastCollectionViewCell"
        
    private let todayWeatherStackView = UIStackView()
    private let timeLabel = UILabel()
    private let conditionView = UIImageView()
    private let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        self.contentView.addSubViews(todayWeatherStackView)
        self.todayWeatherStackView.addArrangedSubviews(timeLabel, conditionView, temperatureLabel)
    
        todayWeatherStackView.snp.makeConstraints {
            $0.center.equalTo(contentView)
        }
    }
    
    private func setStyle() {
        
        todayWeatherStackView.do {
            $0.axis = .vertical
            $0.spacing = 14
            $0.distribution = .equalSpacing
        }
        
        timeLabel.do {
            $0.font = .sfMedium(size: 17)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
        temperatureLabel.do {
            $0.font = .sfMedium(size: 17)
            $0.textColor = .white
            $0.textAlignment = .center
        }
        
        self.contentView.do {
            $0.backgroundColor = .clear
        }
    }
    
    func bindData(data: TodayForecastData) {
//        self.descriptionLabel.text = data.description
        self.timeLabel.text = data.time
        self.temperatureLabel.text = data.temperature
        self.conditionView.image = UIImage(named: data.conditionIcon)
    }
    
}

