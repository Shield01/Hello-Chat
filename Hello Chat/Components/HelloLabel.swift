//
//  HelloLabel.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 24/11/2023.
//

import UIKit

enum LabelType {
    case Label
    case GradientLabel
}

class HelloLabel : GradientLabel{
    
    public var labelType : LabelType{
        didSet{
            initialize()
        }
    }
    
    public var content : Any{
        didSet{
            initialize()
        }
    }
    
    public var contentColor : UIColor?{
        didSet{
            initialize()
        }
    }
    
    public var contentColors: [CGColor]?{
        didSet{
            initialize()
        }
    }
    
    public var maximumWidth : CGFloat?{
        didSet{
            initialize()
        }
    }
    public var labelWidth : CGFloat?{
        didSet{
            initialize()
        }
    }
    public var labelNumberOfLines : Int{
        didSet{
            initialize()
        }
    }
    
    
    init(
        labelType : LabelType,
        content : Any,
        contentColor : UIColor? = nil,
        contentColors : [CGColor]? = nil,
        maximumWidth : CGFloat? = nil,
        labelWidth : CGFloat? = nil,
        labelNumberOfLines : Int = 0
    ){
        self.labelType = labelType
        
        self.content = content
        
        if let contentColor = contentColor {
            self.contentColor = contentColor
        }
        
        if let contentColors = contentColors{
            self.contentColors = contentColors
        }
        
        if let maximumWidth = maximumWidth{
            self.maximumWidth = maximumWidth
        }
        
        if let labelWidth = labelWidth{
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
        setAttributedText()
        setLabelColor()
        setWidth()
        setNumberOfLines()
    }
    
    func setText(){
        guard let content = content as? String else { return }
        text = content
    }
    
    func setAttributedText(){
        guard let content = content as? NSAttributedString else { return }
        attributedText = content
    }
    
    func setLabelColor(){
        if labelType == .Label {
            guard let contentColor = contentColor else { return }
            textColor = contentColor
        }else{
            guard let contentColors = contentColors else { return }
            gradientColors = contentColors
        }
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
