//
//  URLRequest.swift
//  tableview_swift_practice
//
//  Created by Tae Hong Min on 6/17/20.
//  Copyright © 2020 tableview.practice.com. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
