//
//  HomeViewController.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/15/23.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("@@@@@@")
        bindViewModel()
        setStyle()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
    }
}

extension HomeViewController {
    func setNavigation() {
        let searchController = UISearchController(searchResultsController: nil)
        
        
        
        searchController.do {
            $0.searchBar.tintColor = .white
            $0.searchBar.searchTextField.backgroundColor = .gray28
            $0.searchBar.searchTextField.leftView?.tintColor = .gray152
            $0.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search for a city or airport", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 152/255, green: 152/255, blue: 160/255, alpha: 1)])
            if let button = $0.searchBar.searchTextField.value(forKey: "_clearButton") as? UIButton {
                let templateImage = button.imageView?.image?.withRenderingMode(.alwaysTemplate)
                button.setImage(templateImage, for: .normal)
                button.tintColor = .gray152
            }
        }
        
        self.navigationItem.searchController = searchController
        self.navigationItem.searchController?.searchBar.searchTextField.textColor = .white
        self.navigationItem.title = "Weather"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ellipsisCircle"), style: .plain, target: self, action: Selector(""))
        self.navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    private func bindViewModel() { }
    
    private func setStyle() { }
    
    private func setLayout() { 
        view.addSubview(homeView)
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
