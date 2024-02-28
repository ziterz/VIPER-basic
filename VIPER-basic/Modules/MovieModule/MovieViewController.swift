//
//  MovieViewController.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

import UIKit

final class MovieViewController: UIViewController {
  // MARK: Properties
  internal var presenter: MoviePresenterProtocol?
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemPurple
    presenter?.load()
  }
  
  func handleOutput(_ output: [Movie]) {
    print(output)
  }
}

// MARK: Extensions
extension MovieViewController: MovieViewProtocol { }
