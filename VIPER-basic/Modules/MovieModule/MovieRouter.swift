//
//  MovieRouter.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

import UIKit

final class MovieRouter: MovieRouterProtocol {
  private weak var view: UIViewController?
  
  init(view: UIViewController) {
    self.view = view
  }
  
  static func make() -> UIViewController {
    let view = MovieViewController()
    let router = MovieRouter(view: view)
    let interactor = MovieInteractor()
    let presenter = MoviePresenter(view: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}
