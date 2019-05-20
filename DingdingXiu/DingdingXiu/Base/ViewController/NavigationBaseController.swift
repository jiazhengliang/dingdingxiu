//
//  NavigationBaseController.swift
//  DingdingXiu
//
//  Created by mac on 2019/5/20.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class NavigationBaseController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let interactionGes = interactivePopGestureRecognizer else {
            return
        }
        
        guard let targetView = interactionGes.view else {
            return
        }
        // Do any additional setup after loading the view.
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
