//
//  Style.swift
//  IbottaDevTest
//
//  Created by Muhammad Luqman on 10/25/20.
//

import Foundation
import UIKit

class BaseLabel: UILabel {
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        configure()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    /// :-Custom function to overide for child classes
    public func configure() { }
}

class Title:BaseLabel {
    
    /// Configure Label Style
    override public func configure() {
        
        self.font = UIFont(name: AvenirNext_DemiBold, size: LabelTitle_Size)
        self.textColor = UIColor.colorFrom(hexString: LabelColor_Hex, alpha: 1)
        
    }
}

class Detail:BaseLabel{
    
    /// Configure Label Style
    override public func configure() {
        
        self.font = UIFont(name: AvenirNext_Regular, size: LabelDetail_Size)
        self.textColor = UIColor.colorFrom(hexString: LabelColor_Hex, alpha: 1)
        
    }
}
