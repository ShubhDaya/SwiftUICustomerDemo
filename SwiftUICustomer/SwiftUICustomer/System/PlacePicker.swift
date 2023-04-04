//
//  PlacePicker.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 24/02/23.
//

import Foundation
import SwiftUI
import CoreLocation
import GooglePlaces

struct PlacePicker: UIViewControllerRepresentable {
    
    @Binding var selectedPlace: GMSPlace?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PlacePicker>) -> GMSAutocompleteViewController {
        let autocompleteController = GMSAutocompleteViewController()
      
        let filter = GMSAutocompleteFilter()
        filter.country = "USA"
        filter.type = .address
        autocompleteController.autocompleteFilter = filter
        autocompleteController.delegate = context.coordinator
        
        return autocompleteController
    }
    
    func updateUIViewController(_ uiViewController: GMSAutocompleteViewController, context: UIViewControllerRepresentableContext<PlacePicker>) {
        // Update the view controller
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, GMSAutocompleteViewControllerDelegate {
        
        var parent: PlacePicker
        
        init(_ parent: PlacePicker) {
            self.parent = parent
        }
        
        func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
            parent.selectedPlace = place
            print("latitude: \(place.coordinate.latitude)")
            print("longitude: \(place.coordinate.longitude)")
            
            var searchAddress: String = ""
            if (place.formattedAddress?.contains(", India"))!{
                searchAddress = (place.formattedAddress?.replacingOccurrences(of: ", India", with: ""))!
            }else if (place.formattedAddress?.contains("IN"))!{
                searchAddress = (place.formattedAddress?.replacingOccurrences(of: "IN", with: ""))!
            }else if (place.formattedAddress?.contains(", USA"))!{
                searchAddress = (place.formattedAddress?.replacingOccurrences(of: ", USA", with: ""))!
            }else if (place.formattedAddress?.contains(", United States of America"))!{
                searchAddress = (place.formattedAddress?.replacingOccurrences(of: ", United States of America", with: ""))!
            }else{
                searchAddress = place.formattedAddress!
            }
            
          //  self.tfSearch.text = searchAddress
          //  self.strAddress = place.formattedAddress ?? ""
            
//            if self.strAddress != "" {
//                self.btnOk.alpha = 1
//                self.btnOk.isEnabled = true
//            }
            
            let address = UserAddressNew()
                address.adress = place.formattedAddress!
                address.latitude = place.coordinate.latitude
                address.longitude = place.coordinate.longitude
                for component in place.addressComponents! {
                           
                  for type in component.types {
                               
                    switch type {
                                   
                        case "sublocality_level_1": //street name
                                address.street = component.name
                        case "administrative_area_level_1": //state name
                                address.state = component.name
                        case "postal_code": //zip code
                                address.zipcode = component.name
                        case "locality": //zip code
                                address.City = component.name
                        case "country": //zip code
                                address.Country = component.name
                        default:
                            break
                    }
                }
             }
                   
            // shubham **** set address in user default -----
            AppState.shared.Currentuserlocation = address
            saveToUserDefault(keyUserLocation, AppState.shared.Currentuserlocation!)

            
            if address.City == "" {
                var location = CLLocation.init(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
                   
                self.getCityFrmLatLong(loc: location)
            }
            
            viewController.dismiss(animated: true, completion: nil)
        }
        
        func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
            print("Error: \(error.localizedDescription)")
        }
        
        func wasCancelled(_ viewController: GMSAutocompleteViewController) {
            viewController.dismiss(animated: true, completion: nil)
        }
        
        func getCityFrmLatLong(loc: CLLocation) {
            
            CLGeocoder().reverseGeocodeLocation(loc, completionHandler:
                 {(placemarks, error) in
                 if (error != nil) {
                     print("reverse geodcode fail: \(error!.localizedDescription)")
                     return
                    
                 }
                        
                 let pm = placemarks! as [CLPlacemark]
                 if pm.count > 0 {
                            
                     let pm = placemarks![0]
                  //   AppState.shared.Currentuserlocation.City = 
                  //  self.selectedloaction.City = pm.postalAddress!.city
                   }
            })
    }
    
 
        
    }
}
