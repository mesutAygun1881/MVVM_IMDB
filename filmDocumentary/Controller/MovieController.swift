//
//  ViewController.swift
//  filmDocumentary
//
//  Created by Mesut Aygün on 7.05.2021.
//

import UIKit

class MovieController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
  
    
    private var viewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPopularMoviesData()
        
    }
    
    private func loadPopularMoviesData() {
        
        
        viewModel.fetchPopularMoviesData {
            [weak self] in
            
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }


}

extension MovieController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section : section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! MovieTableViewCell
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie: movie)
        return cell
    }
}

