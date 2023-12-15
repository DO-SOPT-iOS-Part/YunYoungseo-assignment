//
//  TodayCollectionHeaderView.swift
//  weather-app
//
//  Created by 윤영서 on 11/10/23.
//

import UIKit

class TodayCollectionHeaderView: UICollectionReusableView {
    static let identifier: String = "TodayCollectionHeaderView"
    
    private let headerStackView = UIStackView()
    private let watchImageView = UIImageView()
    private let headerTextLabel = UILabel()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        self.addSubViews(headerStackView)
        headerStackView.addArrangedSubviews(watchImageView, headerTextLabel)
        
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.leading.equalTo(self.snp.leading).offset(20)
        }
    }
    
    func setStyle() {
        headerStackView.do {
            $0.axis = .horizontal
            $0.spacing = 5
            $0.distribution = .equalSpacing
        }
        
        watchImageView.do {
            $0.image = UIImage(systemName: "clock")
            $0.tintColor = UIColor.lightGray
        }
        
        headerTextLabel.setupLabel(font: .sfMedium(size: 15), text: "시간별 일기예보", textColor: UIColor.lightGray)
    }
}
