//
//  NetworkService.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-11-08.
//

import Foundation

import Foundation

class NetworkService {
    func fetchData(from urlString: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("text/plain", forHTTPHeaderField: "Accept")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("1.1.10", forHTTPHeaderField: "mobileAppBuildNumber")
        request.setValue("1.20.0", forHTTPHeaderField: "mobileAppVersion")
        request.setValue("Bearer ...", forHTTPHeaderField: "Authorization")
        
        print("NetowrkService 111111 \(url)")
        URLSession.shared.dataTask(with: request) { data, response, error in
            print("NetowrkService response \(response)")
            if let error = error {
                print("NetowrkService Error: \(error)")
                completion(.failure(error))
                return
            }
            
            if let data = data {
                print("NetowrkService data: \(data)")
                do {
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("NetowrkService jsonResponse: \(jsonResponse)")
                        completion(.success(jsonResponse))
                    } else {
                        completion(.failure(NSError(domain: "Invalid Data", code: 500, userInfo: nil)))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
