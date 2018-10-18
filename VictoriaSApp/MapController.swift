//
//  Map.swift
//  VictoriaSApp
//
//  Created by Vicky Juan on 10/16/18.
//  Copyright © 2018 Victoria Juan. All rights reserved.
//

import UIKit
import GoogleMaps

class MapController: UIViewController {
    var mapView: GMSMapView?
    var currentDestination: Destination?
    let destinations = [Destination(name: "Exchange Student", snippet: "Springfield, MO", location: CLLocationCoordinate2DMake(37.003631, -93.272371), zoom: 6), Destination(name: "College", snippet: "Seattle, WA", location: CLLocationCoordinate2DMake(47.608202, -122.322164), zoom: 10)]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Goole map sdk
        GMSServices.provideAPIKey("AIzaSyCZioDnvthfmkaDda2iAV4KzLqw1-rmKvA")
        
        initializeCamera()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItem.Style.plain, target: self, action: #selector(Next))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(Back))

    }
    
    /*
     first location in the map
     */
    func initializeCamera() {
        let camera = GMSCameraPosition.camera(withLatitude: 34.362416, longitude: 107.234466, zoom: 4)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(34.362416, 107.234466)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "Home"
        marker.snippet = "Baoji, China"
        marker.map = mapView
    }
    
    @objc func Next() {
//        start the destination array
        if currentDestination == nil {
            currentDestination = destinations.first
            setMapCamera()

        }else {
//            while the index is inbound, move pointer forward by one in destinations array
            let index = destinations.firstIndex(of: currentDestination!)
            if(index! < destinations.count - 1) {
                currentDestination = destinations[index! + 1]
                setMapCamera()
            }
//            at the last destination, move to next view controller
            if(index == destinations.count - 1) {
                navigateToMainPage()
            }
        }
    }
    
    @objc func Back() {
        if currentDestination == nil {
        }else {
            let index = destinations.firstIndex(of: currentDestination!)
//            when the index is zero, back to the first location
            if(index == 0) {
                initializeCamera()
                currentDestination = nil
            }
//            while the index is inbound, move pointer back by one in destinations array
            if(index! > 0) {
                currentDestination = destinations[index! - 1]
                setMapCamera()
            }
        }
    }
    
    /*
     help to get locations from destinations array
     */
    private func setMapCamera() {
        mapView?.camera = GMSCameraPosition.camera(withTarget: currentDestination!.location, zoom: currentDestination!.zoom)
        
        let marker = GMSMarker(position: currentDestination!.location)
        marker.title = currentDestination?.name
        marker.snippet = currentDestination?.snippet
        marker.map = mapView
    }
    
    private func navigateToMainPage() {
        self.performSegue(withIdentifier: "MaptoMain", sender: self)
    }
}

/*
 object for each google map sdk
 */
class Destination: NSObject {
    let name: String
    let snippet: String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    init(name:String, snippet:String, location: CLLocationCoordinate2D, zoom: Float) {
        self.name = name
        self.snippet = snippet
        self.location = location
        self.zoom = zoom
    }
}
