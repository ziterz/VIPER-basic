//
//  MovieRouter.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

import UIKit

final class MovieRouter: MovieRouterProtocol {
  static func make() -> MovieViewController {
    let vc = MovieViewController()
    let router = MovieRouter()
    let interactor = MovieInteractor()
    let presenter = MoviePresenter(view: vc, interactor: interactor, router: router)
    vc.presenter = presenter
    return vc
  }
}
