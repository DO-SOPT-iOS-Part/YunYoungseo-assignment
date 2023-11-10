//
//  HorizontalContainerCollectionViewCell.swift
//  weather-app
//
//  Created by 윤영서 on 11/9/23.
//

import UIKit

class HorizontalContainerCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HorizontalContainerCollectionViewCell"
    
    lazy var horizontalCollectionView = UICollectionView (frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private var todayDummy = TodayForecastData.todayForecastData
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
        setStyle()
        setCollectionViewLayout()
        setCollectionViewConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews() {
        contentView.addSubview(horizontalCollectionView)
    }
    
    func setConstraints() {
        horizontalCollectionView.snp.makeConstraints {
            $0.leading.equalTo(contentView).inset(20)
            $0.trailing.equalTo(contentView).inset(20)
            $0.top.equalTo(contentView)
            $0.bottom.equalTo(contentView)
        }
    }
    
    func setStyle() {
        horizontalCollectionView.do {
            $0.backgroundColor =  UIColor(red: 0.175, green: 0.201, blue: 0.249, alpha: 1)
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
            $0.isScrollEnabled = true
        }
    }
    
    func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 22
        self.horizontalCollectionView.collectionViewLayout = flowLayout
    }
    
    func setCollectionViewConfig() {
        self.horizontalCollectionView.register(TodayForecastCollectionViewCell.self,
                                               forCellWithReuseIdentifier: TodayForecastCollectionViewCell.identifier)
        
        self.horizontalCollectionView.delegate = self
        self.horizontalCollectionView.dataSource = self
        
    }
}

extension HorizontalContainerCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = horizontalCollectionView.dequeueReusableCell(withReuseIdentifier: TodayForecastCollectionViewCell.identifier, for: indexPath) as? TodayForecastCollectionViewCell else { return UICollectionViewCell() }
        item.bindData(data: todayDummy[indexPath.row])
        return item
    }

}


extension HorizontalContainerCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44, height: 146)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
}


