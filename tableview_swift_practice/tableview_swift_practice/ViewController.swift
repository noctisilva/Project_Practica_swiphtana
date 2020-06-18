//
//  ViewController.swift
//  tableview_swift_practice
///Users/taemin1/Documents/Projects/Swift-Tableview-Practice/tableview_swift_practice/tableview_swift_practice/Networking
//  Created by Tae Hong Min on 6/16/20.
//  Copyright © 2020 tableview.practice.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .blue
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupView()
    }
    
    func setupView(){
        
        self.view.addSubview(myModel.bgImg)
        if let imgURL = URL(string: "https://i.redd.it/hwauujmfjm051.png") {
            myModel.bgImg.load(url: imgURL)
        } else {
            myModel.bgImg.image = UIImage(named: "jojo")
        }
        
        NSLayoutConstraint.activate([
            myModel.bgImg.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            myModel.bgImg.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            myModel.bgImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myModel.bgImg.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        //Add container view to add a container
//        self.view.addSubview(myModel.mainTableView)
//        NSLayoutConstraint.activate([
//            myModel.mainTableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            myModel.mainTableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
//            myModel.mainTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            myModel.mainTableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
//        ])
        
    }
}

