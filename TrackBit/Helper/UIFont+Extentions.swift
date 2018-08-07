//
//  UIFont+Extentions.swift
//  TrackBit
//
//  Created by Vladislav on 08.08.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func regularAppFont(with size:CGFloat) -> UIFont {
        return UIFont(name: FontNames.regular.rawValue, size: size)!
    }
    static func lightAppFont(with size:CGFloat) -> UIFont {
        return UIFont(name: FontNames.light.rawValue, size: size)!
    }
    static func mediumAppFont(with size:CGFloat) -> UIFont {
        return UIFont(name: FontNames.medium.rawValue, size: size)!
    }
    static func semiboldAppFont(with size:CGFloat) -> UIFont {
        return UIFont(name: FontNames.semibold.rawValue, size: size)!
    }
    
    
    private enum FontNames:String {
        case regular = "WorkSans-Regular"
        case light = "WorkSans-Light"
        case medium = "WorkSans-Medium"
        case semibold = "WorkSans-SemiBold"
    }
}
