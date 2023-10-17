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
    
    private let tapGesture1 = UITapGestureRecognizer()
    private let tapGesture2 = UITapGestureRecognizer()
    private let tapGesture3 = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapGesture()
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
        tapGesture1.rx.event
            .bind {_ in
                self.pushToCityDetailView(index: 0)
            }
            .disposed(by: disposeBag)
        
        tapGesture2.rx.event
            .bind {_ in
                self.pushToCityDetailView(index: 1)
            }
            .disposed(by: disposeBag)
        
        tapGesture3.rx.event
            .bind {_ in
                self.pushToCityDetailView(index: 2)
            }
            .disposed(by: disposeBag)
        
        viewModel.outputs.cityTemperature
            .asDriver()
            .drive { [weak self] temperature in
                guard let self else { return }
                self.homeView.setHomeCityView(temperatures: temperature)
            }
            .disposed(by: disposeBag)
    }
    
    private func setTapGesture() {
        homeView.homeCityView1.addGestureRecognizer(self.tapGesture1)
        homeView.homeCityView2.addGestureRecognizer(self.tapGesture2)
        homeView.homeCityView3.addGestureRecognizer(self.tapGesture3)
    }
    
    private func pushToCityDetailView(index: Int) {
        print(index)
        let cityDetailViewController = CityDetailViewController()
        cityDetailViewController.setIndex(index: index)
        self.navigationController?.pushViewController(cityDetailViewController, animated: true)
    }
}
