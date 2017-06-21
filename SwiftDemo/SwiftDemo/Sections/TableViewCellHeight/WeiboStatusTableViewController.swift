//
//  WeiboStatusTableViewController.swift
//  SwiftDemo
//
//  Created by hb on 2017/6/21.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

import UIKit

private let ProfileTableViewControllerCellReuseIdentifier = "StatusTableViewCell"


class WeiboStatusTableViewController: UITableViewController {
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        self.loadData()
    }
    
    // MARK: - Private method
    
    private func setUp() {
        self.view.backgroundColor = UIColor.gray
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
    }
    
    private func loadData() {
        self.datas.removeAll()
        
        for i in 0 ..< 15 {
            let model_i = StatusTableViewModel()
            model_i.content = "我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? 我是郭雪芙,你猜猜我今年多大了? " + String(i+1)
            self.datas.append(model_i)
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewControllerCellReuseIdentifier) as? StatusTableViewCell {
            cell.model = self.datas[indexPath.row]
            return cell
        }
        return StatusTableViewCell()
    }
    
    // MARK: - Private property
    
    fileprivate var datas = [StatusTableViewModel]()
    
}
