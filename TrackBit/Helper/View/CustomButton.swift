//
//  CustomButton.swift
//  TrackBit
//
//  Created by Vladislav on 06.08.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override var isSelected: Bool {
        didSet {
            var color:UIColor
            color = isSelected ? UIColor.purple : UIColor.white
            backgroundColor = color
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            let alpha:CGFloat = isHighlighted ? 0.2 : 1.0
            backgroundColor = backgroundColor?.withAlphaComponent(alpha)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setTitleColor(UIColor.white, for: .selected)
        setTitleColor(UIColor.purple, for: .normal)
    }
    
    

}
