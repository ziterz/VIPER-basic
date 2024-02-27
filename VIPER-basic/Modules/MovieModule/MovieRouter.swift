//
//  MovieRouter.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

import UIKit

final class MovieRouter: MovieRouterProtocol {
  unowned let view: UIViewController
  
  init(view: UIViewController) {
    self.view = view
  }
}
