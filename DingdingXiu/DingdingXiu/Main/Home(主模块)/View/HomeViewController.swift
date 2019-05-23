//
//  HomeViewController.swift
//  DingdingXiu
//
//  Created by jones on 2019/5/23.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private var subscribeList = ["空调","电脑","冰箱","洗衣机","热水器","燃气灶","油烟机","消毒柜","其他"]
    
    private lazy var collectionView: UICollectionView = {
        let lt = UCollectionViewSectionBackgroundLayout()
        
        lt.minimumLineSpacing = 10
        lt.minimumInteritemSpacing = 5
        
        let cw = UICollectionView(frame: CGRect.zero, collectionViewLayout:lt)
        
        cw.backgroundColor = UIColor.clear
        cw.delegate = self
        cw.dataSource = self
        cw.alwaysBounceVertical = true
        cw.register(cellType: UComicCCell.self)
        cw.register(supplementaryViewType: UComicCHead.self, ofKind: UICollectionView.elementKindSectionHeader)
        cw.register(supplementaryViewType: UComicCFoot.self, ofKind: UICollectionView.elementKindSectionHeader)
        cw.uempty = UEmptyView { [weak self] in self?.loadData() }
        return cw
        
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *){
            collectionView.contentInsetAdjustmentBehavior = .never
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
        }
       
        // Do any additional setup after loading the view.
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
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: UComicCCell.self)
        cell.style = .withTitle
        let comicList = subscribeList[indexPath.row]
        cell.backgroundColor = UIColor.yellow
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(screenWidth - 10.0) / 3.0)
        return CGSize(width: width, height: 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

