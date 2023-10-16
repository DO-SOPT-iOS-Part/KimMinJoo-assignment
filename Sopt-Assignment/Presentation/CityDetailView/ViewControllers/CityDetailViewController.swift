//
//  CityDetailViewController.swift
//  Sopt-Assignment
//
//  Created by Minjoo Kim on 10/16/23.
//

import UIKit

import RxCocoa
import RxSwift
import Then

final class CityDetailViewController: UIViewController {
    private let viewModel = CityDetailViewModel(city: "")
    private let disposeBag = DisposeBag()
    
    private let cityDetailView = CityDetailView()
    
    private var cityIndex = 0
    private let tapGesture1 = UITapGestureRecognizer()
    private let tapGesture2 = UITapGestureRecognizer()
    private let tapGesture3 = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true // 뷰 컨트롤러가 나타날 때 숨기기
    }
    
    override func loadView() {
        self.view = cityDetailView
    }
}

extension CityDetailViewController {
    private func bindViewModel() {
        viewModel.outputs.cityTemperature
            .asDriver()
            .drive { [weak self] temperature in
                guard let self else { return }
//                self.homeView.setHomeCityView(temperatures: temperature)
            }
            .disposed(by: disposeBag)
    }
   
}

extension CityDetailViewController {
    func setIndex(index: Int) {
        self.cityIndex = index
    }
}
