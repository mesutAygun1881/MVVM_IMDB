//
//  ApiService.swift
//  filmDocumentary
//
//  Created by Mesut Aygün on 7.05.2021.
//

import Foundation

class ApiService {
    
    
    
    private var dataTask : URLSessionDataTask?
    
    func getPopularMoviesData(completion : @escaping(Result<MoviesData, Error>) -> Void ) {
        
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=07a5c023845c9ca82cd83153c9c21fe2"

        guard let url = URL(string: popularMoviesURL) else {return}
        
//        create url session arka planda çalış
        
        dataTask = URLSession.shared.dataTask(with: url) { (data , response , error) in
            if let error = error {
                completion(.failure(error))
                print("DataTas error : \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            print("Response status code : \(response.statusCode)")
            
            
            guard let data = data else {
                print("empty data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
                
                
            } catch let error {
                completion(.failure(error))
            }
            
        }
        
        dataTask?.resume()
        
        
        
    }
    
    
    
}


