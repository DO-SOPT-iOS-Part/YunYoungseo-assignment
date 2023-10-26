//
//  DetailViewController.swift
//  weather-app
//
//  Created by 윤영서 on 10/23/23.
//

import UIKit
import SnapKit
import Then

class DetailViewController: UIViewController {
    
    let detailVerticalScrollView = UIScrollView()
    let todayForecastView = TodayForecastView(timeStrings: ["지금", "1시", "2시", "3시", "4시", "5시", "6시", "7시"],
                                              icons: [UIImage(named: "heavy-rain")!,
                                                      UIImage(named: "heavy-rain")!,
                                                      UIImage(named: "light-rain")!,
                                                      UIImage(named: "rainy-sunny")!,
                                                      UIImage(named: "rainy-sunny")!,
                                                      UIImage(named: "light-rain")!,
                                                      UIImage(named: "cloudy-night")!,
                                                      UIImage(named: "cloudy-night")!],
                                              temperatures: ["15°", "15°", "17°", "16°", "14°", "17°", "15°", "13°"])
    

    let detailBackgroundImageView = UIImageView()
    let locationLabel = UILabel()
    let temperatureLabel = UILabel()
    let conditionLabel = UILabel()
    let temperatureRangeLabel = UILabel()
    
    let cardView = UIView()
    let descriptionLabel = UILabel()
    let seperateLineView = UIView()
    
    let mapButton = UIButton()
    let currentLocationButton = UIButton()
    let paginatorButton = UIButton()
    let listButton = UIButton()
    let bottomMenuLine = UIView() // 얘네 스택에 넣기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setStyle()
        listButton.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        self.cardView.subviews.forEach {
            $0.layoutSubviews()
        }
    }
    
    @objc func listButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

private extension DetailViewController {
    
    func setStyle() {
        self.navigationController?.navigationBar.isHidden = true

        detailVerticalScrollView.do {
            $0.alwaysBounceVertical = true
        }
        
        detailBackgroundImageView.do {
            $0.image = UIImage(named: "background")
            $0.contentMode = .scaleAspectFill
            $0.frame = self.view.bounds
        }
        
        locationLabel.do {
            $0.text = "고양시"
            $0.font = UIFont.sfRegular(size: 36)
            $0.textColor = .white
        }
        
        temperatureLabel.do {
            $0.text = "21°"
            $0.font = UIFont.sfThin(size: 102)
            $0.textColor = .white
        }
        
        conditionLabel.do {
            $0.text = "흐림"
            $0.font = UIFont.sfRegular(size: 24)
            $0.textColor = .white
        }
        
        temperatureRangeLabel.do {
            $0.text = "최고:29° 최저:15°"
            $0.font = UIFont.sfMedium(size: 20)
            $0.textColor = .white
        }
        
        cardView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.006)
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 0.25)
            $0.clipsToBounds = true
        }
        
        descriptionLabel.do {
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            $0.font = UIFont.sfRegular(size: 18)
            $0.textColor = .white
            $0.numberOfLines = 2
            $0.lineBreakMode = .byWordWrapping
        }
        
        seperateLineView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.25)
        }
        
        mapButton.do {
            $0.setImage(UIImage(named: "map"), for: .normal)
        }
        
        currentLocationButton.do {
            $0.setImage(UIImage(named: "current-location"), for: .normal)
        }
        
        paginatorButton.do {
            $0.setImage(UIImage(named: "page"), for: .normal)
        }
        
        listButton.do {
            $0.setImage(UIImage(named: "list-icon"), for: .normal)
            $0.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
        }
        
        bottomMenuLine.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.25)
        }
    }
    
    func setLayout() {
        view.addSubViews(detailBackgroundImageView, detailVerticalScrollView, mapButton, currentLocationButton, paginatorButton, listButton, bottomMenuLine)
        
        detailVerticalScrollView.addSubViews(locationLabel,
                                           temperatureLabel,
                                           conditionLabel,
                                           temperatureRangeLabel,
                                           cardView)
        
        cardView.addSubViews(descriptionLabel,
                             seperateLineView,
                             todayForecastView) //scrollview 추가하기
        
//        todayForecastScrollView.addSubViews(todayForecastView) //스크롤뷰에 스택뷰 쌓기 (두개 더)
        
        detailVerticalScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        todayForecastView.snp.makeConstraints {
            $0.top.equalTo(seperateLineView.snp.bottom)
            $0.leading.equalTo(cardView.snp.leading).inset(20)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
        
        
        locationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(76)
            $0.centerX.equalToSuperview()
        }
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).inset(4)
            $0.leading.equalToSuperview().inset(122)
        }
        conditionLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(154)
            $0.centerX.equalToSuperview()
        }
        temperatureRangeLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.top).inset(188)
            $0.centerX.equalToSuperview()
        }
        cardView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(334)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(212)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.top).inset(10)
            $0.leading.equalTo(cardView.snp.leading).inset(15)
            $0.trailing.equalTo(cardView).offset(-15)
        }
        seperateLineView.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.top).inset(66)
            $0.leading.equalTo(cardView.snp.leading).inset(14)
            $0.height.equalTo(0.5)
            $0.width.equalTo(320)
        }
        mapButton.snp.makeConstraints {
            $0.top.equalTo(bottomMenuLine.snp.top).inset(4)
            $0.leading.equalTo(bottomMenuLine.snp.leading).inset(10)
        }
        currentLocationButton.snp.makeConstraints {
            $0.top.equalTo(bottomMenuLine.snp.top).inset(14)
            $0.trailing.equalTo(paginatorButton.snp.leading).inset(4)
        }
        paginatorButton.snp.makeConstraints {
            $0.top.equalTo(bottomMenuLine.snp.top).inset(14)
            $0.leading.equalTo(bottomMenuLine.snp.leading).inset(189)
        }
        listButton.snp.makeConstraints {
            $0.top.equalTo(bottomMenuLine.snp.top).inset(4)
            $0.trailing.equalTo(bottomMenuLine.snp.trailing).inset(9)
        }
        bottomMenuLine.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-82)
            $0.width.equalToSuperview()
            $0.height.equalTo(0.5)
            $0.centerX.equalToSuperview()
        }
        
        
    }

}
