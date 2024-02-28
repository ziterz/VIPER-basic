//
//  MoviePresenter.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

final class MoviePresenter {
  // MARK: Properties
  private weak var view: MovieViewProtocol?
  private let interactor: MovieInteractorProtocol?
  private let router: MovieRouterProtocol?
  
  // MARK: Lifecycle
  init(view: MovieViewProtocol, interactor: MovieInteractorProtocol, router: MovieRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
  
  func load() {
    interactor?.load()
  }
  
  func handleOutput(_ output: [Movie]) {
    view?.handleOutput(output)
  }
}

//MARK: Extensions
extension MoviePresenter: MoviePresenterProtocol, MovieInteractorDelegate { }
