//
//  HomeService.swift
//  DigioTest
//
//  Created by Matheus de Melo Moreira on 24/05/22.
//

import Foundation

class HomeService {

    private let urlString = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"

    func getHomeProducts(completion: @escaping (Home?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("erro na geracao do url")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("erro chamada: \n", error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let products = try? JSONDecoder().decode(Home.self, from: data)
                if let response = products {
                    completion(response)
                } else {
                    print("erro no decoder")
                }
            }
        }.resume()

    }

}
