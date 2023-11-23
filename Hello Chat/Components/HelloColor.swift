//
//  HelloColor.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 23/11/2023.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let grayDark = UIColor.rgb(red: 34, green: 34, blue: 34)
    static let gray = UIColor.rgb(red: 153, green: 153, blue: 153)
    static let grayLight = UIColor.rgb(red: 232, green: 232, blue: 232)
    static let white = UIColor.rgb(red: 255, green: 255, blue: 255)
    
    static let deepPurpleGradient = UIColor.rgb(red: 140, green: 81, blue: 165)
    static let faintPurpleGradient = UIColor.rgb(red: 203, green: 94, blue: 152)
    
    static let deepBlueGradient = UIColor.rgb(red: 0, green: 76, blue: 162)
    static let faintBlueGradient = UIColor.rgb(red: 40, green: 81, blue: 65)
    
    static let deepCoralGradient = UIColor.rgb(red: 244, green: 123, blue: 138)
    static let faintCoralGradient = UIColor.rgb(red: 255, green: 163, blue: 127)
    
    static let deepYellowGradient = UIColor.rgb(red: 255, green: 210, blue: 133)
    static let faintYellowGradient = UIColor.rgb(red: 255, green: 255, blue: 165)
}
