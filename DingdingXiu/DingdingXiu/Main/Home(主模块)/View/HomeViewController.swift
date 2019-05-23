//
//  HomeViewController.swift
//  DingdingXiu
//
//  Created by jones on 2019/5/23.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private var subscribeList = [["name":"空调","pic":"list_kongtiao"],
                                ["name":"电脑","pic":"list_diannao"],
                                ["name":"冰箱","pic":"list_bingxiang"],
                                ["name":"洗衣机","pic":"list_xiyiji"],
                                ["name":"热水器","pic":"list_reshuiqi"],
                                ["name":"燃气灶","pic":"list_ranqizao"],
                                ["name":"油烟机","pic":"list_youyanji"],
                                ["name":"消毒柜","pic":"list_xiaodugui"],
                                ["name":"其他","pic":"list_qita"]]
    
    private lazy var collectionView: UICollectionView = {
        let lt = UCollectionViewSectionBackgroundLayout()
        
        lt.minimumLineSpacing = 10
        lt.minimumInteritemSpacing = 5
        
        let cw = UICollectionView(frame: CGRect.zero, collectionViewLayout:lt)
        
        cw.backgroundColor = UIColor.clear
        cw.delegate = self
        cw.dataSource = self
        cw.alwaysBounceVertical = true
        cw.register(cellType: HomeViewCell.self)
        cw.register(supplementaryViewType: UComicCHead.self, ofKind: UICollectionView.elementKindSectionHeader)
        cw.register(supplementaryViewType: UComicCFoot.self, ofKind: UICollectionView.elementKindSectionHeader)
//        cw.uempty = UEmptyView { [weak self] in self?.loadData() }
        return cw
        
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "家电维修"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "wode"), style: .plain, target: self, action: #selector(rightBtnClick))

        if #available(iOS 11.0, *){
            collectionView.contentInsetAdjustmentBehavior = .never
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
        }
       view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges)
        }
        collectionView.reloadData()

        // Do any additional setup after loading the view.
    }

    @objc func rightBtnClick(_: UIButton){
        
        print("点击了右键")

        
    }


}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UCollectionViewSectionBackgroundLayoutDelegateLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return subscribeList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: HomeViewCell.self)
        let comicList = subscribeList[indexPath.row]
        cell.diction = comicList as NSDictionary
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(screenWidth - 30.0) / 3.0)
        return CGSize(width: width, height: 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

