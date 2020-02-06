//
//  ViewController.swift
//  SectionTest
//
//  Created by TrungNV on 2/6/20.
//  Copyright © 2020 trungnv. All rights reserved.
//

import UIKit

class MyData{
    var dataTitle = ""
    var listSub = [String]()
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var listData = [MyData]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Just to prepare Data
        for i in 0...5{
            let mData = MyData()
            mData.dataTitle = "Title: \(i)"
            var lstSub = [String]()
            for j in 0...4{
                lstSub.append("Title \(i) sub \(j)")
            }
            mData.listSub = lstSub
            listData.append(mData)
        }
        tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData[section].listSub.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = listData[indexPath.section].listSub[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    // Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // CustomerView
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)

        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = listData[section].dataTitle
        label.textAlignment = .center
        headerView.addSubview(label)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

}

