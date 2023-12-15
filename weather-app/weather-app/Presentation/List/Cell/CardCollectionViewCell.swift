//
//  CardCollectionViewCell.swift
//  weather-app
//
//  Created by 윤영서 on 11/2/23.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CardCollectionViewCell"
    
    private let listBackgroundImage = UIImageView()
    
    private let location = UILabel()
    private var currentTime = UILabel()
    private let currentCondition = UILabel()
    private let maxTemperature = UILabel()
    private let minTemperature = UILabel()
    private let currentTemperature = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        self.contentView.addSubViews(listBackgroundImage)
        
        listBackgroundImage.addSubViews(location,
                                        currentTime,
                                        currentCondition,
                                        maxTemperature,
                                        minTemperature,
                                        currentTemperature)
        
        listBackgroundImage.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
        
        location.snp.makeConstraints {
            $0.top.equalTo(self).offset(10)
            $0.leading.equalTo(self).offset(16)
        }
        
        currentTime.snp.makeConstraints {
            $0.top.equalTo(self).offset(44)
            $0.leading.equalTo(self).offset(16)
        }
        
        currentCondition.snp.makeConstraints {
            $0.bottom.equalTo(self).offset(-10)
            $0.leading.equalTo(self).offset(16)
        }
        
        maxTemperature.snp.makeConstraints {
            $0.bottom.equalTo(self).offset(-10)
            $0.trailing.equalTo(self).offset(-79)
        }
        
        minTemperature.snp.makeConstraints {
            $0.bottom.equalTo(self).offset(-10)
            $0.trailing.equalTo(self).offset(-16)
        }
        
        currentTemperature.snp.makeConstraints {
            $0.top.equalTo(self).offset(4)
            $0.trailing.equalTo(self).offset(-16)
        }
    }
    
    private func setStyle() {
        
        listBackgroundImage.do {
            $0.image = UIImage(named: "background")
            $0.layer.cornerRadius = 16
            $0.isUserInteractionEnabled = true
        }
        
        location.setupLabel(font: .sfBold(size: 24), textColor: .white)
        currentTime.setupLabel(font: .sfMedium(size: 17), textColor: .white)
        currentCondition.setupLabel(font: .sfMedium(size: 16), textColor: .white)
        maxTemperature.setupLabel(font: .sfMedium(size: 15), textColor: .white)
        minTemperature.setupLabel(font: .sfMedium(size: 15), textColor: .white)
        currentTemperature.setupLabel(font: .sfLight(size: 52), textColor: .white)
    }
    
    func configureCell(data: WeatherListModel) {
        location.text = data.cityName
        currentTime.text = String().changeListTime()
        currentCondition.text = data.condition
        maxTemperature.text = "최고:\(data.maxTemp)°"
        minTemperature.text = "최저:\(data.maxTemp)°"
        currentTemperature.text = "\(data.temperature)°"
    }
}
