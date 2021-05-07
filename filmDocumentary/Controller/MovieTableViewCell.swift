//
//  MovieTableViewCell.swift
//  filmDocumentary
//
//  Created by Mesut Aygün on 7.05.2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var moviePoster: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieYear: UILabel!
    @IBOutlet var movieOverview: UILabel!
    @IBOutlet var movieRate: UILabel!
    
    
    private var urlString : String = ""
    
    
    func setCellWithValuesOf ( movie: Movie) {
        
        updateUI(title: movie.title, releaseDate: movie.year, rating: movie.rate, overview: movie.overview, poster: movie.posterImage)
    }
    
    private func updateUI(title: String? , releaseDate : String? ,rating : Double? , overview : String? , poster : String?) {
        
    
        self.movieTitle.text = title
        self.movieOverview.text = overview
        self.movieYear.text = convertDateFormater(releaseDate)
        guard let rate = rating else {return}
        self.movieRate.text = String(rate)
        
        guard let posterString = poster else {return}
       urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
        guard let posterImageUrl  = URL(string: urlString) else {
            self.moviePoster.image = UIImage ( named: "noImage")
            return
        }
        self.moviePoster.image = nil
        getImageDataFrom(url: posterImageUrl)
        
        
    }
    
    func getImageDataFrom(url : URL) {
        URLSession.shared.dataTask(with: url) { (data , response , error) in
            if let error = error {
                
                print("DataTask error : \(error.localizedDescription)")
                return
            }
            
            guard let data = data  else {
                print("Empty Response")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.moviePoster.image = image
                }
            }
        
        }.resume()
        
    }
    
    func convertDateFormater(_ date : String?) -> String {
        var fixDate = ""
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate) {
                dateFormatter.dateFormat = "dd.MM.yyy"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
        
        
    }
        
    }


