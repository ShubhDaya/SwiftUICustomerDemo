//
//  ServiceManager.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 21/02/23.
//


import Foundation
import Alamofire

var instance: ServiceManager?
var isAlertAvailable = false

class ServiceManager {
  
    class func sharedInstance() -> ServiceManager {
        if !(instance != nil) {
            instance = ServiceManager()
        }
        return instance!
    }
    
//    func executePropayServiceWithRequestUrl(urlStr:String,action:String,dicParams:[String:Any],method:RequestMethod,isShowingLoader:Bool,taskType:ServiceType, completionHandler:@escaping (_ response:AnyObject,_ error:Error?,_ type:ServiceType)->(Void)) {
//
//            if !Reachability.isConnectedToNetwork() {
//               showAlert("ok", AlertMessages.no_internet_connection)
//                return
//            }
//
//            if(isShowingLoader) {
//               // LoadingView.shared.showOverlay(nil)
//            }
//
//            let  actionWithAllowedCharactors = action.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//
//            let url:NSURL = NSURL(string:"\(urlStr)\(actionWithAllowedCharactors!)")!
//            let mutableURLRequest = NSMutableURLRequest(url: url as URL)
//            mutableURLRequest.httpMethod = method.rawValue
//            mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    //shubh    mutableURLRequest.setValue("Basic \(AppState.shared.userInfo.getToken)", forHTTPHeaderField: "Authorization")
////        mutableURLRequest.setValue("Basic NzE4ODA5MzAyOTk0Njk3MTpmMDNjNjQxYi0wYTAwLTQ1M2EtODQxNy1mZDFiODhiYjdlYjk=", forHTTPHeaderField: "Authorization")
//
//
//    //        if(ServiceType.kGuest == taskType) {
//    //
//    //        } else  {
//    //            let headerValue = AppSharedData.shared.userInfo.accessToken
//    //            mutableURLRequest.setValue(headerValue, forHTTPHeaderField: "Authorization")
//    //            print(headerValue)
//    //        }
//            mutableURLRequest.timeoutInterval = 90
//
//            if method != RequestMethod.kMethodGet {
//
//                let data = try! JSONSerialization.data(withJSONObject: dicParams, options: JSONSerialization.WritingOptions.prettyPrinted)
//
//                let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//                if let json = json {
//                    print(json)
//                }
//                mutableURLRequest.httpBody = json!.data(using: String.Encoding.utf8.rawValue);
//            }
//            print("Complete request is ",mutableURLRequest)
//
//            print("params-\(dicParams)-")
//
//            AF.request(mutableURLRequest as URLRequest)
//                .responseJSON { response in
//                    print("Request: \(String(describing: response.request))")  // original URL request
//
//                    print("result: \(response.result)")   // result of response serialization
//
//                    print("statusCode :  \(String(describing: response.response?.statusCode))" )
//
//                    if(response.response?.statusCode == nil){
//                        print("Status nil")
//
//                    //    LoadingView.shared.hideOverlayView()
//
//                        completionHandler(NSNull(), nil,taskType)
//                        return
//                    }
//
//                    if let JSON = response.result.value {
//
//                        print("JSON: \(JSON)")
//                        do{
//                            let jsonObj = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
//                            let jsonDict = jsonObj as! Dictionary<String, Any>
//
//
//                          /*  if(taskType == .kTaskLogin)
//                            {
//                                if let error = jsonDict["error"] as? String,error == "unauthorized_user"
//                                {
//                                    if(isShowingLoader)
//                                    {
//                                        LoadingView.shared.hideOverlayView()
//                                    }
//                                    let message = getStringValue(jsonDict, "message")
//                                    let error_description = getStringValue(jsonDict, "error_description")
//                                    if message.count > 0 {
//                                         showAlert("ok", getStringValue(jsonDict, "message"))
//                                    }else if(error_description.count > 0)
//                                    {
//                                         showAlert("ok", getStringValue(jsonDict, "error_description"))
//                                    }
//                                    return
//                                }
//                            }*/
//
//                            if let error = jsonDict["message"] as? String,error == "please provide valid token"
//                            {
//                                let errorObj = NSError(domain:"", code:400, userInfo:[ NSLocalizedDescriptionKey: "Invalid access token"])
//
//                                //                            completionHandler(jsonDict as AnyObject,errorObj, taskType)
//
//                                if(isShowingLoader)
//                                {
//                                 //   LoadingView.shared.hideOverlayView()
//
//                                }
//
//                                let alert: UIAlertController = UIAlertController(title: "Error", message:"Your session has expired. Please login again." , preferredStyle: .alert)
//                                let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
//                                    alert.dismiss(animated: true, completion: nil)
//                                   //  AppSharedData.shared.moveToLogin()
//                                }
//                                alert.addAction(okAction)
//                                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//
//                                return
//                            }
//
//                            switch response.result {
//
//                            case .success(let data):
//
//                                completionHandler(data as AnyObject, nil,taskType)
//
//                            case .failure(let error):
//                                print(error)
//                                completionHandler(jsonDict as AnyObject,error, taskType)
//                            }
//
//                            if(isShowingLoader)
//                            {
//                              //  LoadingView.shared.hideOverlayView()
//
//                            }
//
//                        }catch let error as Error{
//                            if(isShowingLoader)
//                            {
//                              //  LoadingView.shared.hideOverlayView()
//                            }
//
//
//                            print("error \(error)")
//                        }
//                    }else{
//
//                        if(isShowingLoader)
//                        {
//                          //  LoadingView.shared.hideOverlayView()
//                        }
//
//                        let alert = UIAlertController(title: "Server not responding", message: "Please try again later", preferredStyle: UIAlertController.Style.alert)
//                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//
//                    }
//            }
//        }
    
