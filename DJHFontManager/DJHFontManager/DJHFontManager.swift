//
//  DJHFontManager.swift
//  DJHFontManager
//
//  Created by Diyaa Hamza on 12/5/18.
//  Copyright © 2018 dhamza. All rights reserved.
//

import UIKit
open class DJHFontManager {
    public enum DJHFontType {
        case reqular
        case bold
        case light
        case italic
        case black
    }
    public static let shared = DJHFontManager()
    private var config = DJHFotnConfigration()
    
    public func activate(config: DJHFotnConfigration){
        self.config = config
        UIFont.overrideInitialize()
    }
    
    public func getFontName(_ type: DJHFontType) -> String{
        var fontName = ""
        switch type {
        case .reqular:
            fontName = config.reqular ?? ""
            break
        default:
            fontName = config.reqular ?? ""
            break
        }
        
        return fontName
    }
    public class DJHFotnConfigration {
        var reqular: String?
        var bold: String?
        var light: String?
        var italic: String?
        var black: String?
        public init() {
            
        }
        public init(reqular: String, bold: String, light: String, italic: String, black: String) {
            self.reqular = reqular
            self.bold = bold
            self.light = light
            self.italic = italic
            self.black = black
        }
    }
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
    static let nsFontName = UIFontDescriptor.AttributeName(rawValue: "NSFontNameAttribute")
}

extension UIFont {
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsFontName] as? String
            else{
                self.init(myCoder: aDecoder)
                return
                
        }
        var fontName = ""
        let fAttribute = fontAttribute.lowercased()
        if fAttribute.hasSuffix("bold") {
            fontName = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.bold)
        }else if fAttribute.hasSuffix("black"){
            fontName = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.black)
        }else if fAttribute.hasSuffix("light"){
            fontName = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.light)
        }else if fAttribute.hasSuffix("italic"){
            fontName = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.italic)
        }else{
            fontName = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.reqular)
        }
        
        if fontName == ""{
            self.init(myCoder: aDecoder)
            return
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
