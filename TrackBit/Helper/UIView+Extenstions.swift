//
//  UIView+Extenstions.swift
//  TrackBit
//
//  Created by Vladislav on 07.08.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func amendShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 0.5
    }
    
    
}
