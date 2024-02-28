//
//  MovieViewController.swift
//  VIPER-basic
//
//  Created by Ziady Mubaraq on 27/02/24.
//  Copyright © 2024 ziterz.dev. All rights reserved.
//

import UIKit
import Kingfisher

final class MovieViewController: UIViewController {
  // MARK: Properties
  internal var presenter: MoviePresenterProtocol?
  private var collection: UICollectionView!
  private var movies: [Movie] = []
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.load()
    setUI()
    setCollection()
  }
  
  private func setUI() {
    view.backgroundColor = .systemBackground
  }
  
  private func setCollection() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    guard let collection = collection else { return }
    collection.backgroundColor = .systemBackground
    collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    collection.dataSource = self
    collection.delegate  = self
    view.addSubview(collection)
    collection.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collection.topAnchor.constraint(equalTo: self.view.topAnchor),
      collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
    ])
  }
  
  private func reloadData() {
    DispatchQueue.main.async {
      self.collection.reloadData()
    }
  }
}

// MARK: Extensions
extension MovieViewController: MovieViewProtocol {
  func handleOutput(_ output: [Movie]) {
    self.movies = output
    self.reloadData()
  }
}

// MARK: CustomCollectionViewCell
class CustomCollectionViewCell: UICollectionViewCell {
  static let identifier = "CustomCollectionViewCell"
  
  let myImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.image = UIImage(systemName: "questionmark")
    imageView.tintColor = .black
    imageView.clipsToBounds = true
    return imageView
  }()
  
  public func configure(with url: URL) {
    self.myImageView.kf.setImage(with: url)
    self.addSubview(myImageView)
    myImageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      myImageView.topAnchor.constraint(equalTo: self.topAnchor),
      myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.myImageView.image = nil
  }
}

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
      fatalError("Failed to dequeue CustomCollectionViewCell in MoviewViewController")
    }
    let url = URL(string: movies[indexPath.item].url)!
    cell.configure(with: url)
    return cell
  }
  
  
}
