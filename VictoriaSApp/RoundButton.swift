//
//  RoundButton.swift
//  VictoriaSApp
//
//  Created by Vicky Juan on 10/17/18.
//  Copyright © 2018 Victoria Juan. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
