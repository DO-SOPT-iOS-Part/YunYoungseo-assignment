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
    
    var filteredData: [WeatherListModel] = []
    lazy var weatherListModel: [WeatherListModel] = []
    let weatherListViewModel = WeatherListViewModel()
    
    let searchController = UISearchController(searchResultsController: nil)
    let menuButton = UIBarButtonItem(image: UIImage(named: "settings"))
    
    private let cardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setStyle()
        setCollectionViewConfig()
        setCollectionViewLayout()
        setSearchController()
        setNavigationBar()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        weatherListViewModel.fetchWeatherList {
            self.weatherListModel = self.weatherListViewModel.weatherListModel
            self.filteredData = self.weatherListModel
            self.cardCollectionView.reloadData()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
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
        flowLayout.itemSize = CGSize(width: 335, height: 117)
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
    }
}

extension ListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //            if searchController.isActive {
        //                selectedData = filteredData[indexPath.row]
        //            } else {
        //                selectedData = cardCollectionList[indexPath.row]
        //            }
        //            // 선택된 데이터를 DetailViewController에 전달하고 화면을 전환
        //            let detailViewController = DetailViewController(data: selectedData)
        //            self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchController.isActive ? filteredData.count : weatherListModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        let data = searchController.isActive ? filteredData[indexPath.item] : weatherListModel[indexPath.item]
        cell.configureCell(data: data)
        return cell
    }
}

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased(), !searchText.isEmpty else {
            filteredData = weatherListModel
            cardCollectionView.reloadData()
            return
        }
        // 검색어에 따라 weatherListModel에서 필터링
        filteredData = weatherListModel.filter { model in
            return model.cityName.lowercased().contains(searchText)
        }
        cardCollectionView.reloadData()
    }
}

