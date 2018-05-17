//
//  RoundButton.swift
//  savetime
//
//  Created by 정혁 on 2018. 5. 17..
//  Copyright © 2018년 정혁. All rights reserved.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {

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
