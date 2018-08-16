//
//  MapViewController.swift
//  CodeCampProj
//
//  Created by Michele Wang on 8/15/18.
//  Copyright © 2018 square. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
  
//    @IBOutlet weak var endLocation: UITextField!
//
//    @IBOutlet weak var startLocation: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 37.8740615, longitude: -122.2583052)
        centerMapOnLocation(location: initialLocation)
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.8740615, longitude: -122.2583052)
//        annotation.title = "You are here"
//        mapView.addAnnotation(annotation)
       
    
    }

    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showRoute(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}