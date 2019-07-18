//
//  JournalTableViewCell.swift
//  MTN2RVR
//
//  Created by Sterling Mortensen on 7/18/19.
//  Copyright © 2019 Git Swifty. All rights reserved.
//

import UIKit

class JournalTableViewCell: UITableViewCell {

    var journal: Journal? {
        didSet {
            self.updateView()
        }
    }
    
    
    func updateView() {
        print("hello")
    }
}
