//
//  ViewController.swift
//  MoviesApp_Firestore
//
//  Created by onur on 30.05.2024.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var moviesList = [Movie]()
    var viewModel = HomePageVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        _ = viewModel.movieRXList.subscribe(onNext: { movies in
            self.moviesList = movies
            DispatchQueue.main.async {
                self.moviesCollectionView.reloadData()
            }
        })
        
        let design = UICollectionViewFlowLayout()
        
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumLineSpacing = 10
        design.minimumInteritemSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        
        design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.65)
        moviesCollectionView.collectionViewLayout = design
    }
}

extension HomePageVC: CellProtocol{
    func addToCart(indexPath: IndexPath) {
        print("\(moviesList[indexPath.row].name!) added to cart.")
    }
    
    
}

extension HomePageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = moviesList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        cell.movieImageView.image = UIImage(named: "TEST")
        
//        if let url = URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(movie.image!)"){
//            DispatchQueue.main.async {
//                cell.movieImageView.
//            }
//        }
        
        cell.priceLabel.text = "\(movie.price!) ₺"
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            if let senderMovie = sender as? Movie{
                let destinationVC = segue.destination as! DetailsVC
                destinationVC.detailsMovie = senderMovie
            }
        }
    }
    
}

