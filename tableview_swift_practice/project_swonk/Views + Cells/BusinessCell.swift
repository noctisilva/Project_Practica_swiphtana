//
//  BusinessCell.swift
//  tableview_swift_practice
//
//  Created by Tae Hong Min on 6/18/20.
//  Copyright © 2020 tableview.practice.com. All rights reserved.
//

import Foundation
import UIKit
class BusinessCell: UITableViewCell {
    
    var model = MainViewObject()
    var business: Business?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(model.businessImg)
        NSLayoutConstraint.activate([
            model.businessImg.widthAnchor.constraint(equalTo: widthAnchor),
            model.businessImg.heightAnchor.constraint(equalTo: widthAnchor),
            model.businessImg.topAnchor.constraint(equalTo: topAnchor),
            model.businessImg.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addSubview(model.name)
        NSLayoutConstraint.activate([
            model.name.topAnchor.constraint(equalTo: model.businessImg.bottomAnchor, constant: 10),
            model.name.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            model.name.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        
    }
    
    func bind(_ business: Business){
        self.business = business
        let imgURL = self.business?.image_url
        model.name.text = self.business?.name
        if let imgURL = URL(string: imgURL!) {
            model.businessImg.load(url: imgURL)
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
}
