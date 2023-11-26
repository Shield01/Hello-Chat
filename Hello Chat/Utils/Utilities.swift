//
//  Utilities.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 22/11/2023.
//

import UIKit

class Utilities{
    func getPointValue(of pixelValue : CGFloat) -> CGFloat{
        return  pixelValue / UIScreen.main.scale
    }
}