   /* func executePropayServiceWithRequestUrl(urlStr:String,action:String,dicParams:[String:Any],method:RequestMethod,taskType:ServiceType,isShowingLoader:Bool, completionHandler:@escaping (_ response:AnyObject,_ error:Error?,_ type:ServiceType)->(Void)) {
        
            let  actionWithAllowedCharactors = action.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
               
            let url:NSURL = NSURL(string:"\(urlStr)\(actionWithAllowedCharactors!)")!
            let mutableURLRequest = NSMutableURLRequest(url: url as URL)
            mutableURLRequest.httpMethod = method.rawValue
            mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            mutableURLRequest.setValue("Basic NzE4ODA5MzAyOTk0Njk3MTpmMDNjNjQxYi0wYTAwLTQ1M2EtODQxNy1mZDFiODhiYjdlYjk=", forHTTPHeaderField: "Authorization")
           // mutableURLRequest.setValue("Basic NzE4ODA5MzAyOTk0Njk3MTpmMDNjNjQxYi0wYTAwLTQ1M2EtODQxNy1mZDFiODhiYjdlYjk=", forHTTPHeaderField: "Authorization")
        
            mutableURLRequest.timeoutInterval = 90
        
            print("Complete request is ",mutableURLRequest)
            
            print("params-\(dicParams)-")
        
            Alamofire.request(mutableURLRequest as URLRequest)
                .responseJSON { response in
                    print("Request: \(String(describing: response.request))")  // original URL request
                    
                    print("result: \(response.result)")   // result of response serialization
                    
                    print("statusCode :  \(String(describing: response.response?.statusCode))" )
                    
                    if(response.response?.statusCode == nil){
                        print("Status nil")
                        
                    //    LoadingView.shared.hideOverlayView()
                        
                        completionHandler(NSNull(), nil,taskType)
                        return
                    }
                    
                    if let JSON = response.result.value {
                        
                        print("JSON: \(JSON)")
                        do{
                            let jsonObj = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
                            let jsonDict = jsonObj as! Dictionary<String, Any>
                            
                            if let error = jsonDict["message"] as? String,error == "please provide valid token"
                            {
                                let errorObj = NSError(domain:"", code:400, userInfo:[ NSLocalizedDescriptionKey: "Invalid access token"])
                                
                                //                            completionHandler(jsonDict as AnyObject,errorObj, taskType)
                                
                                if(isShowingLoader)
                                {
                                 //   LoadingView.shared.hideOverlayView()
                                    
                                }
                                
                                let alert: UIAlertController = UIAlertController(title: "Error", message:"Your session has expired. Please login again." , preferredStyle: .alert)
                                let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
                                    alert.dismiss(animated: true, completion: nil)
                                   //  AppSharedData.shared.moveToLogin()
                                }
                                alert.addAction(okAction)
                                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                                
                                return
                            }
                            
                            switch response.result {
                                
                            case .success(let data):
                                
                                completionHandler(data as AnyObject, nil,taskType)
                                
                            case .failure(let error):
                                print(error)
                                completionHandler(jsonDict as AnyObject,error, taskType)
                            }
                            
                            if(isShowingLoader)
                            {
                              //  LoadingView.shared.hideOverlayView()
                                
                            }
                            
                        }catch let error as Error{
                            if(isShowingLoader)
                            {
                              //  LoadingView.shared.hideOverlayView()
                            }
                            
                            
                            print("error \(error)")
                        }
                    }else{
                        
                        if(isShowingLoader)
                        {
                          //  LoadingView.shared.hideOverlayView()
                        }
                        
                        let alert = UIAlertController(title: "Server not responding", message: "Please try again later", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                        
                }
            }
    }*/
    
//    func executeServiceWithMultiPartDataRequestUrl(urlStr:String,action:String,dicParams:[String:Any],method:HTTPMethod,taskType:ServiceType,isShowingLoader:Bool, dictImage: [String: UIImage], completionHandler:@escaping (_ response:AnyObject,_ error:Error?,_ type:ServiceType)->(Void))  {
//
//        if !Reachability.isConnectedToNetwork() {
//
//            showAlert("", AlertMessages.no_internet_connection)
//            return
//        }
//
//        if(isShowingLoader) {
//           // LoadingView.shared.showOverlay(nil)
//        }
//
//        let headers: HTTPHeaders = [
//                    "Authorization": "\(AppSharedData.shared.userInfo.accessToken)",
//                   "Content-type": "multipart/form-data"
//               ]
//
//        let  actionWithAllowedCharectors = action.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//
//        let url = "\(urlStr)\(actionWithAllowedCharectors!)"
//
//        Alamofire.upload(multipartFormData: { multipartFormData in
//
//            var count = 1
//
//            for (key, value) in dictImage {
//
//                let imgData = value.jpegData(compressionQuality: 0.5)!
//
//                multipartFormData.append(imgData, withName: key,fileName: "file\(count).jpg", mimeType: "image/jpg")
//                count += 1
//            }
//
//            for (key, value) in dicParams {
//
//                if let strValue = value as? String {
//                    multipartFormData.append(strValue.data(using: String.Encoding.utf8)!, withName: key)
//
//                } else {
//                    let data = try! JSONSerialization.data(withJSONObject: value, options: JSONSerialization.WritingOptions.prettyPrinted)
//                    let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//                    multipartFormData.append(json!.data(using: String.Encoding.utf8.rawValue)!, withName: key)
//                }
//
//
//            } //Optional for extra parameters
//
//
//
//
//            /*
//            for (key, value) in dicParams {
//
//                multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
//                } //Optional for extra parameters
//
//            */
//
//
//        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url, method: method, headers: headers) { (result) in
//
//
//            switch result {
//            case .success(let upload, _, _):
//
//                upload.uploadProgress(closure: { (progress) in
//                    print("Upload Progress: \(progress.fractionCompleted)")
//                })
//
//                upload.responseJSON { response in
//                        print("Request: \(String(describing: response.request))")
//
//                    print("Param: \(dicParams))")
//
//
//                    // original URL request
//                        //   print("Response: \(String(describing: response.response))") // URL response
//                        // print("Server Data: \(String(describing: response.data))")     // server data
//                        print("result: \(response.result)")   // result of response serialization
//                        //  print("requsetbody : \(String(describing: response.request?.httpBody))")   // result of response serialization
//                        print("statusCode :  \(String(describing: response.response?.statusCode))" )
//
//                        if let JSON = response.result.value {
//
//                            print("JSON: \(JSON)")
//                            do{
//                                let jsonObj = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
//                                let jsonDict = jsonObj as! Dictionary<String, Any>
//
//
//                                if(taskType == .kTaskLogin)
//                                {
//                                    if let error = jsonDict["error"] as? String,error == "unauthorized_user"
//                                    {
//                                        if(isShowingLoader)
//                                        {
//                                            LoadingView.shared.hideOverlayView()
//                                        }
//                                        let message = getStringValue(jsonDict, "message")
//                                        let error_description = getStringValue(jsonDict, "error_description")
//                                        if message.count > 0 {
//                                            showAlert("", getStringValue(jsonDict, "message"))
//                                        }else if(error_description.count > 0)
//                                        {
//                                            showAlert("", getStringValue(jsonDict, "error_description"))
//                                        }
//                                        return
//                                    }
//                                }
//
//                                if let error = jsonDict["error"] as? String,error == "invalid_token"
//                                {
//                                    let errorObj = NSError(domain:"", code:401, userInfo:[ NSLocalizedDescriptionKey: "Invalid access token"])
//
//                                    completionHandler(jsonDict as AnyObject,errorObj, taskType)
//
//                                    if(isShowingLoader)
//                                    {
//                                        LoadingView.shared.hideOverlayView()
//
//                                    }
//
//                                    let alert: UIAlertController = UIAlertController(title: "Error", message:"Your session has expired, please login again." , preferredStyle: .alert)
//                                    let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel) { action -> Void in
//                                        alert.dismiss(animated: true, completion: nil)
//
//                                        AppSharedData.shared.moveToLogin()
//                                    }
//                                    alert.addAction(okAction)
//                                    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//
//                                    return
//                                }
//
//                                switch response.result {
//
//                                case .success(let data):
//
//                                    completionHandler(data as AnyObject, nil,taskType)
//
//                                case .failure(let error):
//                                    print(error)
//                                    completionHandler(jsonDict as AnyObject,error, taskType)
//                                }
//
//                                if(isShowingLoader)
//                                {
//                                    LoadingView.shared.hideOverlayView()
//
//                                }
//
//                            }catch let error as Error{
//                                if(isShowingLoader)
//                                {
//                                    LoadingView.shared.hideOverlayView()
//                                }
//
//
//                                print("error \(error)")
//                            }
//                        }else{
//
//                            if(isShowingLoader)
//                            {
//                                LoadingView.shared.hideOverlayView()
//                            }
//
//
//                            let alert = UIAlertController(title: "Server not responding", message: "please try again later", preferredStyle: UIAlertController.Style.alert)
//                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//                        }
//                }
//
//            case .failure(let encodingError):
//                print(encodingError)
//
//                if isShowingLoader {
//                        LoadingView.shared.hideOverlayView()
//                    }
//
//                let alert = UIAlertController(title: "Server not responding", message: "please try again later", preferredStyle: UIAlertController.Style.alert)
//                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//            }
//        }
//    }

