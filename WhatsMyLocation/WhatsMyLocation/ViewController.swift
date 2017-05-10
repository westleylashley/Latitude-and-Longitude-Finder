//
//  ViewController.swift
//  WhatsMyLocation
//
//  Created by Westley Lashley on 3/26/17.
//  Copyright © 2017 Westley Lashley. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
//    @IBOutlet weak var distance: UILabel!
    
    
    let locationManager = CLLocationManager()
//    var startLocation = CLLocation()

//    @IBAction func resetDistance(_ sender: AnyObject) {
//        startLocation = nil
//    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.10, 0.10)
        
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        
        self.mapView.showsUserLocation = true
        
    }
    
    
//        let latestLocation: CLLocation = locations[locations.count - 1]
//        
//        latitude.text = String(format: "%.4f",
//                               latestLocation.coordinate.latitude)
//        longitude.text = String(format: "%.4f",
//                                latestLocation.coordinate.longitude)
    
//        if startLocation == nil {
//            startLocation = latestLocation
        
//        let distanceBetween: CLLocationDistance =
//            latestLocation.distance(from: startLocation)
        
//        distance.text = String(format: "%.2f", distanceBetween)
//    }
    
//    func locationManager(_ manager: CLLocationManager,
//                         didFailWithError error: Error) {
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}
