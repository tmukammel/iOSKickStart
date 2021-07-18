//
//  ServerConfig.swift
//  iOSKickStart
//
//  Created by JMC on 18/7/21.
//

import Foundation


public class ServerConfig {
   private var builder: Builder

   init(builder: Builder) {
      self.builder = builder
   }

   func getBaseUrl(baseUrl: String) -> String{
        return self.builder.baseUrl
   }

    func getApiVersion() -> String{
        return self.builder.apiVersion
    }

//    func setAuthCredential() -> Credential{
//        return self.builder.credential
//    }

    public class Builder{
        var baseUrl: String!
        var apiVersion: String!
//        var credential: Credential!

        func addBaseUrl(baseUrl: String) -> Builder{
            self.baseUrl = baseUrl
            return self
        }

        func addApiVersion(apiVersion: String) -> Builder{
            self.apiVersion = apiVersion
            return self
        }

//        func addAuthCredential(credential: Credential) -> Builder{
//            self.credential = credential
//            return  self
//        }

        func build() -> ServerConfig {
            return ServerConfig(builder: self)
         }
     }
}
