//
//  BaseViewController.swift
//  DingdingXiu
//
//  Created by mac on 2019/5/18.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Reusable
import Kingfisher

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.background;
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        configUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func configUI() {}
    
    func configNavigationBar()  {
        // 变量不符合条件判断时，执行下面代码
        guard let navi = navigationController else {
            return
        }
        
        if navi.visibleViewController == self{
            navi.setNavigationBarHidden(false, animated: true)
            if navi.viewControllers.count > 1 {
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"), style: .plain, target: self, action: #selector(pressBack))            }
        }
    }
    
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BaseViewController{
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
