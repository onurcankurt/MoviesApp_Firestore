//
//  DetailsVC.swift
//  MoviesApp_Firestore
//
//  Created by onur on 30.05.2024.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var detailsMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = detailsMovie{
            nameLabel.text = m.name
            if let url = URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(m.image!)"){
                DispatchQueue.main.async {
                    self.movieImageView.kf.setImage(with: url)
                }
            }
            priceLabel.text = "\(m.price!) ₺"
        }
    }
}
