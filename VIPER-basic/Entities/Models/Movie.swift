//
//  Movie.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 28/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

import Foundation

struct Movie: Codable {
  let id: String
  let originalTitle: String
}

struct Popular: Codable {
  let results: [Movie]
}
