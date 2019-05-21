

import UIKit
import Reusable

class UBaseTableViewHeaderFooterView: UITableViewHeaderFooterView,Reusable {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  open func configUI() {}
}
