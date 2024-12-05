//
//  HomeModel.swift
//  DarwinDemo
//
//  Created by Shota Iwamoto on 2024-11-08.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var data: [String: Any] = [:]
    @Published var responseMessage: String = ""
    
    private let networkService = NetworkService()
    
    func fetchHomeData() {
        print("Called fetch home data")
            networkService.fetchData(from: "https://generac-...") { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let jsonResponse):
                        print("Success: \(jsonResponse)")
                        self.data = jsonResponse
                    case .failure(let error):
                        print("Failed: \(error)")
                        self.responseMessage = "Failed: \(error.localizedDescription)"
                    }
                }
            }
        }
    
}
