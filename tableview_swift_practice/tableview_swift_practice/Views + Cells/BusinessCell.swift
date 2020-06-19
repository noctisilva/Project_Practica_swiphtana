//
//  BusinessCell.swift
//  tableview_swift_practice
//
//  Created by Tae Hong Min on 6/18/20.
//  Copyright © 2020 tableview.practice.com. All rights reserved.
//

import UIKit
class BusinessCell: UITableViewCell {
    
    var model = MainViewObject()
    
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
        
        addSubview(model.name)
        NSLayoutConstraint.activate([
            model.name.centerYAnchor.constraint(equalTo: centerYAnchor),
            model.name.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
