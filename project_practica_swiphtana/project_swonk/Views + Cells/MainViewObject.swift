//
//  MyObjects.swift
//  tableview_swift_practice
//
//  Created by Tae Hong Min on 6/17/20.
//  Copyright © 2020 tableview.practice.com. All rights reserved.
//

import UIKit
class MainViewObject: NSObject {

    var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.isEditing = false
        tableView.clipsToBounds = true
//        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: -13, bottom: 0, right: 0)
        tableView.flashScrollIndicators()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    var bgImg: UIImageView = {
        let image = UIImageView()
        image.image = nil
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = false
        return image
    }()
    
    var name: UILabel = {
        let name = UILabel()
        name.font = UIFont(name: "Montserrat", size: 10)
        name.textColor = .black
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    var businessImg: UIImageView = {
        let image = UIImageView()
        image.image = nil
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = false
        image.backgroundColor = .blue
        return image
    }()
}
