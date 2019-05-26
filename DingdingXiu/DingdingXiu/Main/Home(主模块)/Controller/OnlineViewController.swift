//
//  OnlineViewController.swift
//  DingdingXiu
//
//  Created by mac on 2019/5/25.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class OnlineViewController: BaseViewController {

    
    lazy var titLab :UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 20)
        tl.textColor = .init(r: 68, g: 77, b: 105)
        tl.textAlignment = .center
        tl.text = "订单详情"
        return tl
    }()
    
    
    lazy var textBgView :UIView = {
        let tl = UIView()
        tl.backgroundColor = .init(r: 235, g: 240, b: 245)
        tl.layer.cornerRadius = 5;
        tl.layer.masksToBounds = true
        return tl
    }()
    
    lazy var nameLab :UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 16)
        tl.textColor = .init(r: 68, g: 77, b: 105)
        tl.textAlignment = .center
        return tl
    }()
    
    lazy var yanyiLab :UITextField = {
        let tl = UITextField()
        tl.font = UIFont.systemFont(ofSize: 16)
        tl.textColor = .init(r: 68, g: 77, b: 105)
        tl.textAlignment = .left
        return tl
    }()
    
    lazy var timeLab :UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 16)
        tl.textColor = .init(r: 68, g: 77, b: 105)
        tl.textAlignment = .center
        return tl
    }()
    
    lazy var timetext:UITextField = {
        
        let image = UITextField()
        image.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        image.placeholder = "请输入时间"
        
        image.clearButtonMode = .whileEditing
        image.keyboardType = UIKeyboardType.numberPad
        image.borderStyle = .roundedRect
        
        return image
        
    }()
    
    lazy var baoxiuLab :UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 16)
        tl.textColor = .init(r: 68, g: 77, b: 105)
        tl.textAlignment = .center
        tl.text = "是否保修期"
        return tl
    }()
    
    lazy var baoxiuLabtext:UITextField = {
        
        let image = UITextField()
        image.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        image.placeholder = "保修期内"
        
        image.clearButtonMode = .whileEditing
        image.keyboardType = UIKeyboardType.numberPad
        image.borderStyle = .roundedRect
        
        return image
        
    }()
    
    lazy var peopleLab :UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 16)
        tl.textColor = .init(r: 68, g: 77, b: 105)
        tl.textAlignment = .center
        tl.text = "联系人"
        return tl
    }()
    lazy var peoplebtext:UITextField = {
        
        let image = UITextField()
        image.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        image.placeholder = "保修期内"
        
        image.clearButtonMode = .whileEditing
        image.keyboardType = UIKeyboardType.numberPad
        image.borderStyle = .roundedRect
        
        return image
        
    }()
    private var currentDateCom: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
    
    lazy var peopletext:UITextField = {
        
        let image = UITextField()
        image.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        image.placeholder = "请输入联系人"
        
        image.clearButtonMode = .whileEditing
        image.keyboardType = UIKeyboardType.numberPad
        image.borderStyle = .roundedRect
        
        return image
        
    }()
    let seletBtn: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 450, width: ScreenInfo.Width - 200, height: 50))
        button.addTarget(self, action: #selector(onClickSelectButton), for: .touchUpInside)
        button.setTitleColor(UIColor.colorWithRGBA(r: 255, g: 51, b: 102, a: 1), for: .normal)
        button.setImage(UIImage.init(named: "shape"), for: .normal)
        button.setTitle("选择", for: .normal)
        
        return button
    }()

    
    lazy var addressLab :UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 16)
        tl.textColor = .init(r: 68, g: 77, b: 105)
        tl.textAlignment = .center
        tl.text = "联系地址"
        return tl
    }()
    
    lazy var addressbtext:UITextField = {
        
        let image = UITextField()
        image.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        image.placeholder = "请输入地址"
        
        image.clearButtonMode = .whileEditing
        image.keyboardType = UIKeyboardType.numberPad
        image.borderStyle = .roundedRect
        
        return image
        
    }()
    
    lazy var subBtn: UIButton = {
        let mn = UIButton(type: .system)
        mn.setTitle("提交", for: .normal)
        mn.setTitleColor(UIColor.white, for: .normal)
        mn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        mn.addTarget(self, action: #selector(moreAction), for: .touchUpInside)
        mn.tag = 20;
        mn.backgroundColor = UIColor.init(r: 68, g: 77, b: 105)
        mn.layer.borderColor = UIColor.lightGray.cgColor
        mn.layer.cornerRadius = 5;
        mn.layer.masksToBounds = true
        return mn
    }()
    
    
    @objc func moreAction(button: UIButton) {
        
        print("点击了提交")

        var model = DingDanModel()
        
        let address : String = addressbtext.text ?? ""
        let people : String = peopletext.text ?? ""

        let yanyi : String = yanyiLab.text ?? ""
        if yanyi.count < 1 {
            view.showXHToastCenterWithText("请输入原因")
            return
        }
        if people.count < 1 {
            view.showXHToastCenterWithText("请输入联系人")
            return
        }


        if address.count < 1 {
            view.showXHToastCenterWithText("请输入地址")
            return
        }

        model.address = address
        model.people = people
        model.content = yanyi
        model.iphoneNum = "13788889999"
        model.isBaoxiu = baoxiuLabtext.text
        model.time = timetext.text
        
        
        SVProgressHUD.show()
        self.perform(#selector(submitBtn), with: nil, afterDelay: 1.0)
        
        
    }
    
    @objc private func submitBtn()
    {
        SVProgressHUD.dismiss()

        navigationController?.popViewController(animated: true)

    }
    
    @objc func onClickSelectButton() {
        let dataPicker = EWDatePickerViewController()
        self.definesPresentationContext = true
        /// 回调显示方法
        dataPicker.backDate = { [weak self] date in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dateString: String = dateFormatter.string(from: date)
            self?.timetext.text = dateString
        }
        dataPicker.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        dataPicker.picker.reloadAllComponents()
        /// 弹出时日期滚动到当前日期效果
        self.present(dataPicker, animated: true) {
            dataPicker.picker.selectRow(0, inComponent: 0, animated: true)
            dataPicker.picker.selectRow((self.currentDateCom.month!) - 1, inComponent: 1, animated:   true)
            dataPicker.picker.selectRow((self.currentDateCom.day!) - 1, inComponent: 2, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "在线下单"

        print("\(navigationHeight)==")
        view.addSubview(titLab)
        titLab.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10 + navigationHeight)
            $0.left.equalToSuperview().offset(20)
        }
        view.addSubview(textBgView)
        textBgView.snp.makeConstraints {
          $0.top.equalTo(titLab.snp_bottom).offset(10)
            $0.right.equalToSuperview().offset(-20)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(80)
        }
        
        textBgView.addSubview(nameLab)
        nameLab.snp.makeConstraints {
            
           $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(10)
        }
        
        textBgView.addSubview(yanyiLab)
        yanyiLab.snp.makeConstraints {
            
            $0.top.equalTo(nameLab.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(10)
            $0.bottom.right.equalToSuperview().offset(0)

        }
        
        view.addSubview(timeLab)
        timeLab.snp.makeConstraints {
            
            $0.top.equalTo(textBgView.snp.bottom).offset(25)
            $0.left.equalTo(textBgView.snp_left).offset(0)
            
        }
        timeLab.text = "选择修理时间"
        
        view.addSubview(timetext)
        timetext.snp.makeConstraints {
            
            $0.top.equalTo(timeLab.snp.bottom).offset(5)
            $0.left.equalTo(textBgView.snp_left).offset(0)
            $0.width.equalTo(screenWidth/2 - 40)
            $0.height.equalTo(40)

        }
        view.addSubview(seletBtn)
        seletBtn.snp.makeConstraints {
            
            $0.top.equalTo(timetext.snp.top).offset(0)
            $0.left.equalTo(timetext.snp_right).offset(0)
            $0.width.equalTo(60)
            $0.height.equalTo(40)
            
        }
        
        timetext.text = "YYYY-MM-dd"
        view.addSubview(baoxiuLab)
        baoxiuLab.snp.makeConstraints {
            
            $0.top.equalTo(timetext.snp.bottom).offset(25)
            $0.left.equalTo(textBgView.snp_left).offset(0)
            
        }
        timeLab.text = "选择修理时间"
        
        view.addSubview(baoxiuLabtext)
        baoxiuLabtext.snp.makeConstraints {
            
            $0.top.equalTo(baoxiuLab.snp.bottom).offset(5)
            $0.left.equalTo(textBgView.snp_left).offset(0)
            $0.width.equalTo(screenWidth/2 - 40)
            $0.height.equalTo(40)
            
        }
        view.backgroundColor = UIColor.background
        
        
        view.addSubview(peopleLab)
        peopleLab.snp.makeConstraints {
            
            $0.top.equalTo(baoxiuLabtext.snp.bottom).offset(25)
            $0.left.equalTo(textBgView.snp_left).offset(0)
            
        }
        
        view.addSubview(peopletext)
        peopletext.snp.makeConstraints {
            
            $0.top.equalTo(peopleLab.snp.bottom).offset(5)
            $0.left.equalTo(textBgView.snp_left).offset(0)
            $0.width.equalTo(screenWidth/2)
            $0.height.equalTo(40)
            
        }
        
        view.addSubview(addressLab)
        addressLab.snp.makeConstraints {
            
            $0.top.equalTo(peopletext.snp.bottom).offset(25)
            $0.left.equalTo(textBgView.snp_left).offset(0)
            
        }
        
        view.addSubview(addressbtext)
        addressbtext.snp.makeConstraints {
            
            $0.top.equalTo(addressLab.snp.bottom).offset(5)
            $0.left.equalTo(textBgView.snp_left).offset(0)
            $0.width.equalTo(screenWidth/2 - 40)
            $0.height.equalTo(40)
            
        }
        
        view.addSubview(subBtn)
        subBtn.snp.makeConstraints {
            
            $0.top.equalTo(addressbtext.snp.bottom).offset(35)
            $0.left.right.equalTo(textBgView).offset(0)
            $0.height.equalTo(40)
            
        }
    }
}
