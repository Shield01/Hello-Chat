//
//  Extensions.swift
//  TwitterTutorial
//
//  Created by Stephen Dowless on 1/12/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat? = nil, constant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant!).isActive = true
        
        if let leftAnchor = leftAnchor, let padding = paddingLeft {
            self.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
        }
    }
    
    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func addConstraintsToFillView(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}

// MARK: - UIColor

//extension UIColor {
//    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
//        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
//    }
//    
//    static let twitterBlue = UIColor.rgb(red: 29, green: 161, blue: 242)
//    
//    static let grayDark = UIColor.rgb(red: 34, green: 34, blue: 34)
//    static let gray = UIColor.rgb(red: 153, green: 153, blue: 153)
//    static let gray_light = UIColor.rgb(red: 232, green: 232, blue: 232)
//    static let white = UIColor.rgb(red: 255, green: 255, blue: 255)
//    
//    static let deepPurpleGradient = UIColor.rgb(red: 140, green: 81, blue: 165)
//    static let faintPurpleGradient = UIColor.rgb(red: 203, green: 94, blue: 152)
//    
//    static let deep_blue_gradient = UIColor.rgb(red: 0, green: 76, blue: 162)
//    static let faint_blue_gradient = UIColor.rgb(red: 40, green: 81, blue: 65)
//    
//    static let deep_coral_gradient = UIColor.rgb(red: 244, green: 123, blue: 138)
//    static let faint_coral_gradient = UIColor.rgb(red: 255, green: 163, blue: 127)
//    
//    static let deep_yellow_gradient = UIColor.rgb(red: 255, green: 210, blue: 133)
//    static let faint_yellow_gradient = UIColor.rgb(red: 255, green: 255, blue: 165)
//}

//MARK: UIFont

extension UIFont{
    static private func createFont(ofName name : String, andSize size : CGFloat, andWeight weight: CGFloat) -> UIFont?{
        return UIFont(name: name, size: size)
    }
    
    static let ios_typography = createFont(ofName: "SF Compact Display", andSize: 24, andWeight: 700)
    static let sf_compact_display_regular = createFont(ofName: "SF Compact Display", andSize: 48, andWeight: 400)
    static let sf_compact_display_bold = createFont(ofName: "SF Compact Display", andSize: 48, andWeight: 400)
    
    static let paragraph_bold = createFont(ofName: "SF Compact Display", andSize: 18, andWeight: 700)
    static let paragraph_regular = createFont(ofName: "SF Compact Display", andSize: 16, andWeight: 400)
    static let text_link_bold = createFont(ofName: "SF Compact Display", andSize: 12, andWeight: 700)
    static let infos_regular = createFont(ofName: "SF Compact Display", andSize: 12, andWeight: 400)
}



//MARK: UIImage

extension UIImage {

func tintedWithLinearGradientColors(colorsArr: [CGColor]) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
    guard let context = UIGraphicsGetCurrentContext() else {
        return UIImage()
    }
    context.translateBy(x: 0, y: self.size.height)
    context.scaleBy(x: 1, y: -1)

    context.setBlendMode(.normal)
    let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)

    // Create gradient
    let colors = colorsArr as CFArray
    let space = CGColorSpaceCreateDeviceRGB()
    let gradient = CGGradient(colorsSpace: space, colors: colors, locations: nil)

    // Apply gradient
    context.clip(to: rect, mask: self.cgImage!)
    context.drawLinearGradient(gradient!, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: self.size.height), options: .drawsAfterEndLocation)
    let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return gradientImage!
}
}
