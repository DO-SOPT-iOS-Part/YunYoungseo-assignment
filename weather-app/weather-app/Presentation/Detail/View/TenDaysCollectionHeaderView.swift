//
//  TenDaysCollectionHeaderView.swift
//  weather-app
//
//  Created by 윤영서 on 11/10/23.
//

import UIKit

class TenDaysCollectionHeaderView: UICollectionReusableView {
    static let identifier: String = "TenDaysCollectionHeaderView"
    
    private let headerStackView = UIStackView()
    private let calenderImageView = UIImageView()
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
        headerStackView.addArrangedSubviews(calenderImageView, headerTextLabel)
        
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.leading.equalTo(self.snp.leading).offset(40)
        }
    }
    
    func setStyle() {
        headerStackView.do {
            $0.axis = .horizontal
            $0.spacing = 5
            $0.distribution = .equalSpacing
        }
        
        calenderImageView.do {
            $0.image = UIImage(systemName: "calendar")
            $0.tintColor = UIColor.lightGray
        }
        
        headerTextLabel.do {
            $0.text = "10일간의 일기예보"
            $0.font = .sfMedium(size: 15)
            $0.textColor = UIColor.lightGray 
        }
    }
}
