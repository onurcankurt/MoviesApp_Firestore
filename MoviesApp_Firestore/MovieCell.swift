//
//  MovieCell.swift
//  MoviesApp_Firestore
//
//  Created by onur on 30.05.2024.
//

import UIKit

protocol CellProtocol {
    func addToCart(indexPath: IndexPath)
}

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var indexPath: IndexPath?
    var cellProtocol: CellProtocol?
    
    
    
    @IBAction func addToCartButton(_ sender: Any) {
        cellProtocol?.addToCart(indexPath: indexPath!)
    }
}
