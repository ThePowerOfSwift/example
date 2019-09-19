//
//  UIColor+theme.swift
//  DnDSpells
//
//  Created by Сергей Мельников on 12/07/2019.
//  Copyright © 2019 Сергей Мельников. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let button = #colorLiteral(red: 0.4392156863, green: 0.6862745098, blue: 0.8078431373, alpha: 1)
    
    
    class Palette {
        @nonobjc class var systemGray2: UIColor { return #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 0.6) }
        
        @nonobjc class var background: UIColor {
            return UIColor(red: 245 / 255, green: 246 / 255, blue: 250 / 255, alpha: 1)
        }

        @nonobjc class var charcoalGrey: UIColor {
            return UIColor(red: 53.0 / 255.0, green: 66.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var cerulean: UIColor {
            return UIColor(red: 2.0 / 255.0, green: 136.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0)
        }
        
        @nonobjc class var grey: UIColor {
            return UIColor(red: 105.0 / 255.0, green: 119.0 / 255.0, blue: 137.0 / 255.0, alpha: 1.0)
        }
        
        @nonobjc class var lightBlueGrey: UIColor {
            return UIColor(red: 203.0 / 255.0, green: 211.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var disadled: UIColor {
            return UIColor(red: 234.0 / 255.0, green: 236.0 / 255.0, blue: 239.0 / 255.0, alpha: 1.0)
        }
//
        @nonobjc class var paleGrey: UIColor {
            return UIColor(red: 246.0 / 255.0, green: 247.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
        }
        
        @nonobjc class var darkgrey: UIColor {
            return UIColor(red: 60.0 / 255.0, green: 74.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
        }
        
        @nonobjc class var azure: UIColor {
            return UIColor(red: 3.0 / 255.0, green: 169.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var dodgerBlue: UIColor {
            return UIColor(red: 51.0 / 255.0, green: 145.0 / 255.0, blue: 1.0, alpha: 1.0)
        }

        @nonobjc class var alert: UIColor {
            return UIColor(red: 245.0 / 255.0, green: 166.0 / 255.0, blue: 35.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var green: UIColor {
            return UIColor(red: 42.0 / 255.0, green: 185.0 / 255.0, blue: 0.0, alpha: 1.0)
        }

        @nonobjc class var error: UIColor {
            return UIColor(red: 1.0, green: 103.0 / 255.0, blue: 121.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var pressedBlue: UIColor {
            return UIColor(red: 149.0 / 255.0, green: 198.0 / 255.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}
