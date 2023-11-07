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
    
    private let detailVerticalScrollView = UIScrollView()
    private let detailContentView = UIView()
    
    let todayForecastView = TodayForecastView(timeStrings: ["지금", "11시", "12시", "1시", "2시", "3시", "4시", "5시"],
                                              icons: [UIImage(named: "heavy-rain")!,
                                                      UIImage(named: "heavy-rain")!,
                                                      UIImage(named: "light-rain")!,
                                                      UIImage(named: "rainy-sunny")!,
                                                      UIImage(named: "rainy-sunny")!,
                                                      UIImage(named: "light-rain")!,
                                                      UIImage(named: "cloudy-night")!,
                                                      UIImage(named: "cloudy-night")!],
                                              temperatures: ["15°", "15°", "17°", "16°", "14°", "17°", "15°", "13°"])
    
    private var dummyData = TenDaysForecastData.tenDaysForecastData
    
    private let detailBackgroundImageView = UIImageView()
    private let locationLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let conditionLabel = UILabel()
    private let temperatureRangeLabel = UILabel()
    
    private let cardView = UIView()
    private let descriptionLabel = UILabel()
    private let seperateLineView = UIView()
    
    private let bottomBarView = UIView()
    private let mapButton = UIButton()
    private let currentLocationButton = UIButton()
    private let paginatorButton = UIButton()
    private let listButton = UIButton()
    
    private let tenDaysForecastTableView = UITableView(frame: .zero, style: .plain)
    
    private let data: CardCollectionData

    init(data: CardCollectionData) {
            self.data = data
            super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setStyle()
        addTarget()
        setTableViewConfig()
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
    
    func setTableViewConfig() {
        self.tenDaysForecastTableView.register(TenDaysForecastTableViewCell.self,
                                               forCellReuseIdentifier: TenDaysForecastTableViewCell.identifier)
        self.tenDaysForecastTableView.register(WeatherTableViewHeader.self, forHeaderFooterViewReuseIdentifier: WeatherTableViewHeader.identifier)
        self.tenDaysForecastTableView.delegate = self
        self.tenDaysForecastTableView.dataSource = self
        
    }
    
    func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
        
        detailBackgroundImageView.do {
            $0.image = UIImage(named: "background")
            $0.contentMode = .scaleAspectFill
            $0.frame = self.view.bounds
        }
        
        locationLabel.do {
            $0.text = "고양시"
            $0.font = .sfRegular(size: 36)
            $0.textColor = .white
        }
        
        temperatureLabel.do {
            $0.text = "21°"
            $0.font = .sfThin(size: 102)
            $0.textColor = .white
        }
        
        conditionLabel.do {
            $0.text = "흐림"
            $0.font = .sfRegular(size: 24)
            $0.textColor = .white
        }
        
        temperatureRangeLabel.do {
            $0.text = "최고:29° 최저:15°"
            $0.font = .sfMedium(size: 20)
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
            $0.font = .sfRegular(size: 18)
            $0.textColor = .white
            $0.numberOfLines = 2
            $0.lineBreakMode = .byWordWrapping
        }
        
        bottomBarView.do {
            $0.layer.backgroundColor = UIColor(red: 0.165, green: 0.188, blue: 0.251, alpha: 1).cgColor
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
        
        tenDaysForecastTableView.do {
            $0.separatorColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            $0.separatorStyle = .singleLine
            $0.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            $0.backgroundColor = UIColor(red: 0.175, green: 0.201, blue: 0.249, alpha: 1)
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        }
    }
    
    
    func setLayout() {
        view.addSubViews(detailBackgroundImageView, detailVerticalScrollView, bottomBarView)
        
        detailVerticalScrollView.addSubViews(detailContentView)
        
        detailContentView.addSubViews(locationLabel,
                                      temperatureLabel,
                                      conditionLabel,
                                      temperatureRangeLabel,
                                      cardView,
                                      tenDaysForecastTableView)
        
        cardView.addSubViews(descriptionLabel,
                             seperateLineView,
                             todayForecastView)
        
        bottomBarView.addSubViews(mapButton, currentLocationButton, paginatorButton, listButton)
        
        detailVerticalScrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        detailContentView.snp.makeConstraints {
            $0.width.equalTo(detailVerticalScrollView)
            $0.height.greaterThanOrEqualTo(view).priority(.low)
            $0.edges.equalTo(detailVerticalScrollView)
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
        
        bottomBarView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(82)
        }
        
        mapButton.snp.makeConstraints {
            $0.top.equalTo(bottomBarView.snp.top).inset(4)
            $0.leading.equalTo(bottomBarView.snp.leading).inset(10)
        }
        
        currentLocationButton.snp.makeConstraints {
            $0.top.equalTo(bottomBarView.snp.top).inset(14)
            $0.trailing.equalTo(paginatorButton.snp.leading).inset(4)
        }
        
        paginatorButton.snp.makeConstraints {
            $0.top.equalTo(bottomBarView.snp.top).inset(14)
            $0.leading.equalTo(bottomBarView.snp.leading).inset(189)
        }
        
        listButton.snp.makeConstraints {
            $0.top.equalTo(bottomBarView.snp.top).inset(4)
            $0.trailing.equalTo(bottomBarView.snp.trailing).inset(9)
        }
        
        tenDaysForecastTableView.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.bottom.equalToSuperview().inset(50) //bottom을 맞추자
            $0.height.equalTo(690) //오옷
        }
    }
    
    func addTarget() {
        listButton.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
    }
}

//extension DetailViewController: UITableViewDelegate {} 오옷

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tenDaysForecastTableView.dequeueReusableCell(withIdentifier: TenDaysForecastTableViewCell.identifier,
                                                                      for: indexPath) as? TenDaysForecastTableViewCell else {return UITableViewCell()}
        cell.bindData(data: dummyData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: WeatherTableViewHeader.identifier) as? WeatherTableViewHeader
    
            return headerView
        }
        return nil // 다른 섹션에는 헤더를 추가하지 않음
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10.0
        }
        return 0.0
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
