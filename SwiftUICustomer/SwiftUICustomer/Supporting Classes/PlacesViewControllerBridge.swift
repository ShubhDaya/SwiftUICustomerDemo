//
//  PlacesViewControllerBridge.swift
//  SwiftUICustomer
//
//  Created by ADMIN on 23/02/23.
//

import Foundation
import SwiftUI
import GooglePlaces

struct PlacesViewControllerBridge: UIViewControllerRepresentable {
    
    var onPlaceSelected: (GMSPlace) -> ()
    //var selectedPlaceByFilter: GMSPlace
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PlacesViewControllerBridge>) -> GMSAutocompleteViewController {
     let uiViewControllerPlaces = GMSAutocompleteViewController()
        uiViewControllerPlaces.delegate = context.coordinator
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                                                  UInt(GMSPlaceField.placeID.rawValue))!
        uiViewControllerPlaces.placeFields = fields
        return uiViewControllerPlaces
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
    }
    
    func makeCoordinator() -> PlacesViewAutoCompleteCoordinator {
        return PlacesViewAutoCompleteCoordinator(placesViewControllerBridge: self)
    }
    
    final class PlacesViewAutoCompleteCoordinator: NSObject, GMSAutocompleteViewControllerDelegate {
        var placesViewControllerBridge: PlacesViewControllerBridge
        
        init(placesViewControllerBridge: PlacesViewControllerBridge) {
            self.placesViewControllerBridge = placesViewControllerBridge
        }
        
        func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace)
        {
            print("Place name: \(place.name ?? "Default Place")")
            print("Place ID: \(place.placeID ?? "Default PlaceID")")
            print("Place attributions: \(String(describing: place.attributions))")
            
            print("latitude: \(place.coordinate.latitude)")
            print("longitude: \(place.coordinate.longitude)")
            viewController.dismiss(animated: true)
            self.placesViewControllerBridge.onPlaceSelected(place)
        }
        
        func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error)
        {
            print("Error: ", error.localizedDescription)
        }
        
        func wasCancelled(_ viewController: GMSAutocompleteViewController) {
            print("Place prediction window cancelled")
            viewController.dismiss(animated: true)
        }
        
        func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
    }
}
