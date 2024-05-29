//
//  DetailsVC.swift
//  MoviesApp_Firestore
//
//  Created by onur on 30.05.2024.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var detailsMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = detailsMovie{
            nameLabel.text = m.name
            movieImageView.image = UIImage(named: m.image!)
            priceLabel.text = m.price
        }
    }
}
