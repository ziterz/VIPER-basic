//
//  MoviePresenter.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

final class MoviePresenter {
  // MARK: Properties
  var view: MovieViewProtocol?
  var interactor: MovieInteractorProtocol?
  var router: MovieRouterProtocol?
  
  private var movies: [Movie] = [] {
    didSet {
      
    }
  }
  
  // MARK: Lifecycle
  init(view: MovieViewProtocol, interactor: MovieInteractorProtocol, router: MovieRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
}

//MARK: Extensions
extension MoviePresenter: MoviePresenterProtocol { }
