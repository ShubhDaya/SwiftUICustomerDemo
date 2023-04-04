
import Foundation
import SwiftUI

struct Globals {
    static var boxSize: CGFloat {
        return UIScreen.main.bounds.width * 0.9
    }
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
    
    static let stravaDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z"
        return formatter
    }()
    
    static let simpleDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, Y"
        return formatter
    }()
    
    static func dismissToRoot() {
        for window in UIApplication.shared.windows {
            var viewController = window.rootViewController
            
            while let presentedViewController = viewController!.presentedViewController {
                viewController = presentedViewController
            }
            
            viewController!.dismiss(animated: true)
        }
        
       /*
        
        if var topController = UIApplication.shared.windows.first!.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.dismiss(animated: true)
        }
        
        */
    }
}

extension Globals {
    static func print(_ object: Any...) {
        #if DEBUG
        for item in object {
            Swift.print(item)
        }
        #endif
    }
    
    static func print(_ object: Any) {
        #if DEBUG
        Swift.print(object)
        #endif
    }
}
