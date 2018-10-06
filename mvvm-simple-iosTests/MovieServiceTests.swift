//
//  MovieTests.swift
//  mvvm-simple-iosTests
//
//  Created by OMER YASIN KOLKANAT on 6.10.2018.
//  Copyright © 2018 OMER KOLKANAT. All rights reserved.
//

import XCTest
@testable import mvvm_simple_ios

class MovieServiceTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMovieService() {
        let e = expectation(description: "fetchMovies")
        let movieService = MovieService()
        let movieToSearch = "Breaking"
        movieService.fetchMovies(with: movieToSearch) { (movieSearchResult, error) in
            XCTAssertNil(error, "Error \(error!.localizedDescription)")
            XCTAssertNotNil(movieSearchResult, "No movie search result")
            e.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }

}
