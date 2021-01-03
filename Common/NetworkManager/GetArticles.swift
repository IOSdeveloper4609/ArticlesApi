//
//  GetArticles.swift
//  NewsApi
//
//  Created by Азат Киракосян on 07.12.2020.
//

import Foundation

final class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func getMovies(api: String, completion: @escaping (NetworkData) -> Void) {
        let urlString = api
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { ( data, _, error ) in
            guard let data = data else { return }
            guard error == nil else { return }

            do {
                let results = try JSONDecoder().decode(NetworkData.self, from: data)

                DispatchQueue.main.async {
                    completion(results)
                }
            } catch {
                print("Json Error")
            }
        } .resume()
    }

}


