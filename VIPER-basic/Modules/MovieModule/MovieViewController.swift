//
//  MovieViewController.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

import UIKit

final class MovieViewController: UIViewController {
  // MARK: Public properties
  var presenter: MoviePresenterProtocol!
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBlue
  }
  
}

// MARK: Extensions
extension MovieViewController: MovieViewProtocol { }
