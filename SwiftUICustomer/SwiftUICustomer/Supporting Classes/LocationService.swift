//
//  LocationService.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 20/02/23.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    
    var tracingLocationOrError : ((_ currentLocation: CLLocation?, _ error: Error?) -> Void)?
    
    static let shared: LocationService = {
        let instance = LocationService()
        return instance
    }()
    
    var locationManager: CLLocationManager?
    var lastLocation: CLLocation?
    
    override init() {
        super.init()
        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
        }
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 500
        locationManager.delegate = self
    }
    
    func startUpdatingLocation() {
        print("Starting Location Updates")
        if lastLocation != nil {
            tracingLocationOrError?(lastLocation, nil)
        }
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager?.requestAlwaysAuthorization()
        }
        
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager?.startUpdatingLocation()
        } else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Location services disabled"])
            tracingLocationOrError?(nil, error)
        }
    }
    
    func stopUpdatingLocation() {
        print("Stop Location Updates")
        self.locationManager?.stopUpdatingLocation()
    }
    
    // CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            return
        }
        
        self.lastLocation = location
        updateLocation(currentLocation: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        // do on error
        updateLocationDidFailWithError(error: error as NSError)
    }
    
    // Private function
    private func updateLocation(currentLocation: CLLocation) {
        
        print("user latitude = \(currentLocation.coordinate.latitude)")
        print("user longitude = \(currentLocation.coordinate.longitude)")
        
        self.tracingLocationOrError?(currentLocation, nil)
    }
    
    private func updateLocationDidFailWithError(error: NSError) {

        self.tracingLocationOrError?(nil, error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
                
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "allowLocation"), object: nil)
            self.locationManager?.startUpdatingLocation()
        }
    }
    
    func getAddressFromLatLon(latitude: Double, withLongitude longitude: Double,fetchAddress:@escaping (String)->())  {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = latitude
        let lon: Double = longitude
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                    return
                }
                let pm = placemarks! as [CLPlacemark]
                
                if pm.count > 0 {
                    let pm = placemarks![0]
                    
                    var addressString : String = ""
                    
                    if pm.subThoroughfare != nil {
                        addressString = addressString + pm.subThoroughfare! + ", "
                    }
                    
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }
                    
                    print(addressString)
                    fetchAddress(addressString)
                    
                }
        })
        
    }
}
