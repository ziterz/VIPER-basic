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
    collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collection.dataSource = self
    collection.delegate  = self
    view.addSubview(collection)
    
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
    collection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    collection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
    collection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
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
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()
  
  let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.font = .systemFont(ofSize: 24)
    label.textAlignment = .center
    return label
  }()
  
  public func configure(with data: Movie) {
    let url = URL(string: data.url)!
    self.imageView.kf.setImage(with: url)
    self.label.text = data.title
    self.addSubview(imageView)
    self.addSubview(label)
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: 0).isActive = true
    imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    
    label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
  }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let layout = collectionViewLayout as? UICollectionViewFlowLayout
    let space: CGFloat = (layout?.minimumInteritemSpacing ?? 0.0) + (layout?.sectionInset.left ?? 0.0) + (layout?.sectionInset.right ?? 0.0)
    let size: CGFloat = (collection.frame.size.width - space) / 2.0
    return CGSize(width: size, height: size + 80)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell else {
      fatalError("Failed to dequeue CustomCollectionViewCell in MovieViewController")
    }
    cell.configure(with: movies[indexPath.item])
    return cell
  }
  
  
}
