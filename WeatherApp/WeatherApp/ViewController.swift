//
//  ViewController.swift
//  WeatherApp
//
//  Created by sofien benharchache on 05/05/2019.
//  Copyright © 2019 sofien benharchache. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var networkManager: NetworkManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let longitude:Double = 2.3488
        let latitude:Double = 48.85341
        
        self.networkManager =  NetworkManager()
        networkManager.getWeather(latitude: longitude, longitude: latitude) {weather, error in
            if !error!.isEmpty {
                print(error.debugDescription)
            } else {
                print(weather!)
            }
        }

    }


}

