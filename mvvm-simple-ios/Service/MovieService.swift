//
//  MovieService.swift
//  mvvm-simple-ios
//
//  Created by OMER YASIN KOLKANAT on 6.10.2018.
//  Copyright © 2018 OMER KOLKANAT. All rights reserved.
//

import Foundation
import Alamofire

struct MovieService {
    private let base_url = "https://www.omdbapi.com/?apikey=X" //X will be replaced with real apikey from ombdb
    
    func fetchMovies(with string: String, completion: @escaping (MovieSearchModel?, Error?) -> ()) {
        let url = "\(base_url)&s=\(string)" //https://www.omdbapi.com/?apikey=X&s=Breaking
        Alamofire.request(url).responseMovie { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            if let movie = response.result.value {
                completion(movie, nil)
                return
            }
        }
    }
}
