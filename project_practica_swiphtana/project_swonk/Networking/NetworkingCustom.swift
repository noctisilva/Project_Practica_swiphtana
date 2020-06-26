//
//  URLRequest.swift
//  tableview_swift_practice
//
//  Created by Tae Hong Min on 6/17/20.
//  Copyright © 2020 tableview.practice.com. All rights reserved.
//

import Foundation

class NetworkingCustom: NSObject {
    
    var businesses = [Business]()
    let limit = 50
    private let token = "ozAMJ3Zrg1jWO89W2K_YdHvSgZ-XY6y2-I99fUn_FFDXHXaJHBPYsAE3wUQXoee8DM6f-c8nFLgglX0BkQAAcaN75N-l0kCWlDouJEremnLNW8Sxcxx12FVV3-rrXnYx"

    func fetchBusinesses(searchItem: String, offset: Int?, completionHandler: @escaping ([Business]) -> Void) {
        let offset = offset ?? 0
        var urlC = URLComponents()
        urlC.scheme = "https"
        urlC.host = "api.yelp.com"
        urlC.path = "/v3/businesses/search"
        urlC.queryItems = [
            URLQueryItem(name: "location", value: "\(searchItem)"),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)")
        ]
        var request = URLRequest(url: urlC.url!)
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response)")
                return
            }
            
            if let data = data {
                let response = try! JSONDecoder().decode(Response.self, from: data)
                let nested = response.businesses ?? []
//                for business in nested {
//                    self.businesses.append(business)
//                }
                self.businesses = nested.map({ return $0 })
                completionHandler(self.businesses)
            }
        })
        task.resume()
    }
}
