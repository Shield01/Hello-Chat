//
//  HelloLabel.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 24/11/2023.
//

import UIKit

class HelloLabel : UILabel {
    
    public var content : Any {
        didSet{
            initialize()
        }
    }
    
    public var contentFont : UIFont? {
        didSet{
            initialize()
        }
    }
    
    public var contentColor : UIColor? {
        didSet{
            initialize()
        }
    }

    public var maximumWidth : CGFloat? {
        didSet{
            initialize()
        }
    }
    public var labelWidth : CGFloat? {
        didSet{
            initialize()
        }
    }
    public var labelNumberOfLines : Int {
        didSet{
            initialize()
        }
    }
    
    
    init(
        content : Any,
        contentFont : UIFont? = nil,
        contentColor : UIColor? = nil,
        contentColors : [CGColor]? = nil,
        maximumWidth : CGFloat? = nil,
        labelWidth : CGFloat? = nil,
        labelNumberOfLines : Int = 0
    ){
        self.content = content
        
        if let contentFont = contentFont {
            self.contentFont = contentFont
        }
        
        if let contentColor = contentColor {
            self.contentColor = contentColor
        }
        
        if let maximumWidth = maximumWidth {
            self.maximumWidth = maximumWidth
        }
        
        if let labelWidth = labelWidth {
            self.labelWidth = labelWidth
        }
        
        self.labelNumberOfLines = labelNumberOfLines
        
        super.init(frame: .zero)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize(){
        setText()
        setFont()
        setLabelColor()
        setWidth()
        setNumberOfLines()
    }
    
    func setText(){
        if let content = content as? String{
            text = content
        }else if let content = content as? NSAttributedString{
            attributedText = content
        }
    }
    
    func setFont(){
        guard let content = content as? String else { return }
        font = contentFont
    }
    
    func setLabelColor(){
            guard let contentColor = contentColor else { return }
            textColor = contentColor
    }
    
    func setWidth(){
        if let maximumWidth = maximumWidth{
            preferredMaxLayoutWidth = maximumWidth
        }else if let labelWidth = labelWidth{
            widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        }
    }
    
    func setNumberOfLines(){
        numberOfLines = labelNumberOfLines
    }
}


class GradientLabel: HelloLabel {
    var gradientColors: [CGColor] = []
    
    override init(
        content: Any,
        contentFont : UIFont? = nil,
        contentColor: UIColor? = nil,
        contentColors: [CGColor]? = nil,
        maximumWidth: CGFloat? = nil,
        labelWidth: CGFloat? = nil,
        labelNumberOfLines: Int = 0
    ) {
        if let gradientColors = contentColors {
            self.gradientColors = gradientColors
        }
        super.init(
            content: content,
            contentFont: contentFont,
            contentColor: contentColor,
            contentColors: contentColors,
            maximumWidth: maximumWidth, 
            labelWidth: labelWidth,
            labelNumberOfLines: labelNumberOfLines
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        if let gradientColor = drawGradientColor(in: rect, colors: gradientColors) {
            self.textColor = gradientColor
        }
        super.drawText(in: rect)
    }

    private func drawGradientColor(in rect: CGRect, colors: [CGColor]) -> UIColor? {
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext?.saveGState()
        defer { currentContext?.restoreGState() }

        let size = rect.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else { return nil }

        let context = UIGraphicsGetCurrentContext()
        context?.drawLinearGradient(gradient,
                                    start: CGPoint.zero,
                                    end: CGPoint(x: size.width, y: 0),
                                    options: [])
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = gradientImage else { return nil }
        return UIColor(patternImage: image)
    }
}
