//
//  UIButton+Extensions.swift
//  TrackBit
//
//  Created by Vladislav on 12.07.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit


class Button:UIButton {
    override open var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? UIColor.purple : UIColor.white
        }
    }
    
    
    override open var isHighlighted: Bool {
        didSet {
            var alpha:Double
            if isHighlighted {
                alpha = 0.25
            }else {
                alpha = 1.0
            }
            self.backgroundColor?.withAlphaComponent(CGFloat(alpha))
        }
    }
}



