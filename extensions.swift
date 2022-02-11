//
//  extensions.swift
//  testApp
//
//  Created by Mario Saldana on 09/02/22.
//

import Foundation
import UIKit

extension UIColor{
    static var blue21: UIColor {
        return UIColor(red: 21/255, green: 164/255, blue: 225/255, alpha: 1.0)
    }
    static var random: UIColor {
        let randomred = Double.random(in: 1...255)
        let randomgreen = Double.random(in: 1...255)
        let randomblue = Double.random(in: 1...255)
        return UIColor(red: randomred/255, green: randomgreen/255, blue: randomblue/255, alpha: 1.0)
    }
}

extension UIFont{
    
    static var textFont : UIFont {
        return UIFont(name: "Avenir-Light", size: 20)!
    }
    static var textFont2 : UIFont {
        return UIFont(name: "Avenir-Black", size: 20)!
    }
}
