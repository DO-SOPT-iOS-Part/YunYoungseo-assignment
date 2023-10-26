//
//  ListViewController.swift
//  weather-app
//
//  Created by 윤영서 on 10/21/23.
//

import UIKit
import SnapKit
import Then


class ListViewController: UIViewController {
    
    let weatherCardView = WeatherCardView()
    
    let listVerticalScrollView = UIScrollView()
    let cardVerticalStackView = UIStackView()
    
    let titleLabel = UILabel()
    let settingsIcon = UIImageView()
    let searchBar = UISearchBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setStyle()
        
        weatherCardView.addTarget(self, action: #selector(weatherCardViewTapped), for: .touchUpInside)
    }
    
    @objc func weatherCardViewTapped() {
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true) // View Controller를 Push
    }

}

private extension ListViewController {
    func setLayout() {
        view.addSubViews(listVerticalScrollView)
        
        listVerticalScrollView.addSubViews(titleLabel,
                                           settingsIcon,
                                           searchBar,
                                           weatherCardView)
        
        
        listVerticalScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(53)
            $0.leading.equalToSuperview().offset(20)
        }
        
        settingsIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(331)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(titleLabel).inset(52)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(355)
            $0.height.equalTo(40)
        }
        
        weatherCardView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).inset(-20)
            $0.width.equalTo(335)
            $0.height.equalTo(117)
            $0.centerX.equalToSuperview()
        }
    }
    
    
    func setStyle() {
        
        self.navigationController?.navigationBar.isHidden = true

        self.view.backgroundColor = .black

        listVerticalScrollView.do {
            $0.alwaysBounceVertical = true
        }
        
        titleLabel.do {
            $0.text = "날씨"
            $0.font = UIFont.sfBold(size: 36)
            $0.textColor = .white
        }
        
        settingsIcon.do {
            $0.image = UIImage(named: "settings")
        }
        
        searchBar.do {
            $0.setImage(UIImage(named:"search"), for:.search, state:.normal)
            $0.layer.cornerRadius = 10
            $0.searchTextField.font = UIFont.sfRegular(size: 19)
            $0.searchTextField.textColor = .white
            $0.barTintColor = .clear
            $0.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1).cgColor
            $0.searchTextField.attributedPlaceholder = NSAttributedString(string: "도시 또는 공항 검색",
                                                                          attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        }
    }
}
