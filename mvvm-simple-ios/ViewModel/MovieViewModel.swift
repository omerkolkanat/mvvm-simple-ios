//
//  MovieViewModel.swift
//  mvvm-simple-ios
//
//  Created by OMER YASIN KOLKANAT on 6.10.2018.
//  Copyright © 2018 OMER KOLKANAT. All rights reserved.
//

import Foundation

protocol MovieViewModelProtocol {
    func didUpdateMovies()
}
class MovieViewModel: NSObject {
    var delegate: MovieViewModelProtocol?
    
    fileprivate(set) var movies: [MovieModel] = []
    
    private var movieService = MovieService()

    func updateMovies() {
        let movieToSearch = "Breaking"
        movieService.fetchMovies(with: movieToSearch, completion: { (movieSearchResult, error) in
            if let error = error {
                print(error)
            } else {
                if let movieSearchResult = movieSearchResult {
                    self.movies = movieSearchResult.search
                    self.delegate?.didUpdateMovies()
                }
            }
        })
    }
}
