//
//  TimeZone.swift
//  SmartRxPharmacy
//
//  Created by LMS on 17/12/19.
//  Copyright © 2019 LMS. All rights reserved.
//

import Foundation
import UIKit

class TimeZoneSupport {

    static func getTimeZone() {
        //timezone.json
        
        let url = Bundle.main.url(forResource: "timezone", withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
            var json = try JSONSerialization.jsonObject(with: jsonData) as! [String:Any]
            
            if  var tz =  json["timeZone"] as? [Any] {
                
                tz.remove(at: 0)
                
                let currentTimeZone = getCurrentTimeZone()
                
                for i in 0..<tz.count { //for current timezone to the top.
                    
                    if let dict = tz[i] as? [String: Any] {
                        
//                        if  getStringValue(dict, "value") == currentTimeZone {
//                            (tz[0], tz[i]) = (tz[i], tz[0])
//                        }
                    }
                }
                
                for i in tz {
                    
//                    AppSharedData.shared.timeZone.append(ApptimeZone((i as AnyObject).value(forKey: "value") as? String ?? "", zoneName: (i as AnyObject).value(forKey: "name") as? String ?? ""))
                }
            }
        }
        catch {
            print(error)
        }
    }
}

class ApptimeZone{
    
    var value: String?
    var name: String?
    
    init(_ zoneValue: String?, zoneName: String?) {
        
        self.value = zoneValue
        self.name  = zoneName
    }
}

func getCurrentTimeZone() -> String {
    
    return TimeZone.current.identifier
}
