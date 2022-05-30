//
//  SpotlightCollectionViewCell.swift
//  DigioTest
//
//  Created by Matheus de Melo Moreira on 26/05/22.
//

import Foundation
import SnapKit

class SpotlightCollectionViewCell: UICollectionViewCell {

    var spotlightImage = UIImageView()
    var viewImgContainer: UIView!
    static let identifier = "spotlightCell"

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
        let labeltest = UILabel()
        labeltest.font = UIFont.boldSystemFont(ofSize: 16.0)

        viewImgContainer = UIView()
        viewImgContainer.layer.cornerRadius = 10.0
        viewImgContainer.layer.shadowColor = UIColor.black.cgColor
        viewImgContainer.layer.shadowOffset = .zero
        viewImgContainer.layer.shadowRadius = 5.0
        viewImgContainer.layer.shadowOpacity = 0.5
        viewImgContainer.backgroundColor = .white
        addSubview(viewImgContainer)
        viewImgContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(180.0)
            make.width.equalToSuperview()
        }
    }

    public func setImage(image: UIImageView) {
        spotlightImage = image
        spotlightImage.layer.cornerRadius = 10.0
        spotlightImage.layer.masksToBounds = true
        viewImgContainer.addSubview(spotlightImage)
        spotlightImage.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }

}
