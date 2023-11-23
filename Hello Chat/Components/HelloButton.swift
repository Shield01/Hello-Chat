//
//  HelloButton.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 23/11/2023.
//

import UIKit

class HelloButton : UIButton{
    
    public var text : String{
        didSet{
            configureButton()
        }
    }
    public var titleLabelColor : UIColor{
        didSet{
            configureButton()
        }
    }
    public var buttonHeight : CGFloat{
        didSet{
            configureButton()
        }
    }
    public var buttonWidth : CGFloat{
        didSet{
            configureButton()
        }
    }
    public var cornerRadius : CGFloat{
        return buttonHeight / 2
    }
    
    public var controlState : UIControl.State {
        didSet{
            configureButton()
        }
    }
    public var color: UIColor {
        didSet{
            configureButton()
        }
    }
    public var font: UIFont{
        didSet{
            configureButton()
        }
    }
    
    
    
    init(
        text : String = "Dummy Button",
        titleLabelColor : UIColor = .white,
        buttonHeight : CGFloat = 12,
        buttonWidth : CGFloat = 18,
        controlState : UIControl.State = .normal,
        color : UIColor = .white,
        font : UIFont = .SFCompactMedium12!
    ) {
        self.text = text
        self.titleLabelColor = titleLabelColor
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
        self.controlState = controlState
        self.color = color
        self.font = font
        super.init(frame: .zero)
        
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureButton() {
        setBackground()
        setCustomText()
        setHeight()
        setWidth()
        setCornerRadius()
        setLabelColor()
        setLabelFont()
    }
    
    func setBackground(){
        backgroundColor = color
    }
    
    func setCornerRadius(){
        layer.cornerRadius = buttonHeight / 2
    }
    
    func setCustomText(){
        setTitle(self.text, for: self.controlState)
    }
    
    func setHeight(){
        heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
    }
    
    func setWidth(){
        widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    }
    
    func setLabelColor(){
        setTitleColor(self.titleLabelColor, for: self.controlState)
    }
    
    func setLabelFont(){
        titleLabel?.font = font
    }
}
