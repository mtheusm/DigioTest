//
//  HomeView.swift
//  DigioTest
//
//  Created by Matheus de Melo Moreira on 26/05/22.
//

import Foundation
import UIKit
import SnapKit

class HomeView: UIView {

    var spotlightCollectionView: SpotlightCollectionView!
    var productCollectionView: ProductCollectionView!
    var cashAreaView: UIView!
    var data: Home?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(data: Home) {
        self.init(frame: CGRect.zero)
        self.data = data
        createSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func createSubviews() {
        addSpotlightArea()
        addCashArea()
        addProductsArea()
    }

}

extension HomeView {
    private func addSpotlightArea() {
        UIView.animate(withDuration: 0.3, animations: {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 8, right: 16)
            layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40.0, height: 180)
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 15
            self.spotlightCollectionView = SpotlightCollectionView(frame: .zero, collectionViewLayout: layout)
            self.spotlightCollectionView.list = self.data?.spotlight
            self.addSubview(self.spotlightCollectionView)
            self.spotlightCollectionView.snp.makeConstraints { (make) in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(220.0)
            }
        })
    }

    private func addCashArea() {
        UIView.animate(withDuration: 0.3, animations: {
            self.cashAreaView = UIView()
            self.addSubview(self.cashAreaView)
            self.cashAreaView.snp.makeConstraints { (make) in
                make.top.equalTo(self.spotlightCollectionView.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(160)
            }

            let cashTitle = UILabel()
            cashTitle.text = self.data?.cash.title ?? ""
            cashTitle.textColor = .black
            cashTitle.font = UIFont.boldSystemFont(ofSize: 16.0)
            self.cashAreaView.addSubview(cashTitle)
            cashTitle.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10.0)
                make.leading.equalToSuperview().offset(16.0)
            }

            let cashImg = UIImageView()
            cashImg.downloaded(from: self.data?.cash.bannerURL ?? "")
            cashImg.layer.cornerRadius = 10.0
            cashImg.layer.masksToBounds = true

            self.cashAreaView.addSubview(cashImg)
            cashImg.snp.makeConstraints { (make) in
                make.height.equalTo(100.0)
                make.top.equalTo(cashTitle.snp.bottom).offset(8.0)
                make.leading.equalToSuperview().offset(35.0)
                make.trailing.equalToSuperview().offset(-35.0)
            }
        })
    }

    private func addProductsArea() {
        UIView.animate(withDuration: 0.3, animations: {
            let productsTitle = UILabel()
            productsTitle.text = "Produtos"
            productsTitle.textColor = .black
            productsTitle.font = UIFont.boldSystemFont(ofSize: 16.0)
            self.addSubview(productsTitle)
            productsTitle.snp.makeConstraints { (make) in
                make.top.equalTo(self.cashAreaView.snp.bottom).offset(10.0)
                make.leading.equalToSuperview().offset(16.0)
            }

            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            layout.itemSize = CGSize(width: 120, height: 120)
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 20
            self.productCollectionView = ProductCollectionView(frame: .zero, collectionViewLayout: layout)
            self.productCollectionView.list = self.data?.products
            self.addSubview(self.productCollectionView)
            self.productCollectionView.snp.makeConstraints { (make) in
                make.top.equalTo(productsTitle.snp.bottom).offset(8.0)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(140)
            }
        })
    }
}
