//
//  ServerConfig.swift
//  iOSKickStart
//
//  Created by JMC on 18/7/21.
//

import Foundation


public enum BuildType {
    case DEVELOP
    case PRODUCTION
    case STAGING
}

public class AuthCredential{
    public var username: String?
    public var password: String?
    public var token: String?
    
    public init() {
        
    }
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    public init(username: String, password: String, token: String) {
        self.username = username
        self.password = password
        self.token = token 
    }
}

public class ServerConfig {
    private var builder: Builder
    
    private init(builder: Builder) {
        self.builder = builder
    }
    
    public func getBaseUrl(baseUrl: String) -> String{
        return self.builder.baseUrl
    }
    
    public func getApiVersion() -> String{
        return self.builder.apiVersion
    }
    
    public func setAuthCredential() -> AuthCredential{
        return self.builder.credential
    }
    
    public class Builder{
        var baseUrl: String!
        var apiVersion: String!
        var buildType: BuildType!
        var credential: AuthCredential!
        
        public func addBaseUrl(baseUrl: String) -> Builder{
            self.baseUrl = baseUrl
            return self
        }
        
        public func addApiVersion(apiVersion: String) -> Builder{
            self.apiVersion = apiVersion
            return self
        }
        
        public func addAuthCredential(credential: AuthCredential) -> Builder{
            self.credential = credential
            return  self
        }
        
        public func addBuildType(buildType: BuildType) -> Builder{
            self.buildType = buildType
            return  self
        }
        
        public func build() -> ServerConfig {
            return ServerConfig(builder: self)
        }
    }
}
