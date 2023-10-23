//
//  ListViewController.swift
//  weather-app
//
//  Created by 윤영서 on 10/21/23.
//

import UIKit
import SnapKit
ㅑ
class ListViewController: UIViewController {
    
    let weatherListView = WeatherListView()
    let weatherCardView = WeatherCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        
        view.backgroundColor = .black
        
        view.addSubview(weatherListView)
        view.addSubview(weatherCardView)
        
        weatherListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        weatherCardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setLayout() {
        // here
    }
    
}
