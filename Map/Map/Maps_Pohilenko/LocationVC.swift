//
//  ViewController.swift
//  Maps_Starodubtsev
//
//  Created by user on 19.10.2021.
//

import UIKit
import CoreLocation

class LocationVC: UIViewController, CLLocationManagerDelegate {
 
    let locationMenager = CLLocationManager()
    
    @IBOutlet weak var dataLat: UILabel!
    @IBOutlet weak var dataLon: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        checkAuthorization()
        // Do any additional setup after loading the view.
    }
    func checkAuthorization(){
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationMenager.delegate = self
            locationMenager.desiredAccuracy = kCLLocationAccuracyBest
            locationMenager.startUpdatingLocation()
            print("Error")
        case .notDetermined:
            locationMenager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
    func locationMenager(_ menager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location  = locations.last?.coordinate {
            dataLat.text = String(location.latitude)
            dataLon.text = String(location.longitude)
            locationMenager.stopUpdatingLocation()
        }
    

    }
}

