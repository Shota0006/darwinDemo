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
        request.setValue("Bearer eyJraWQiOiJVQmNESDBqa2JBVzNDWHlQdEZCMFlMeUduNnJEbTU1dzFqZ3hDKzU0MFZjPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJkZmViMmNiOC0wNzIzLTQwMzYtYWE4Mi0yMTdiMzk3ZjEwNDEiLCJyb2xlIjoiSE9NRV9PV05FUiIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtZWFzdC0xLmFtYXpvbmF3cy5jb21cL3VzLWVhc3QtMV9tUmxCVVFKajQiLCJjb2duaXRvOnVzZXJuYW1lIjoiZGZlYjJjYjgtMDcyMy00MDM2LWFhODItMjE3YjM5N2YxMDQxIiwiZGlzcGxheV9uYW1lIjoiSG9tZW93bmVyIiwiYXVkIjoiMWt1MWtlNHExNWp2MnJqMGJxZ3Foa3VlaiIsInVpX3R5cGUiOiJIT01FT1dORVIiLCJldmVudF9pZCI6ImNkZTlmNWJiLTlhZTgtNDliZC04M2M5LWQ4N2I2NzQzNGQxMiIsInRva2VuX3VzZSI6ImlkIiwicGVybWlzc2lvbnMiOiJzaXRlX3ZpZXcsc2l0ZV9zaGFyZSIsImF1dGhfdGltZSI6MTczMDc2MzY3MSwiZXhwIjoxNzMxMTEwMzgzLCJpYXQiOjE3MzExMDY3ODMsImVtYWlsIjoicHdydmlld3Rlc3QrdGMxNjFiQGdlbmVyYWMuY29tIn0.dfCeSrIr9mwDnhH04Sf0CT_qncqfKvuQvNmg1bVvWe5kZGo8laAFQOvOT3vw6OZ2b-DbvpDzCTq0F1XS5eFduxz0lwisS9TbUfbav8O1JZt4dw41om3Z39V6pvTQP7VfGCRNe6VGTMfd8KHIuYfZVQN4WJjr75Th8tRmL8gBRuTldVqzBtTw3rJ6fEJ41CQsgj6d22y2DleYfJ3dgGusKW2jBbdp9ObD5LjFsv3hxBntlHj8D5R1ZYqgTp9xmWCTze8sh_FAInC_1-W6EZ3mVAt_cY_Yz65ohHKu1IE1hj3Q9HY6qFsiAHGjS0fu7xHQ2I34mpoVAY2yB0cCwBMajA", forHTTPHeaderField: "Authorization")
        
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
