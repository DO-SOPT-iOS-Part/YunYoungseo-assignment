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
            $0.top.equalTo(locationLabel.snp.top).inset(154) //오옷
            $0.centerX.equalTo(self)
        }
        temperatureStackView.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(188)
            $0.centerX.equalTo(self)
        }
    }
    
    private func setStyle() {
        locationLabel.do {
            $0.font = .sfRegular(size: 36)
            $0.textColor = .white
        }
        
        temperatureLabel.do {
            $0.font = .sfThin(size: 102)
            $0.textColor = .white
        }
        
        conditionLabel.do {
            $0.font = .sfRegular(size: 24)
            $0.textColor = .white
        }
        
        temperatureStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .equalSpacing
        }
        
        minTemperatureLabel.do {
            $0.font = .sfMedium(size: 20)
            $0.textColor = .white
        }
        
        maxTemperatureLabel.do {
            $0.font = .sfMedium(size: 20)
            $0.textColor = .white
        }
        
    }
    
    func bindData(data: CardCollectionData) {
        self.locationLabel.text = data.location
        self.temperatureLabel.text = data.temperature
        self.conditionLabel.text = data.condition
        self.minTemperatureLabel.text = data.minTemp
        self.maxTemperatureLabel.text = data.maxTemp
    }
}
//
//extension DetailCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tenDaysDummy.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tenDaysForecastTableView.dequeueReusableCell(withIdentifier: TenDaysForecastTableViewCell.identifier,
//                                                                      for: indexPath) as? TenDaysForecastTableViewCell else {return UITableViewCell()}
//        cell.bindData(data: tenDaysDummy[indexPath.row])
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: WeatherTableViewHeader.identifier) as? WeatherTableViewHeader
//            
//            return headerView
//        }
//        return nil // 다른 섹션에는 헤더를 추가하지 않음
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 10.0
//        }
//        return 0.0
//        
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 55
//    }
//    
//}
//
//extension DetailCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return todayDummy.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let item = todayForecastCollectioinView.dequeueReusableCell(withReuseIdentifier: TodayForecastCollectionViewCell.identifier, for: indexPath) as? TodayForecastCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        item.bindData(data: todayDummy[indexPath.row])
//        
//        return item
//    }
//}
