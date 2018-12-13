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
        case medium
    }
    public static let shared = DJHFontManager()
    private  var config = DJHFotnConfigration()
    
    public func activate(config: DJHFotnConfigration){
        self.config = config
        UIFont.overrideInitialize()
    }
    
    public func getFontName(_ type: DJHFontType) -> String{
        var fontName = ""
        switch type {
        case .bold:
            fontName = config.bold ?? ""
        case .medium:
            fontName = config.medium ?? ""
        case .black:
            fontName = config.black ?? ""
        case .italic:
            fontName = config.italic ?? ""
        case .light:
            fontName = config.light ?? ""
        case .reqular:
            fontName = config.reqular ?? ""
        }
        return fontName
    }
    public class DJHFotnConfigration {
        var reqular: String?
        var bold: String?
        var light: String?
        var italic: String?
        var black: String?
        var medium: String?
        public init() { }
        
        public init(reqular: String, bold: String, light: String, italic: String, black: String, medium: String) {
            self.reqular = reqular
            self.bold = bold
            self.light = light
            self.italic = italic
            self.black = black
            self.medium = medium
        }
    }
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
    static let nsFontName = UIFontDescriptor.AttributeName(rawValue: "NSFontNameAttribute")
}

extension UIFont {
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.bold), size: size)!
    }
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        if let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor {
            
            if let fontAttribute = fontDescriptor.fontAttributes[.nsFontName] as? String {
                
                var fontNameString = ""
                let fAttribute = fontAttribute.lowercased()
                if fAttribute.hasSuffix("bold") {
                    fontNameString = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.bold)
                }else if fAttribute.hasSuffix("black"){
                    fontNameString = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.black)
                }else if fAttribute.hasSuffix("light"){
                    fontNameString = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.light)
                }else if fAttribute.hasSuffix("italic"){
                    fontNameString = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.italic)
                }else if fAttribute.hasSuffix("medium"){
                    fontNameString = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.medium)
                }else{
                    fontNameString = DJHFontManager.shared.getFontName(DJHFontManager.DJHFontType.reqular)
                }
                
                debugPrint("Final font name**:",fontNameString)
                
                if fontNameString == ""{
                    self.init(myCoder: aDecoder)
                    return
                }
                self.init(name: fontNameString, size: fontDescriptor.pointSize)!
                
                
            }else{
                self.init(myCoder: aDecoder)
            }
        }else{
            self.init(myCoder: aDecoder)
        }
        
        
        
        
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return}
        let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:)))
        let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:)))
        method_exchangeImplementations(initCoderMethod!, myInitCoderMethod!)
        
    }
}
