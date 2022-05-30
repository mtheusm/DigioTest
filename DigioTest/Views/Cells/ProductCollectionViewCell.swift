//
//  ProductCollectionViewCell.swift
//  DigioTest
//
//  Created by Matheus de Melo Moreira on 26/05/22.
//

import Foundation
import SnapKit

class ProductCollectionViewCell: UICollectionViewCell {

    var productImage = UIImageView()
    var viewImgContainer: UIView!
    static let identifier = "productCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        createSubviews()
    }

    private func createSubviews() {
        viewImgContainer = UIView()
        viewImgContainer.layer.cornerRadius = 10.0
        viewImgContainer.layer.shadowColor = UIColor.black.cgColor
        viewImgContainer.layer.shadowOffset = .zero
        viewImgContainer.layer.shadowRadius = 5.0
        viewImgContainer.layer.shadowOpacity = 0.5
        viewImgContainer.backgroundColor = .white
        addSubview(viewImgContainer)
        viewImgContainer.snp.makeConstraints { (make) in
            make.top.centerX.equalToSuperview()
            make.height.width.equalTo(120.0)

        }
    }

    public func setImage(image: UIImageView) {
        productImage = image
        productImage.layer.cornerRadius = 10.0
        productImage.layer.masksToBounds = true
        viewImgContainer.addSubview(productImage)
        productImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.width.equalTo(60)
        }
    }
}
