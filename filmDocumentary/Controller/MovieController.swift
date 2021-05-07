//
//  ViewController.swift
//  filmDocumentary
//
//  Created by Mesut Aygün on 7.05.2021.
//

import UIKit

class MovieController: UIViewController {
    
    var apiService = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        apiService.getPopularMoviesData { (result) in
            print(result)
        }
    }


}

