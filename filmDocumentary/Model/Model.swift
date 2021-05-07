//
//  Model.swift
//  filmDocumentary
//
//  Created by Mesut Aygün on 7.05.2021.
//

import Foundation

struct  MoviesData : Decodable {
    
    
    let movies : [Movie]
    
    private enum CodingKeys : String , CodingKey {
        
        case movies = "results"
    }
}

struct Movie: Decodable {
    
    let title : String?
    let year : String?
    let rate : Double?
    let posterImage : String?
    let overview : String?
    
    
//    api dosyamızın içinde yazan şekliyle case yaptık
    
    
    private enum CodingKeys : String , CodingKey {
        case title , overview
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}
