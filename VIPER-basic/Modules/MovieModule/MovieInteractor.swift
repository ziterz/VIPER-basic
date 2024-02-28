//
//  MovieInteractor.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

final class MovieInteractor {
  // MARK: Properties
  var presenter: MoviePresenterProtocol?
  
  func getMovies() { }
}

// MARK: Extensions
extension MovieInteractor: MovieInteractorProtocol { }
