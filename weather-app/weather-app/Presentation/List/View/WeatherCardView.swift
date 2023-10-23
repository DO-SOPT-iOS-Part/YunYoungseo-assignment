//
//  WeatherCardView.swift
//  weather-app
//
//  Created by 윤영서 on 10/22/23.
//

import UIKit
import SnapKit

class WeatherCardView: UIView { //물어보자
    let listBackgroundImage: UIImageView = {
        let listImage = UIImageView()
        listImage.image = UIImage(named: "list-image")
        listImage.layer.cornerRadius = 16
        
        return listImage
    }()
    
    let myLocation: UILabel = {
        let label = UILabel()
        label.text = "나의 위치"
        label.font = UIFont.sfBold(size: 24)
        label.textColor = .white
        
        return label
    }()
    
    let currentLocation: UILabel = {
        let label = UILabel()
        label.text = "고양시"
        label.font = UIFont.sfMedium(size: 17)
        label.textColor = .white
        
        return label
    }()
    
    let currentCondition: UILabel = {
        let label = UILabel()
        label.text = "흐림"
        label.font = UIFont.sfMedium(size: 16)
        label.textColor = .white

        return label
    }()
    
    let maxTemperature: UILabel = {
        let label = UILabel()
        label.text = "최고:29°"
        label.font = UIFont.sfMedium(size: 15)
        label.textColor = .white

        return label
    }()
    
    let minTemperature: UILabel = {
        let label = UILabel()
        label.text = "최저:15°"
        label.font = UIFont.sfMedium(size: 15)
        label.textColor = .white

        return label
    }()
    
    let currentTemperature: UILabel = {
        let label = UILabel()
        label.text = "21°"
        label.font = UIFont.sfLight(size: 52)
        label.textColor = .white

        return label
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(listBackgroundImage)
        addSubview(myLocation)
        addSubview(currentLocation)
        addSubview(currentCondition)
        addSubview(maxTemperature)
        addSubview(minTemperature)
        addSubview(currentTemperature)
        
        listBackgroundImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(204)
            $0.leading.equalToSuperview().offset(20)
        }
        
        myLocation.snp.makeConstraints {
            $0.top.equalTo(listBackgroundImage).offset(10)
            $0.leading.equalTo(listBackgroundImage).offset(16)
        }
        
        currentLocation.snp.makeConstraints {
            $0.top.equalTo(listBackgroundImage).offset(44)
            $0.leading.equalTo(listBackgroundImage).offset(16)
        }
        
        currentCondition.snp.makeConstraints {
            $0.bottom.equalTo(listBackgroundImage).offset(-10)
            $0.leading.equalTo(listBackgroundImage).offset(16)
        }
        
        maxTemperature.snp.makeConstraints {
            $0.bottom.equalTo(listBackgroundImage).offset(-10)
            $0.trailing.equalTo(listBackgroundImage).offset(-79)
        }
        
        minTemperature.snp.makeConstraints {
            $0.bottom.equalTo(listBackgroundImage).offset(-10)
            $0.trailing.equalTo(listBackgroundImage).offset(-16)
        }
        
        currentTemperature.snp.makeConstraints {
            $0.top.equalTo(listBackgroundImage).offset(4)
            $0.trailing.equalTo(listBackgroundImage).offset(-16)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
