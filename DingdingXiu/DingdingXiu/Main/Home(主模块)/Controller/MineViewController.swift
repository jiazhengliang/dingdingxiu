//
//  MineViewController.swift
//  DingdingXiu
//
//  Created by mac on 2019/5/25.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {

    
    lazy var tableView : UITableView  = {
        
        let tab = UITableView(frame: view.bounds, style: .grouped)
        tab.backgroundColor = UIColor.white
        tab.delegate = self;
        tab.dataSource = self
        tab.register(cellType: MineTabCell.self)
        return tab
    }()
    
    var daTaList = ["昵称","性别","电话号码","地址","体重","身高","证书","特长"]
    
    var daTaSubList:[String]?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "个人资料"
        
        view.backgroundColor = UIColor.background
        if #available(iOS 11.0, *){
            tableView.contentInsetAdjustmentBehavior = .never
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
        }

        configUI()

    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalTo(self.view.usnp.edges) }


        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        daTaSubList = UserDefaults.standard.object(forKey: "daTaSubList") as! [String]
        
        tableView.reloadData()

    }
  
    
}
extension MineViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daTaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MineTabCell.self)
        cell.subLab.text = daTaSubList?[indexPath.row]
        cell.tipLabel.text = daTaList[indexPath.row]
        if indexPath.row == 2 {
            cell.accessoryType = .none

        } else
        {
            cell.accessoryType = .disclosureIndicator

        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
       let modelVC = ModelViewController()
        modelVC.indexPath = indexPath.row;
        
        if indexPath.row == 2 {
            view.showXHToastCenterWithText("不能修改手机号")
            return
        }
        navigationController?.pushViewController(modelVC, animated: true)
    }
    
}
