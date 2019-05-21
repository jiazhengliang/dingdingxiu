//
//  UBaseCollectionViewCell.swift
//  DingdingXiu
//
//  Created by jones on 2019/5/21.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class UBaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}
}
