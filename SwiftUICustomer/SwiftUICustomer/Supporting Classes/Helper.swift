//
//  Helper.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 21/02/23.
//

import Foundation
import UIKit

//func showAlert(_ title: String, _ message: String) {
//
//    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//    alert.addAction(okAction)
//    
//    if let delegate = UIApplication.shared.delegate as? AppDelegate {
//        if let window = delegate.window {
//            window.rootViewController?.present(alert, animated: true, completion: nil)
//        }
//    }
//}
//

func isValidEmail(_ email: String) -> Bool {
      let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
      return emailPredicate.evaluate(with: email)
  }

func removeToUserDefault(_ key: String) {
    let userDefault = UserDefaults.standard
       userDefault.removeObject(forKey: key)
       userDefault.synchronize()
}
func getFromUserDefaults(_ key: String) -> Any? {
    
    let userDefault = UserDefaults.standard
    
    if let dataValue = userDefault.value(forKey: key) as? Data {

        let value = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataValue)
        return value
    }
    return nil
}

func saveToUserDefault(_ key: String, _ value: Any) {
    
    let userDefault = UserDefaults.standard
    let data = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false)
    userDefault.setValue(data, forKey: key)
    userDefault.synchronize()
   
}
func getStringValue(_ dict: [String: Any], _ key: String) -> String {
    if let str = dict[key] as? String {
        return str
    } else if let num = dict[key] as? NSNumber {
        return "\(num)"
    }
    return ""
}

func userAlreadyExist(kUsernameKey: String) -> Bool {
    
    if let isNull = UserDefaults.standard.object(forKey: kUsernameKey){
        return true
    }
    return false
}


func getBooleanValue(_ dict: [String: Any],  key: String) -> Bool {
    
    if let val = dict[key] as? Bool {
        return val
    } else if let val = dict[key] as? NSNumber {
        return val.boolValue
    }
    return false
}

func getNumber(_ dict: [String: Any], _ key: String) -> NSNumber {
    
    if let title = dict[key] as? NSNumber {
        return title
    } else if let title0 = dict[key] as? String {
        let title = title0.trimmingCharacters(in: .whitespacesAndNewlines)
        if let title1 = Int(title) as Int? {
            return NSNumber(value: title1)
        } else if let title1 = Float(title) as Float? {
            return NSNumber(value: title1)
        } else if let title1 = Double(title) as Double? {
            return NSNumber(value: title1)
        } else if let title1 = Bool(title) as Bool? {
            return NSNumber(value: title1)
        }
        return 0
    } else {
        return 0
    }
}
extension Date {
    
    func getString(format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func getStringUTC(format: String) -> String {
        
        let dateFormatter = DateFormatter()
//        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func getTimeStampValue() -> Double {
        return self.timeIntervalSince1970/1000
    }
}
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
