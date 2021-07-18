//
//  AppConfig.swift
//  iOSKickStart
//
//  Created by JMC on 18/7/21.
//

import Foundation


public class AppConfig {
    public static let shared = AppConfig()
    private var builder: Builder!
    
    private init() {
    }
    
    private init(builder: Builder) {
        self.builder = builder
    }
    
    func getServerConfig() -> ServerConfig {
        return self.builder.serverConfig
    }
    
    func getLocal() -> String {
        return self.builder.local
    }
    
    func getTheme() -> AppTheme {
        return self.builder.theme
    }
    
    func getStandardCornerRadius() -> CGFloat {
        return self.builder.standardCornerRadius
    }
    
    class Builder{
        var local: String!
        var serverConfig: ServerConfig!
        var theme: AppTheme!
        var themeType: ThemeType!
        var standardCornerRadius: CGFloat!
        
        func setServerConfig(serverConfig: ServerConfig) -> Builder{
            self.serverConfig = serverConfig
            return self
        }
        
        func setThemeType(themeType: ThemeType) -> Builder{
            self.themeType = themeType
            return self
        }
        
        func setNormalTheme(theme: AppTheme) -> Builder{
            self.theme = theme
            return self
        }
        
        func setDarkTheme(theme: AppTheme) -> Builder{
            self.theme = theme
            return self
        }
        
        func setLocale(local: String) -> Builder{
            self.local = local
            return self
        }
        
        func commit() {
            AppConfig.shared.builder = self
        }
    }
}
