//
//  ViewController.swift
//  savetime
//
//  Created by 정혁 on 2018. 5. 16..
//  Copyright © 2018년 정혁. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate{

    @IBOutlet weak var loc: UILabel!
    var myString = String()
    
    @IBOutlet weak var textField: UINavigationItem!
    
    @IBAction func searchButton(_ sender: Any){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        //Activity indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        //Hide search bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //create the search request
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        
        
        activeSearch.start { (response, error) in
            
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if response  == nil
            {
                print("error")
            }
            else
            { //Remove annotations
                let annotations = self.myMapView.annotations
                self.myMapView.removeAnnotations(annotations)
                
              //getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
              //create annotaiton(위치표시)
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.myMapView.addAnnotation(annotation)
                
            // 줌인 
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpanMake(0.01, 0.01)
                let region = MKCoordinateRegionMake(coordinate, span)
                self.myMapView.setRegion(region, animated: true)
            
                
              self.loc.text = searchBar.text
           
            
                
            }
        }
    }
  
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

