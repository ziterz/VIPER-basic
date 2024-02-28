//
//  MovieProtocol.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

// MARK: View
protocol MovieViewProtocol: ViewProtocol {
  func handleOutput(_ output: [Movie])
}

// MARK: Interactor
protocol MovieInteractorProtocol: InteractorProtocol {
  var delegate: MovieInteractorDelegate? { get set }
  
  func load()
  func getMovies()
}

protocol MovieInteractorDelegate: AnyObject {
  func handleOutput(_ output: [Movie])
}

// MARK: Presenter
protocol MoviePresenterProtocol: PresenterProtocol {
  func load()
}

// MARK: Router
protocol MovieRouterProtocol: RouterProtocol { }
