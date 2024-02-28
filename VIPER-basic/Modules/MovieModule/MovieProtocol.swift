//
//  MovieProtocol.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

// MARK: View
protocol MovieViewProtocol: ViewProtocol {
  var presenter: MoviePresenterProtocol? { get }
}

// MARK: Interactor
protocol MovieInteractorProtocol: InteractorProtocol {
  var presenter: MoviePresenterProtocol? { get set }
  
  func load()
  func getMovies()
}

// MARK: Presenter
protocol MoviePresenterProtocol: PresenterProtocol {
  var view: MovieViewProtocol? { get set }
  var interactor: MovieInteractorProtocol? { get set }
  var router: MovieRouterProtocol? { get set }
  
  func load()
}

// MARK: Router
protocol MovieRouterProtocol: RouterProtocol {
  var presenter: MoviePresenterProtocol? { get set }
}
