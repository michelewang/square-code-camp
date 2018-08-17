//
//  MapViewController.swift
//  CodeCamp
//
//  Created by Michele Wang on 8/16/18.
//  Copyright © 2018 square. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,  UIPickerViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
  
    func centerMapOnLocation(location: CLLocation, radius: Int) {
        let regionRadius: CLLocationDistance = CLLocationDistance(radius)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    @IBAction func findRoute(_ sender: Any) {
        let initialLatitude = 37.8741
        let initialLongitude = -122.2583
        let startCoor = CLLocationCoordinate2D(latitude: CLLocationDegrees(initialLatitude), longitude: CLLocationDegrees(initialLongitude))
        let finalLatitude = 37.7749
        let finalLongitude = -122.4194
        let finalCoor = CLLocationCoordinate2D(latitude: CLLocationDegrees(finalLatitude), longitude: CLLocationDegrees(finalLongitude))
        let annotationView : MKPinAnnotationView!
        let annotationPoint = MKPointAnnotation()
        annotationPoint.coordinate = startCoor
        annotationPoint.title = "Kresge Engineering Library"
        annotationView = MKPinAnnotationView(annotation: annotationPoint, reuseIdentifier: "Annotation")
        mapView.addAnnotation(annotationView.annotation!)
        
        let annotationView2 : MKPinAnnotationView!
        let annotationPoint2 = MKPointAnnotation()
        annotationPoint2.coordinate = finalCoor
        annotationPoint2.title = "Square, Inc. HQ"
        annotationView2 = MKPinAnnotationView(annotation: annotationPoint2, reuseIdentifier: "Annotation2")
        mapView.addAnnotation(annotationView2.annotation!)
        
        let directionsRequest = MKDirectionsRequest()
        if #available(iOS 10.0, *) {
            directionsRequest.source = MKMapItem.init(placemark: MKPlacemark.init(coordinate: startCoor))
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 10.0, *) {
            directionsRequest.destination = MKMapItem.init(placemark: MKPlacemark.init(coordinate: finalCoor))
        } else {
            // Fallback on earlier versions
        }
        directionsRequest.transportType = . any
        let directions = MKDirections(request: directionsRequest)
        directions.calculate{ response, error in
            if let res = response {
                if let route = res.routes.first {
                    self.mapView.add((route.polyline))
                let midpoint =  CLLocation(latitude: 37.822482, longitude: -122.3240059)
                self.centerMapOnLocation(location: midpoint, radius: 20000)
                }
            } else {
            }
        }
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKPolylineRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        renderer.lineWidth = 3.0
        return renderer
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 37.8741, longitude: -122.2583)

        centerMapOnLocation(location: initialLocation, radius: 1000)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
