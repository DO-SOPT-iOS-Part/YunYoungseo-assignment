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
    
    private let myLocation = UILabel()
    private let currentLocation = UILabel()
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
        
        listBackgroundImage.addSubViews(myLocation,
                                        currentLocation,
                                        currentCondition,
                                        maxTemperature,
                                        minTemperature,
                                        currentTemperature)
        
        listBackgroundImage.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
        
        myLocation.snp.makeConstraints {
            $0.top.equalTo(self).offset(10)
            $0.leading.equalTo(self).offset(16)
        }
        
        currentLocation.snp.makeConstraints {
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
            $0.layer.cornerRadius = 16
            $0.isUserInteractionEnabled = true // 오옷 pop / push  확인해야해
        }
        
        myLocation.do {
            $0.font = .sfBold(size: 24)
            $0.textColor = .white
        }
        
        currentLocation.do {
            $0.font = .sfMedium(size: 17)
            $0.textColor = .white
        }
        
        currentCondition.do {
            $0.font = .sfMedium(size: 16)
            $0.textColor = .white
        }
        
        maxTemperature.do {
            $0.font = .sfMedium(size: 15)
            $0.textColor = .white
        }
        minTemperature.do {
            $0.font = .sfMedium(size: 15)
            $0.textColor = .white
        }
        currentTemperature.do {
            $0.font = .sfLight(size: 52)
            $0.textColor = .white
        }
    }
    
    func bindData(data: CardCollectionData) {
        self.listBackgroundImage.image = UIImage(named: data.backgroundImage)
        self.myLocation.text = data.location
        self.currentLocation.text = data.time
        self.currentCondition.text = data.condition
        self.minTemperature.text = data.minTemp
        self.maxTemperature.text = data.maxTemp
        self.currentTemperature.text = data.temperature
        
    }
}
