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
    
    private let detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let detailBackgroundImageView = UIImageView()
    
    private let bottomBarView = UIView()
    private let mapButton = UIButton()
    private let currentLocationButton = UIButton()
    private let paginatorButton = UIButton()
    private let listButton = UIButton()
    
    private let detailDummy: CardCollectionData
    private var tenDaysDummy = TenDaysForecastData.tenDaysForecastData
    private var todayDummy = TodayForecastData.todayForecastData
    
    init(data: CardCollectionData) {
        self.detailDummy = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        setStyle()
        addTarget()
        setCollectionViewConfig()
        setDetailCollectionViewLayout()
        //        setTodayForecastCollectionViewLayout()
    }
    
    @objc func listButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

private extension DetailViewController {
    
    func setCollectionViewConfig() {
        self.detailCollectionView.register(DetailCollectionViewCell.self,
                                           forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        
        self.detailCollectionView.register(HorizontalContainerCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalContainerCollectionViewCell.identifier)
        
        self.detailCollectionView.register(TenDaysForecastCollectionViewCell.self, forCellWithReuseIdentifier: TenDaysForecastCollectionViewCell.identifier)
        
        //        self.detailCollectionView.register(TodayCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TodayCollectionHeaderView.identifier)
        
        self.detailCollectionView.register(TenDaysCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TenDaysCollectionHeaderView.identifier)
        
        self.detailCollectionView.delegate = self
        self.detailCollectionView.dataSource = self
    }
    
    
    func setViews() {
        view.addSubViews(detailBackgroundImageView, detailCollectionView, bottomBarView)
        bottomBarView.addSubViews(mapButton, currentLocationButton, paginatorButton, listButton)
    }
    
    func setConstraints() {
        
        detailCollectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
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
    }
    
    func setStyle() {
        self.navigationController?.navigationBar.isHidden = true
        
        detailCollectionView.do {
            $0.backgroundColor = .clear
        }
        
        detailBackgroundImageView.do {
            $0.image = UIImage(named: "background")
            $0.contentMode = .scaleAspectFill
            $0.frame = self.view.bounds
        }
        
        bottomBarView.do {
            $0.layer.backgroundColor = UIColor(red: 0.165, green: 0.188, blue: 0.251, alpha: 1).cgColor
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
    }
    
    func setDetailCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        self.detailCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    func addTarget() {
        listButton.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
    }
}


extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return tenDaysDummy.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 0:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as?
                    DetailCollectionViewCell else { return UICollectionViewCell() }
            item.bindData(data: detailDummy)
            
            return item
            
        case 1:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: HorizontalContainerCollectionViewCell.identifier, for: indexPath) as? HorizontalContainerCollectionViewCell else { return UICollectionViewCell() }
            return item
            
        case 2:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: TenDaysForecastCollectionViewCell.identifier, for: indexPath) as? TenDaysForecastCollectionViewCell else { return UICollectionViewCell() }
            item.bindData(data: tenDaysDummy[indexPath.row])
            return item
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 2 {
            let header = detailCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TenDaysCollectionHeaderView.identifier, for: indexPath)
            return header
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 2 {
            return CGSize(width: 335, height: 38)
        } else {
            return CGSize.zero // 다른 섹션은 header가 없음
        }
    }

}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let itemWidthOrHeight: CGFloat = 300
            return CGSize(width: 352, height: itemWidthOrHeight)
        case 1:
            let itemWidthOrHeight: CGFloat = 212
            return CGSize(width: collectionView.frame.size.width, height: itemWidthOrHeight)
        case 2:
            let itemWidthOrHeight: CGFloat = 55
            return CGSize(width: 335, height: itemWidthOrHeight)
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInsets = UIEdgeInsets.zero
        switch section {
        case 0:
            return UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0)
        case 1:
            return UIEdgeInsets(top: 0, left: 8, bottom: 16, right: 0)
        case 2:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            break
        }
        return sectionInsets
    }
}
