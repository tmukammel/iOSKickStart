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
    
    public func getServerConfig() -> ServerConfig {
        return self.builder.serverConfig
    }
    
    public func getLocal() -> String {
        return self.builder.local
    }
    
    public func getTheme() -> AppTheme {
        return self.builder.theme
    }
    
    public func getThemeType() -> ThemeType {
        return self.builder.themeType
    }
    
    public func getBuildType() -> BuildType {
        return self.builder.buildType
    }
    
    public func getStandardCornerRadius() -> CGFloat {
        return self.builder.standardCornerRadius
    }
    
    public class Builder{
        var local: String!
        var serverConfig: ServerConfig!
        var theme: AppTheme!
        var themeType: ThemeType!
        var buildType: BuildType!
        var standardCornerRadius: CGFloat!
        
        public func setServerConfig(serverConfig: ServerConfig) -> Builder{
            self.serverConfig = serverConfig
            return self
        }
        
        public func setThemeType(themeType: ThemeType) -> Builder{
            self.themeType = themeType
            return self
        }
        
        public func addBuildType(buildType: BuildType) -> Builder{
            self.buildType = buildType
            return  self
        }
        
        public func setNormalTheme(theme: AppTheme) -> Builder{
            self.theme = theme
            return self
        }
        
        public func setDarkTheme(theme: AppTheme) -> Builder{
            self.theme = theme
            return self
        }
        
        public func setLocale(local: String) -> Builder{
            self.local = local
            return self
        }
        
        public func setStandardCornerRadius(radius: CGFloat) -> Builder{
            self.standardCornerRadius = radius
            return self
        }
        
        public func commit() {
            AppConfig.shared.builder = self
        }
    }
}



func testAppConfig() -> Void {
    //builder, build -> return theme
    let theme = AppTheme.Builder()
        .addColors(colors: Colors())
        .addFonts(fonts: Fonts())
        .build()

    //server/api config builder
    let serverConfig = ServerConfig.Builder()
        .addBaseUrl(baseUrl: "")
        .addApiVersion(apiVersion: "")
        .addAuthCredential(credential: AuthCredential())
        .addBuildType(buildType: .DEVELOP)
        .build()

    //Singleton with builder, commit-> no return
    AppConfig.Builder()
        .setServerConfig(serverConfig: serverConfig)
        .setThemeType(themeType: .DARK)
        .setNormalTheme(theme: theme)
        .setDarkTheme(theme: theme)
        .setStandardCornerRadius(radius: 1.0)
        .setLocale(local: "")
        .commit()
}

