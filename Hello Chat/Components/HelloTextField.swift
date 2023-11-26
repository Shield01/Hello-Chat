//
//  HelloTextField.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 24/11/2023.
//

import UIKit

class HelloTextField : UITextField{
    
    var caretHeight : CGFloat = 2.0
    
//    init(
//        caretHeight : CGFloat? = 2.0
//    ){
//        self.caretHeight = caretHeight!
//        super.init()
//    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        var rect = super.caretRect(for: position)
        rect.size.height = caretHeight // Adjust the height as needed
        return rect
    }
}
