//
//  AddJournalViewController.swift
//  MTN2RVR
//
//  Created by Sterling Mortensen on 7/18/19.
//  Copyright © 2019 Git Swifty. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AddJournalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        checkLocationServices()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // show alert letting the user know they have to turn this on.
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTrackingUserLocation()
        case .denied:
            // show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
            fatalError()
        }
    }
    
    func startTrackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        self.longitudeLabel.text = "\(longitude)"
        self.latitudeLabel.text = "\(latitude)"
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    
    // IBActions
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onFireIndexChanged(_ sender: Any) {
        switch onFireSegmentControl.selectedSegmentIndex {
        case 0:
            print("hello")
        default:
             break
        }
    }
    
    @IBAction func waterSpeedIndexChanged(_ sender: Any) {
        
    }
    
    @IBAction func waterColorIndexChanged(_ sender: Any) {
        
    }
    
    @IBAction func waterLevelIndexChanged(_ sender: Any) {
        
    }
    
    // Properties
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 100
    var previousLocation: CLLocation?
    
    // IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    // UILabels
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stateNameLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    // UITextFields
    @IBOutlet weak var journalNameTextField: UITextField!
    @IBOutlet weak var riverNameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    // UISegmentControls
    @IBOutlet weak var onFireSegmentControl: UISegmentedControl!
    @IBOutlet weak var waterSpeedSegmentControl: UISegmentedControl!
    @IBOutlet weak var waterColorSegmentControl: UISegmentedControl!
    @IBOutlet weak var riverLevelSegmentControl: UISegmentedControl!
}

extension AddJournalViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension AddJournalViewController: MKMapViewDelegate {
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let error = error {
                // TODO: - Show alert informing user
                print("Error : \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first else {
                // TODO: - Show alert informing the user
                return
            }
            
            let cityName = placemark.locality ?? ""
            let state = placemark.administrativeArea ?? ""
            
            DispatchQueue.main.async {
                self.cityNameLabel.text = "City \(cityName)"
                self.stateNameLabel.text = "State : \(state)"
            }
        }
    }
}
