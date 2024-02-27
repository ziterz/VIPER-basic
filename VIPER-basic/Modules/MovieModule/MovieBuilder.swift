//
//  MovieBuilder.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

import Foundation

final class MovieBuilder {
  static func make() -> MovieViewController {
    let vc = MovieViewController()
    let router = MovieRouter(view: vc)
    let interactor = MovieInteractor()
    let presenter = MoviePresenter(view: vc, interactor: interactor, router: router)
    vc.presenter = presenter
    return vc
  }
}
