//
//  LoginController.swift
//  DingdingXiu
//
//  Created by mac on 2019/5/22.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(r: 234, g: 234, b: 234)
        
        // Do any additional setup after loading the view.
    }
    
    lazy var headerView:UIView = {
       
        let image = UIView()
        image.backgroundColor = UIColor.init(r: 68, g: 77, b: 105);
        
        return image
        
        
    }()

    lazy var headerIcon:UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage.init(named: "touxiang");
        
        return image
        
        
    }()
    
    lazy var titleLabel:UILabel = {
        
        let image = UILabel()
        image.textColor = UIColor.white
        image.font = UIFont.systemFont(ofSize: 14)
        image.text = "已有账号密码？登录"
        
        return image
        
    }()
    
    
    lazy var mainView:UIView = {
        
        let image = UIView()
        image.backgroundColor = UIColor.white;
        
        return image
        
    }()
    
    lazy var loginLabl:UIButton = {
        let lab = UIButton()
        lab.setTitleColor(UIColor.init(r: 68, g: 77, b: 105), for: .selected)
        lab.setTitleColor(UIColor.init(r: 149, g: 159, b: 179), for: .normal)
        lab.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        lab.titleLabel?.textAlignment = .center
        lab.setTitle("登录", for: .normal)
        lab.isSelected = true

        lab.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)

        return lab
    }()
    
    lazy var resigLabl:UIButton = {
        let lab = UIButton()
        lab.setTitleColor(UIColor.init(r: 149, g: 159, b: 179), for: .normal) ;
        lab.setTitleColor(UIColor.init(r: 68, g: 77, b: 105), for: .selected) ;

        lab.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        lab.titleLabel?.textAlignment = .center
        lab.setTitle("注册", for: .normal)
        lab.isSelected = false
        lab.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        return lab
    }()
    
    lazy var lineView:UIView = {
        
        let image = UIView()
        image.backgroundColor = UIColor.init(r: 68, g: 77, b: 105);
        image.alpha = 0.5
        
        return image
        
    }()
    
    lazy var loginBackgView :UIView = {
        let image = UIView()
        
        return image

    }()
    
    lazy var phonetext:UITextField = {
        
        let image = UITextField()
        image.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        image.placeholder = "请输入手机号"
        
        image.clearButtonMode = .whileEditing
        image.keyboardType = UIKeyboardType.numberPad
        image.borderStyle = .roundedRect

        return image
        
    }()
    

    @objc func loginBtnClick(button: UIButton) {
   
        if button == loginLabl {
            resigLabl.isSelected = false
            loginLabl.isSelected = true
            print("点击了登录")
        } else
        {
            print("点击了注册")

            resigLabl.isSelected = true
            loginLabl.isSelected = false
        }
    }
    
    

    override func configUI() {
        view.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
        }
        
        headerView.addSubview(headerIcon)
        
        headerIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.height.width.equalTo(44)
            $0.centerX.equalToSuperview()
        }
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(headerIcon.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(headerView.snp.bottom).offset(-10)
        }
        
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(10)
            $0.right.equalTo(headerView.snp.right).offset(-10)
            $0.left.equalTo(headerView.snp.left).offset(10)
            $0.bottom.equalToSuperview()
        }
        
        mainView.addSubview(loginLabl)
        let width = floor(Double(screenWidth - 20.0) / 2.0)

        loginLabl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(44)
        }
        mainView.addSubview(resigLabl)
        
        resigLabl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.right.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(44)
        }
        
        mainView.addSubview(lineView)
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(resigLabl.snp_bottom).offset(1)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(1)
        }
        mainView.addSubview(loginBackgView)
        
        loginBackgView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp_bottom).offset(0)
            $0.right.left.bottom.equalToSuperview()
        }
        
        loginBackgView.addSubview(phonetext)
        
        phonetext.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)

            $0.height.equalTo(55)
        }

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
