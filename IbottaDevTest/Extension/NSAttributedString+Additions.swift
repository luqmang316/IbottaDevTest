//
//  NSAttributedString+Additions.swift
//  IbottaDevTest
//
//  Created by Muhammad Luqman on 10/26/20.
//

import UIKit

extension NSAttributedString {
    
    class func underLine(mainString: String, subString: String, fontName: String, fontSize: CGFloat) ->  NSMutableAttributedString{
        
        let rangeSignUp = NSString(string: mainString).range(of: subString, options: String.CompareOptions.caseInsensitive)
        let rangeFull = NSString(string: mainString).range(of: mainString, options: String.CompareOptions.caseInsensitive)
        let attrStr = NSMutableAttributedString.init(string:mainString)
        attrStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.black,
                               NSAttributedString.Key.font : UIFont.init(name: fontName, size: fontSize)! as Any],range: rangeFull)
        attrStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.black,
                               NSAttributedString.Key.font : UIFont.init(name: fontName, size: fontSize)!,
                               NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue as Any],range: rangeSignUp)
        
        return attrStr
    }
}
