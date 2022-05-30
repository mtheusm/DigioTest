//
//  HomeViewModel.swift
//  DigioTest
//
//  Created by Matheus de Melo Moreira on 24/05/22.
//

import Foundation

class HomeViewModel {

    private var service: HomeService?
    private(set) var products: Home? {
        didSet {
            self.bind()
        }
    }

    var bind: (() -> Void) = {}

    init() {
        self.service = HomeService()
        parse()
    }

    func parse() {
        self.service?.getHomeProducts { response in
            self.products = response
        }
    }

}
