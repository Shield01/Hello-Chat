//
//  HelloLine.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 26/11/2023.
//

import UIKit

//class HelloLine : UIView {
//    
//    //MARK: Properties
//    
//    private var lineHeight : CGFloat {
//        didSet{
//            configureLine()
//        }
//    }
//    
//    private var lineWidth : CGFloat {
//        didSet{
//            configureLine()
//        }
//    }
//    
//    private var lineColor : UIColor {
//        didSet{
//            configureLine()
//        }
//    }
//    
//    //MARK: Lifecycle
//    
//    init(
//        color: UIColor? = UIColor.lightGray,
//        height: CGFloat? = 1.0,
//        width: CGFloat? = 100
//    ) {
//        self.lineColor = color!
//        self.lineHeight = height!
//        self.lineWidth = width!
//        super.init(frame: .zero)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    //MARK: Helpers
//    
//    func configureLine(){
//        setLineHeight()
//        setLineSize()
//    }
//    
//    //MARK: Setters
//    
//    private func setLineHeight() {
//        backgroundColor = lineColor
//    }
//    
//    private func setLineSize() {
//        self.setDimensions(width: lineWidth, height: lineHeight)
//    }
//}

class HelloLine: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(UIColor.black.cgColor)
            context.setLineWidth(2.0)

            // Draw a line from (startX, startY) to (endX, endY)
            let startX: CGFloat = 20.0
            let startY: CGFloat = bounds.midY
            let endX: CGFloat = bounds.width - 20.0
            let endY: CGFloat = bounds.midY

            context.move(to: CGPoint(x: startX, y: startY))
            context.addLine(to: CGPoint(x: endX, y: endY))

            context.strokePath()
        }
    }
}
