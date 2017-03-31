//
//  ViewController.swift
//  WhatsMyLocation
//
//  Created by Westley Lashley on 3/26/17.
//  Copyright © 2017 Westley Lashley. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
//    @IBOutlet weak var distance: UILabel!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!

//    @IBAction func resetDistance(_ sender: AnyObject) {
//        startLocation = nil
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
    }

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        let latestLocation: CLLocation = locations[locations.count - 1]
        
        latitude.text = String(format: "%.4f",
                               latestLocation.coordinate.latitude)
        longitude.text = String(format: "%.4f",
                                latestLocation.coordinate.longitude)
        
        if startLocation == nil {
            startLocation = latestLocation
        }
        
//        let distanceBetween: CLLocationDistance =
//            latestLocation.distance(from: startLocation)
        
//        distance.text = String(format: "%.2f", distanceBetween)
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        
    }
}
