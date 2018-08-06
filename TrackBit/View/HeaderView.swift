//
//  HeaderView.swift
//  TrackBit
//
//  Created by Vladislav on 08.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate:class {
     func refreshButtonTapped()
}

class HeaderView:UIView {
    
    @IBOutlet weak var titleLabel:UILabel!
    
    weak var delegate:HeaderViewDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = "Bitcoin Price"
    }
    
    @IBAction func refreshTapped(_ sender:UIButton) {
        delegate?.refreshButtonTapped()
        sender.increaseAnimation()
    }
    
    
}
