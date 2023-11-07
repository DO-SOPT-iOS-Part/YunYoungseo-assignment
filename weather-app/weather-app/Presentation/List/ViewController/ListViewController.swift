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
    
    var filteredData: [CardCollectionData] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    let menuButton = UIBarButtonItem(image: UIImage(named: "settings"))
    
    private let cardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var cardCollectionList: [CardCollectionData] = CardCollectionData.cardCollectionData
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setLayout()
        setStyle()
        setCollectionViewConfig()
        setCollectionViewLayout()
        setSearchController()
        setNavigationBar()
        hideKeyboardWhenTappedAround()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
//    @objc func weatherCardViewTapped() {
//        let detailViewController = DetailViewController()
//        self.navigationController?.pushViewController(detailViewController, animated: true)
//    }
}

private extension ListViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setLayout() {
        self.view.addSubview(cardCollectionView)
        
        cardCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = .black
        
        cardCollectionView.do {
            $0.backgroundColor = .clear
        }
        
        searchController.searchBar.do {
            $0.placeholder = "도시 또는 공항 검색"
            $0.barTintColor = .clear
            $0.searchTextField.textColor = .white
            $0.searchTextField.font = .sfRegular(size: 19)
        }
        
        menuButton.do {
            $0.tintColor = .white
        }
        
    }
    
    func setCollectionViewConfig() {
        self.cardCollectionView.register(CardCollectionViewCell.self,
                                         forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        self.cardCollectionView.delegate = self
        self.cardCollectionView.dataSource = self
    }
    
    func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        //        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        flowLayout.itemSize = CGSize(width: 335, height: 117)
        //            flowLayout.minimumLineSpacing = 3
        //            flowLayout.minimumInteritemSpacing = 3
        self.cardCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    func setSearchController() {
        searchController.do {
            $0.searchResultsUpdater = self
            
            $0.obscuresBackgroundDuringPresentation = true
            $0.hidesNavigationBarDuringPresentation = false
            $0.definesPresentationContext = true
        }
    }
    
    func setNavigationBar() {
        let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.sfBold(size: 36),
            .foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.largeTitleTextAttributes = titleTextAttributes
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.title = "날씨"
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.rightBarButtonItem = menuButton
        self.navigationController?.navigationBar.barTintColor = UIColor.darkGray.withAlphaComponent(0.01)
        //        if let navigationBar = self.navigationController?.navigationBar {
        //            navigationBar.barTintColor = UIColor.clear // 배경색을 투명하게 설정
        //            navigationBar.setBackgroundImage(UIImage(), for: .default)
        //            navigationBar.shadowImage = UIImage() // 네비게이션 바의 그림자 제거
        //            navigationBar.isTranslucent = true // 투명 모드 활성화
        //        }
    }
    
}
extension ListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selectedData: CardCollectionData
            if searchController.isActive {
                selectedData = filteredData[indexPath.row]
            } else {
                selectedData = cardCollectionList[indexPath.row]
            }
            // 선택된 데이터를 DetailViewController에 전달하고 화면을 전환
            let detailViewController = DetailViewController(data: selectedData)
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
}

extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchController.isActive ? filteredData.count : cardCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = cardCollectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let data = searchController.isActive ? filteredData[indexPath.row] : cardCollectionList[indexPath.row]
        item.bindData(data: data)
        
        return item
    }
}

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text?.lowercased(), !searchText.isEmpty {
            filteredData = cardCollectionList.filter { cardData in
                return cardData.location.lowercased().contains(searchText)
            }
        } else {
            filteredData.removeAll()
        }
        cardCollectionView.reloadData()
    }
}

