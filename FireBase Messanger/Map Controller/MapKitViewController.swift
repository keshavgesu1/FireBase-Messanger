//
//  MapKitViewController.swift
//  FireBase Messanger
//
//  Created by Keshav Raj Kashyap on 10/02/22.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var searchtextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapUtils()
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
           mapView.addGestureRecognizer(longTapGesture)
    /*    addMap()
        checkLocationPermission()
        let stadiums = [PersonLocation(name: "Emirates Stadium", lattitude: 51.5549, longtitude: -0.108436),
                        PersonLocation(name: "Stamford Bridge", lattitude: 51.4816, longtitude: -0.191034),
                        PersonLocation(name: "White Hart Lane", lattitude: 51.6033, longtitude: -0.065684),
                        PersonLocation(name: "Olympic Stadium", lattitude: 51.5383, longtitude: -0.016587),
                        PersonLocation(name: "Old Trafford", lattitude: 53.4631, longtitude: -2.29139),
                        PersonLocation(name: "Anfield", lattitude: 53.4308, longtitude: -2.96096)]
         checkLocationServices()
          fetchStadiumsOnMap(stadiums)*/
        
        // Do any additional setup after loading the view.
    }
   
    
    @objc func longTap(sender: UIGestureRecognizer){
        print("long tap")
        if sender.state == .began {
            let locationInView = sender.location(in: mapView)
            let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
            addAnnotation(location: locationOnMap)
        }
    }
    
    func addAnnotation(location: CLLocationCoordinate2D){
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "Some Title"
            annotation.subtitle = "Some Subtitle"
            self.mapView.addAnnotation(annotation)
    }
    
    func mapUtils(){
        self.locationManager.requestAlwaysAuthorization()
            // For use in foreground
            self.locationManager.requestWhenInUseAuthorization()

            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = 10
                locationManager.startUpdatingLocation()
            }
            mapView.delegate = self
            mapView.mapType = .standard
            mapView.isZoomEnabled = true
            mapView.isScrollEnabled = true

    }
 
  /*  func checkLocationServices() {
      if CLLocationManager.locationServicesEnabled() {
        checkLocationAuthorization()
      } else {
        // Show alert letting the user know they have to turn this on.
      }
    }
    func fetchStadiumsOnMap(_ stadiums: [PersonLocation]) {
      for stadium in stadiums {
        let annotations = MKPointAnnotation()
        annotations.title = stadium.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
          stadium.lattitude, longitude: stadium.longtitude)
        mapView.addAnnotation(annotations)
      }
    }
    
    func checkLocationPermission(){
        if CLLocationManager.locationServicesEnabled() {
           // continue to implement here
            checkLocationAuthorization()
        } else {
           // Do something to let users know why they need to turn it on.
        }
    }
    
    
    func checkLocationAuthorization() {
      switch CLLocationManager.authorizationStatus() {
      case .authorizedWhenInUse:
        mapView.showsUserLocation = true
       case .denied: // Show alert telling users how to turn on permissions
       break
      case .notDetermined:
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
      case .restricted: // Show an alert letting them know what’s up
       break
      case .authorizedAlways:
       break
      }
    }
    
    func addMap(){
        // 1
           let location = CLLocationCoordinate2D(latitude: 51.50007773,
               longitude: -0.1246402)
           // 2
           let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
           let region = MKCoordinateRegion(center: location, span: span)
               mapView.setRegion(region, animated: true)
               
           //3
           let annotation = MKPointAnnotation()
           annotation.coordinate = location
           annotation.title = "Big Ben"
           annotation.subtitle = "London"
           mapView.addAnnotation(annotation)
    }*/
   
     

}
extension MapKitViewController:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /* let locValue:CLLocationCoordinate2D = manager.location!.coordinate
         mapView.mapType = MKMapType.standard
         
         let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
         let region = MKCoordinateRegion(center: locValue, span: span)
         
         mapView.setRegion(region, animated: true)
         
         let annotation = MKPointAnnotation()
         annotation.coordinate = locValue
         annotation.title = "Javed Multani"
         annotation.subtitle = "current location"
         mapView.addAnnotation(annotation)
         
         //centerMap(locValue)*/
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            if let mPlacemark = placemarks{
                if let dict = mPlacemark[0].addressDictionary as? [String: Any]{
                    if let Name = dict["Name"] as? String{
                        if let City = dict["City"] as? String{
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = locValue
                            annotation.title  = Name + ", " + City
                            self.mapView.addAnnotation(annotation)
                        }
                    }
                }
            }
        })
    }
    
}















struct PersonLocation {
  var name: String
  var lattitude: CLLocationDegrees
  var longtitude: CLLocationDegrees
}
