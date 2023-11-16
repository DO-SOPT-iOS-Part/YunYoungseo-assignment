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
    
    //    var filteredData: [CardCollectionData] = [] //검색
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
            //            $0.searchResultsUpdater = self //검색
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



//extension ListViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let selectedData: CardCollectionData
//            if searchController.isActive {
//                selectedData = filteredData[indexPath.row]
//            } else {
//                selectedData = cardCollectionList[indexPath.row]
//            }
//            // 선택된 데이터를 DetailViewController에 전달하고 화면을 전환
//            let detailViewController = DetailViewController(data: selectedData)
//            self.navigationController?.pushViewController(detailViewController, animated: true)
//        }
//}

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
        return searchController.isActive ? 0 : self.weatherListViewModel.weatherListModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(data: weatherListViewModel.fetchIndexOfWeather(forIndex: indexPath.item))
//        let weatherData = self.weatherListViewModel.weatherListModel[indexPath.row]
        return cell
    }
}
//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherListCollectionViewCell.identifier, for: indexPath) as? WeatherListCollectionViewCell else { return UICollectionViewCell() }
//        cell.configureCell(forModel: viewModel.fetchIndexOfWeather(forIndex: indexPath.item))
//        return cell
//    }

//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherListCollectionViewCell.identifier, for: indexPath) as? WeatherListCollectionViewCell else { return UICollectionViewCell() }
//        cell.configureCell(forModel: viewModel.fetchIndexOfWeather(forIndex: indexPath.item))
//        return cell
//    }

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return searchController.isActive ? filteredData.count : cardCollectionList.count
//    }

//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let item = cardCollectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//
//        let data = searchController.isActive ? filteredData[indexPath.row] : cardCollectionList[indexPath.row]
//        item.bindData(data: data)
//
//        return item
//    }
//}

//extension ListViewController: UISearchResultsUpdating { // 검색
//    func updateSearchResults(for searchController: UISearchController) {
//        if let searchText = searchController.searchBar.text?.lowercased(), !searchText.isEmpty {
//            filteredData = cardCollectionList.filter { cardData in
//                return cardData.location.lowercased().contains(searchText)
//            }
//        } else {
//            filteredData.removeAll()
//        }
//        cardCollectionView.reloadData()
//    }
//}

