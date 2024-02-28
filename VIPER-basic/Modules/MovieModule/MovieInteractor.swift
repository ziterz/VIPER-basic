//
//  MovieInteractor.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

import Foundation

final class MovieInteractor {
  // MARK: Properties
  weak var delegate: MovieInteractorDelegate?
  
  private var movies: [Movie] = []
  
  func load() {
    getMovies()
  }
  
  func getMovies() { 
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        print("Fetch error")
        return
      }
      
      do {
        let movies = try JSONDecoder().decode([Movie].self, from: data)
        self.movies = movies
        self.delegate?.handleOutput(movies)
      } catch {
        print("Error parsing to JSON")
      }
    }
    
    task.resume()
  }
}

// MARK: Extensions
extension MovieInteractor: MovieInteractorProtocol { }
