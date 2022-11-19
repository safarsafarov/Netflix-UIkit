//
//  APICaller.swift
//  netflix
//
//  Created by Safar Safarov on 18/11/22.
//

import Foundation


struct Constants {
    static let API_KEY = "79352769a5691712be3e62c682c4a768"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTargetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}