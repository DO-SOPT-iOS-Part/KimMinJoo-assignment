//
//  HomeViewController.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/15/23.
//

import UIKit

import RxCocoa
import RxSwift
import Then

final class HomeViewController: UIViewController {
    private let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
    private let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRegister()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    deinit {
        print(#function)
    }
}

extension HomeViewController {
    func setNavigation() {
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.do {
            $0.searchBar.tintColor = .white
            $0.searchBar.searchTextField.backgroundColor = .gray28
            $0.searchBar.searchTextField.leftView?.tintColor = .gray152
            $0.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search for a city or airport", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray152])
            if let button = $0.searchBar.searchTextField.value(forKey: "_clearButton") as? UIButton {
                let templateImage = button.imageView?.image?.withRenderingMode(.alwaysTemplate)
                button.setImage(templateImage, for: .normal)
                button.tintColor = .gray152
            }
        }
        
        self.navigationItem.searchController = searchController
        self.navigationItem.searchController?.obscuresBackgroundDuringPresentation = true
        self.navigationItem.searchController?.searchBar.searchTextField.textColor = .white
        self.navigationItem.title = "Weather"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ellipsisCircle"), style: .plain, target: self, action: Selector(""))
        self.navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    private func bindViewModel() {
        viewModel.outputs.cityTemperature
            .bind(to: homeView.homeCityCollectionView.rx
                .items(cellIdentifier: HomeCityCollectionViewCell.className, cellType: HomeCityCollectionViewCell.self)) { index, model, cell in
                        cell.setLabels(temperature: model)
                }
                .disposed(by: disposeBag)
        
        homeView.homeCityCollectionView.rx.modelSelected(Temperature.self)
            .subscribe(onNext: { model in
                let index = model.no
                self.pushToCityDetailView(index: index)
            })
            .disposed(by: disposeBag)
        
        homeView.homeCityCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    private func setRegister() {
        homeView.homeCityCollectionView.registerCell(HomeCityCollectionViewCell.self)
    }
    
    private func setDelegate() {
        homeView.homeCityCollectionView.delegate = self
    }

    
    private func pushToCityDetailView(index: Int) {
        print(index)
        let cityDetailViewController = CityDetailViewController()
        cityDetailViewController.setIndex(index: index)
        self.navigationController?.pushViewController(cityDetailViewController, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = 117.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
