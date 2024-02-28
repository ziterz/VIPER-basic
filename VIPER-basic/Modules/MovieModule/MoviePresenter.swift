//
//  MoviePresenter.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

final class MoviePresenter {
  // MARK: Private properties
  private unowned let view: MovieViewProtocol
  private let interactor: MovieInteractorProtocol
  private let router: MovieRouterProtocol
  
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
