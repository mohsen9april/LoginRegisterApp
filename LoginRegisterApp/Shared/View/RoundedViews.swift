//
//  RoundedViews.swift
//  LoginRegisterApp
//
//  Created by Mohsen Abdollahi on 5/24/19.
//  Copyright © 2019 Mohsen Abdl. All rights reserved.
//

import UIKit

class RoundedButton : UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}

class RoundedShadowView : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.blue.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
    }
}

class RoundedImageView : UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
