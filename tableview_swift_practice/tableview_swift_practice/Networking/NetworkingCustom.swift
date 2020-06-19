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
    private var domainUrlString = ""
    private let token = "ozAMJ3Zrg1jWO89W2K_YdHvSgZ-XY6y2-I99fUn_FFDXHXaJHBPYsAE3wUQXoee8DM6f-c8nFLgglX0BkQAAcaN75N-l0kCWlDouJEremnLNW8Sxcxx12FVV3-rrXnYx"
    
    func fetchBusinesses(offset: Int?, completionHandler: @escaping ([Business]) -> Void) {
        let offset = offset ?? 0
        domainUrlString += "https://api.yelp.com/v3/businesses/search?location=metlife+building&limit=\(limit)&offset=\(offset)"
        let url = URL(string: domainUrlString)!
        var request = URLRequest(url: url)
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
                for business in nested {
                    self.businesses.append(business)
                }
                completionHandler(self.businesses)
            }
        })
        task.resume()
    }
}