    // id response, NSError *error, TaskType task
//    func executeServiceWithRequestUrl(urlStr:String,action:String,dicParams:[String:Any],method:RequestMethod,taskType:ServiceType,isShowingLoader:Bool, completionHandler:@escaping (_ response:AnyObject,_ error:Error?,_ type:ServiceType)->(Void)) {
//
//        if !Reachability.isConnectedToNetwork() {
//            
//            showAlert("ok", AlertMessages.no_internet_connection)
//            return
//        }
//
//        if(isShowingLoader) {
//            //LoadingView.shared.showOverlay(nil)
//        }
//   
//        let  actionWithAllowedCharectors = action.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//        
//        let url:NSURL = NSURL(string:"\(urlStr)\(actionWithAllowedCharectors!)")!
//        let mutableURLRequest = NSMutableURLRequest(url: url as URL)
//        mutableURLRequest.httpMethod = method.rawValue
//        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        // mutableURLRequest.setValue("\(apiKey)", forHTTPHeaderField: "apikey")
//   
//        if(ServiceType.kTaskGuestToken == taskType) {
//            
//        }
//        else if (ServiceType.kTaskLogin == taskType || ServiceType.kTaskSignUp == taskType || ServiceType.kTaskForgetPassword == taskType || ServiceType.kTaskResetPassword == taskType || ServiceType.kTaskSocialLogin == taskType
//            ){
//            let headerValue = " \(AppState.shared.GuestaccessToken)"
//          mutableURLRequest.setValue(headerValue, forHTTPHeaderField: "Authorization")
//            print("Header value - \(headerValue)")
//        }
//        else  {
//            var headerValue = ""
//
//            if  AppState.shared.GuestaccessToken == ""{
//                 headerValue = ""
//            }else{
//                headerValue = " sdfsdfs"
//
//                // headerValue = " \(AppSharedData.shared.userInfo.accessToken)"
//            }
//          mutableURLRequest.setValue(headerValue, forHTTPHeaderField: "Authorization")
//                print("Header value - \(headerValue)")
//        }
//        mutableURLRequest.timeoutInterval = 90
//        
//        if method != RequestMethod.kMethodGet {
//            
//            let data = try! JSONSerialization.data(withJSONObject: dicParams, options: JSONSerialization.WritingOptions.prettyPrinted)
//            
//            let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            if let json = json {
//                print(json)
//            }
//            mutableURLRequest.httpBody = json!.data(using: String.Encoding.utf8.rawValue);
//        }
//        print("Complite request is ",mutableURLRequest)
//        
//        print("params-\(dicParams)-")
//        
//        AF.request(mutableURLRequest as URLRequest)
//          
//            .responseJSON { response in
//                print("Request: \(String(describing: response.request))")  // original URL request
//             //   print("Response: \(String(describing: response.response))") // URL response
//               // print("Server Data: \(String(describing: response.data))")     // server data
//                print("result: \(response.result)")   // result of response serialization
//              //  print("requsetbody : \(String(describing: response.request?.httpBody))")   // result of response serialization
//                print("statusCode :  \(String(describing: response.response?.statusCode))" )
//                
//                if(response.response?.statusCode == nil){
//                print("Status nil")
//                
//                   // LoadingView.shared.hideOverlayView()
//
//                    completionHandler(NSNull(), nil,taskType)
//                    return
//                }
//                
//                if let JSON = response.result.value {
//                    
//                    print("JSON: \(JSON)")
//                    do{
//                        let jsonObj = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)
//                        let jsonDict = jsonObj as! Dictionary<String, Any>
//                        
//                        
//                        if(taskType == .kTaskLogin)
//                        {
//                            if let error = jsonDict["error"] as? String,error == "unauthorized_user"
//                            {
//                                if(isShowingLoader)
//                                {
//                                  //  LoadingView.shared.hideOverlayView()
//                                }
//                               // let message = getStringValue(jsonDict, "message")
////                                let error_description = getStringValue(jsonDict, "error_description")
////                                if message.count > 0 {
////                                    showAlert("ok", getStringValue(jsonDict, "message"))
////                                }else if(error_description.count > 0)
////                                {
////                                    showAlert("ok", getStringValue(jsonDict, "error_description"))
////                                }
//                                return
//                            }
//                        }
//
//                        if let error = jsonDict["message"] as? String,error == "please provide valid token"
//                        {
//                            let errorObj = NSError(domain:"", code:400, userInfo:[ NSLocalizedDescriptionKey: "Invalid access token"])
//                            
////                            completionHandler(jsonDict as AnyObject,errorObj, taskType)
//                            
//                            if(isShowingLoader)
//                            {
//                              //  LoadingView.shared.hideOverlayView()
//                                
//                            }
//                            
//                            let alert: UIAlertController = UIAlertController(title: "Error", message:"Your session has expired, please login again." , preferredStyle: .alert)
//                            let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel) { action -> Void in
//                                alert.dismiss(animated: true, completion: nil)
//                               // AppSharedData.shared.moveToLogin()
//                            }
//                            alert.addAction(okAction)
//                            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//                            
//                            return
//                        }
//                        
//                        switch response.result {
//                            
//                        case .success(let data):
//                            
//                            completionHandler(data as AnyObject, nil,taskType)
//                            
//                        case .failure(let error):
//                            print(error)
//                            completionHandler(jsonDict as AnyObject,error, taskType)
//                        }
//
//                        if(isShowingLoader)
//                        {
//                           // LoadingView.shared.hideOverlayView()
//                            
//                        }
//                        
//                    }catch let error as Error{
//                        if(isShowingLoader)
//                        {
//                         //   LoadingView.shared.hideOverlayView()
//                        }
//                        
//                        
//                        print("error \(error)")
//                    }
//                }else{
//                    
//                    if(isShowingLoader)
//                    {
//                       // LoadingView.shared.hideOverlayView()
//                    }
//              
//                    let alert = UIAlertController(title: "Server not responding", message: "please try again later", preferredStyle: UIAlertController.Style.alert)
//                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//                    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//                    
//                }
//        }
//    }
//    
    
    func checkNullValue(strKey:String, dict:[String:Any]) -> Any {
        if (dict[strKey] as? NSNull) != nil{
            print("Null key value:",strKey)
            return ""
        }
        return String(describing: dict[strKey] as Any)
    }
//
//    func stopAllSessions() {
//
//        let sessionManager = Alamofire.SessionManager.default
//        sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
//            print("Data Task Count ",dataTasks.count)
//            print("uploadTasks Task Count ",dataTasks.count)
//            print("downloadTasks Task Count ",dataTasks.count)
//            dataTasks.forEach { $0.cancel() }
//            uploadTasks.forEach { $0.cancel() }
//            downloadTasks.forEach { $0.cancel() }
//        }
//    }
}



