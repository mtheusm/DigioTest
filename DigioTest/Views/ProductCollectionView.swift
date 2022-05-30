//
//  ProductCollectionView.swift
//  DigioTest
//
//  Created by Matheus de Melo Moreira on 26/05/22.
//

import Foundation
import SnapKit

class ProductCollectionView: UICollectionView {

    public var list: [Product]?

    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupView()
        setupAditionalConfiguration()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupAditionalConfiguration()
    }

    func setupView() {
        dataSource = self
        delegate = self
        self.backgroundColor = .white
        self.showsHorizontalScrollIndicator = false
    }

    func setupAditionalConfiguration() {
        self.register(ProductCollectionViewCell.self,
                      forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        self.isAccessibilityElement = false
    }

}

extension ProductCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductCollectionViewCell.identifier,
            for: indexPath
        ) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        let image = UIImageView()
        image.downloaded(from: list?[indexPath.row].imageURL ?? "")
        print("imagem: \(image)")
        cell.setImage(image: image)

        return cell
    }

}
