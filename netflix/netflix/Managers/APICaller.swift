//
//  APICaller.swift
//  netflix
//
//  Created by Safar Safarov on 18/11/22.
//

import Foundation


struct Constants {
    
    // The api key can be taken from themoviedb.org, you need to create an account to get the secret key.
    static let API_KEY = "79352769a5691712be3e62c682c4a768"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTargetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTargetData))
            }
        }
        task.resume()
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/3trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(APIError.failedTargetData))
                
            }
            
        }
        task.resume()
    }
    
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
         guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
             guard let data = data, error == nil else {
                 return
             }
             
             do {
                 let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                 completion(.success(results.results))
             } catch {
                 print(error.localizedDescription)
             }

         }
         task.resume()
     }
    
    func getPopular(completion: @escaping (Result<Title, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular/api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                completion(.failure(APIError.failedTargetData))
            }
        }
        task.resume()
    }
}
