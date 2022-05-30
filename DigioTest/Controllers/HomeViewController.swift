//
//  HomeViewController.swift
//  DigioTest
//
//  Created by Matheus de Melo Moreira on 24/05/22.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    private var homeViewModel: HomeViewModel?
    private var header: UIView?
    private var mainView: HomeView?

    override func loadView() {
        super.loadView()
        getProducts()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func getProducts() {
        homeViewModel = HomeViewModel()
        homeViewModel?.bind = {
            guard let products = self.homeViewModel?.products else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.createSubviews(data: products)
                print(products)
            }
        }
    }

}

extension HomeViewController {
    private func createSubviews(data: Home) {
        header = UIView()
        header?.backgroundColor = .white
        view.addSubview(header ?? UIView())
        header?.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(60.0)
        }
        let headerName = UILabel()
        headerName.text = "Olá, Usuário"
        headerName.backgroundColor = .white
        headerName.font = UIFont.boldSystemFont(ofSize: 16.0)
        headerName.textColor = .black
        header?.addSubview(headerName)
        headerName.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16.0)
            make.bottom.equalToSuperview()
        }

        view.backgroundColor = .white

        mainView = HomeView(data: data)
        view.addSubview(mainView ?? UIView())
        mainView?.snp.makeConstraints({ make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(60.0)
        })

    }
}
