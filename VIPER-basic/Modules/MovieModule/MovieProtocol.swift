//
//  MovieProtocol.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

protocol MovieViewProtocol: ViewProtocol {
  var presenter: MoviePresenterProtocol! { get }
}
protocol MovieInteractorProtocol: InteractorProtocol {
  func getMovies()
}
protocol MoviePresenterProtocol: PresenterProtocol { }
protocol MovieRouterProtocol: RouterProtocol { }
