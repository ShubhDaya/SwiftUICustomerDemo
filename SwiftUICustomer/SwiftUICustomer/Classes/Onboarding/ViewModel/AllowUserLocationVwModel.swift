//
//  AllowUserLocationVwModel.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 23/02/23.
//

import Foundation
import CoreLocation


class AllowUserLocationVwModel: ObservableObject {
    var locationManager = CLLocationManager()

    @Published var showAlert = false
    @Published var errorMessage = ""
    
    func getCurrentLocation()  {
        
        locationService.tracingLocationOrError = {(location, error) in
            locationService.stopUpdatingLocation()
            
            if location != nil {
                self.getAddressFromLatLon(loc: location!)
            } else {
                self.showAlert = true
                self.errorMessage = "Please enable location services from setting"
            }
        }
        locationService.startUpdatingLocation()
    }
    
    func getAddressFromLatLon(loc: CLLocation)  {
        
        CLGeocoder().reverseGeocodeLocation(loc, completionHandler:
             {(placemarks, error) in
             if (error != nil) {
                 print("reverse geodcode fail: \(error!.localizedDescription)")
                 return
             }
                    
             let pm = placemarks! as [CLPlacemark]
                    
             if pm.count > 0 {
                        
                 let pm = placemarks![0]
                        
                 let address = UserAddressNew()
                        
                 address.latitude = pm.location?.coordinate.latitude ?? 0
                 address.longitude = pm.location?.coordinate.longitude ?? 0
                        
                 var addressString = ""
                 var shortAddress = ""
                        
                 if pm.name != nil {
                   shortAddress = "\(pm.name!),"
                   addressString = "\(pm.name!),"
                 }
                        
                 if pm.subThoroughfare != nil {
                     shortAddress += " \(pm.subThoroughfare!),"
                     addressString += " \(pm.subThoroughfare!),"
                 }
                        
                 if pm.thoroughfare != nil {
                     shortAddress += " \(pm.thoroughfare!),"
                     addressString += " \(pm.thoroughfare!),"
                 }
                        
                 if pm.locality != nil {
                     addressString += " \(pm.locality!),"
                 }
                        
                 if pm.country != nil {
                     addressString += " \(pm.country!),"
                 }
                        
                 if pm.postalCode != nil {
                     addressString += " \(pm.postalCode!),"
                     address.zipcode = pm.postalCode!
                            
                 }
                        
                 if pm.subLocality != nil {
                     address.street = pm.subLocality!
                 }
                        
                 if pm.administrativeArea != nil {
                     address.state = pm.administrativeArea!
                 }
                
                 if pm.locality != nil {
                    address.City = pm.locality!
                 }
                 address.City = pm.locality!
                AppState.shared.Currentuserlocation = address
                AppState.shared.Currentuserlocation.City = address.City
                AppState.shared.Currentuserlocation.adress = String(addressString.dropLast())
                saveToUserDefault(Userlocation, address)
                // AppState.shared.moveToDashboard()
               
               }
            })
        }
    
}
