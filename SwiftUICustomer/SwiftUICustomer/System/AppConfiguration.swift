//
//  AppConfiguration.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 20/02/23.
//

import Foundation
import Foundation

final class AppConfiguration {
    static let shared = AppConfiguration()
    var currentEnvironment = AppEnvironment.production

    //Environment Variables
    lazy var isDevelopment: Bool = {
        if self.currentEnvironment == AppEnvironment.development ||
            self.currentEnvironment == AppEnvironment.staging ||
            self.currentEnvironment == AppEnvironment.uat {
            return true
        }
        return false
    }()
    
    func updateEnvironment() {
        
        if let bundle = Bundle.main.bundleIdentifier {
            if bundle.localizedStandardContains("Demo") {
                self.currentEnvironment = AppEnvironment.uat
                return
            }
        }
        
#if IOS_SIMULATOR
        self.currentEnvironment = AppEnvironment.development
#else
        self.currentEnvironment = AppEnvironment.production
#endif
        return
    
        var newEnvironment = AppEnvironment.production
        
        guard let environment = UserDefaults.standard.string(forKey: "environment") else {
            self.currentEnvironment = AppEnvironment.production
            return
        }
        
        if(environment == AppEnvironment.production.rawValue) {
            newEnvironment = AppEnvironment.production
        } else if(environment == AppEnvironment.staging.rawValue) {
            newEnvironment = AppEnvironment.staging
        } else if(environment == AppEnvironment.uat.rawValue) {
            newEnvironment = AppEnvironment.uat
        } else if(environment == AppEnvironment.development.rawValue) {
            newEnvironment = AppEnvironment.development
        }

        self.currentEnvironment = newEnvironment
    }

    //API Variables
    func APIBaseURL() -> String {
        switch self.currentEnvironment {
            case .development:
                if let APIBaseURL = Bundle.main.object(forInfoDictionaryKey: "DevelopmentAPIBaseURL") as? String {
                    return APIBaseURL
                }
            case .staging:
                if let APIBaseURL = Bundle.main.object(forInfoDictionaryKey: "StagingAPIBaseURL") as? String {
                    return APIBaseURL
                }
            case .uat:
                if let APIBaseURL = Bundle.main.object(forInfoDictionaryKey: "UATAPIBaseURL") as? String {
                    return APIBaseURL
                }
            case .production:
                if let APIBaseURL = Bundle.main.object(forInfoDictionaryKey: "ProductionAPIBaseURL") as? String {
                    return APIBaseURL
                }
        }
        
        guard let APIBaseURL = Bundle.main.object(forInfoDictionaryKey: "ProductionAPIBaseURL") as? String else {
            fatalError("APIBaseURL must not be empty in plist")
        }
        
        return APIBaseURL
    }
    
    //Development Variables
    class func sampleCreateDictionary() -> [String: String]? {
        if AppConfiguration.shared.isDevelopment {
            return Bundle.main.object(forInfoDictionaryKey: "SampleCreateAchievementDictionary") as? [String: String]
        }
        
        return nil
    }
    
    class func sampleAuthenticationDictionary() -> [String: String]? {
        if AppConfiguration.shared.isDevelopment {
            return Bundle.main.object(forInfoDictionaryKey: "SampleAuthenticationDictionary") as? [String: String]
        }
        
        return nil
    }
    
}
         
public enum AppEnvironment: String {
     case production
     case staging
     case uat
     case development
 }
