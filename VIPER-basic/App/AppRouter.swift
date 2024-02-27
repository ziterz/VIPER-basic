//
//  AppRouter.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

import UIKit

final class AppRouter {
  let window: UIWindow
  
  init() {
    self.window = UIWindow(frame: UIScreen.main.bounds)
  }
  
  func start() {
    let viewController = MovieBuilder.make()
    let nav = UINavigationController(rootViewController: viewController)
    window.rootViewController = nav
    window.makeKeyAndVisible()
  }
}
