//
//  ViewController.swift
//  tableview_swift_practice
///Users/taemin1/Documents/Projects/Swift-Tableview-Practice/tableview_swift_practice/tableview_swift_practice/Networking
//  Created by Tae Hong Min on 6/16/20.
//  Copyright © 2020 tableview.practice.com. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    var myModel = MainViewObject()
    private var businesses: [Business] = []
    var totalOffset = 0
    var searchItem = "metlife+building"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .blue
        getData(searchItem: searchItem, totalOffset)
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func getData(searchItem: String, _ offset: Int?) {
        NetworkingCustom().fetchBusinesses(searchItem: searchItem, offset: offset){ (result) in
            self.businesses = self.businesses + result
            DispatchQueue.main.async{
              self.myModel.mainTableView.reloadData()
            }
        }
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
        self.view.addSubview(myModel.mainTableView)
        myModel.mainTableView.register(BusinessCell.self, forCellReuseIdentifier: "BusinessCell")
        myModel.mainTableView.dataSource = self
        myModel.mainTableView.delegate = self
//        myModel.mainTableView.alpha = 0
        NSLayoutConstraint.activate([
            myModel.mainTableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            myModel.mainTableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            myModel.mainTableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            myModel.mainTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myModel.mainTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let count = self.businesses.count - 1
        if indexPath.row == count { // last cell
            totalOffset += indexPath.row
            getData(searchItem: searchItem, totalOffset)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell") as! BusinessCell
        
        cell.bind(self.businesses[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
