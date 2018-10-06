//
//  MovieViewController.swift
//  mvvm-simple-ios
//
//  Created by OMER YASIN KOLKANAT on 6.10.2018.
//  Copyright © 2018 OMER KOLKANAT. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    enum Const {
        static let heightForRow: CGFloat = 80
    }
    
    @IBOutlet weak var movieTableView: UITableView!
    
    fileprivate let model = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        model.updateMovies()
    }
}

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.textColor = UIColor.darkGray
        cell.textLabel?.text = model.movies[indexPath.row].title
        cell.detailTextLabel?.textColor = UIColor.lightGray
        cell.detailTextLabel?.text = model.movies[indexPath.row].type.rawValue
        cell.selectionStyle = .none
        return cell
    }
}

extension MovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Const.heightForRow
    }
}

extension MovieViewController: MovieViewModelProtocol {
    func didUpdateMovies() {
        movieTableView.reloadData()
    }
}


