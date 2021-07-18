//
//  AppTheme.swift
//  iOSKickStart
//
//  Created by JMC on 18/7/21.
//

import Foundation


public enum ThemeType{
    case NORMAL
    case DARK
}

// theme color collection
public class Colors {
    public var mainThemeColor: UIColor?
    public var mainNavBarColor: UIColor?
    public var mainButtonColor: UIColor?
    public var mainTextColor: UIColor?
    public var disabledTextColor: UIColor?
    public var whiteTransparentColor: UIColor?
    public var textFieldBGColor: UIColor?
}

// fonts collection
public class Fonts {
    public var primaryNormal: UIFont?
    public var primaryBold: UIFont?
    public var primarySemibold: UIFont?
}

public class AppTheme {
    private var builder: Builder
    
    init(builder: Builder) {
        self.builder = builder
    }
    
    public func getColors(colors: Colors) -> Colors{ 
        return self.builder.colors
    }
    
    public func getFonts(colors: Colors) -> Fonts{
        return self.builder.fonts
    }
    
    //    func getStyle(style: Style) -> Style{
    //       return self.builder.style
    //   }
    
    public class Builder{
        var colors: Colors!
        var fonts: Fonts!
        //        var style: style!
        
        public func addColors(colors: Colors) -> Builder{
            self.colors = colors
            return self
        }
        
        public func addFonts(fonts: Fonts) -> Builder{
            self.fonts = fonts
            return self
        }
        
        //        func addStyle(style: Style) -> Builder{
        //             self.style = style
        //         }
        
        public func build() -> AppTheme {
            return AppTheme(builder: self)
        }
    }
}
