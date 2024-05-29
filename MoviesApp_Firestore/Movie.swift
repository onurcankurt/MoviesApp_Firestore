//
//  Movie.swift
//  MoviesApp_Firestore
//
//  Created by onur on 30.05.2024.
//

import Foundation

class Movie {
    var id: String?
    var name: String?
    var image: String?
    var price: String?
    
    init() {
    }
    
    init(id: String, name: String, image: String, price: String) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
    }
}
