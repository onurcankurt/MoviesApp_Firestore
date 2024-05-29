//
//  MoviesDaoRepository.swift
//  MoviesApp_Firestore
//
//  Created by onur on 30.05.2024.
//

import Foundation
import RxSwift
import FirebaseFirestore

class MoviesDaoRepository {
    var movieRXList = BehaviorSubject<[Movie]>(value: [Movie]())
    var collectionMovies = Firestore.firestore().collection("Filmler")
    
    func uploadMovies(){
        collectionMovies.getDocuments { snapshot, error in
            var list = [Movie]()
            if let documents = snapshot?.documents{
                for document in documents{
                    let data = document.data()
                    let id = document.documentID
                    let name = data["ad"] as? String ?? ""
                    let image = data["resim"] as? String ?? ""
                    let price = data["fiyat"] as? String ?? ""
                    
                    let movie = Movie(id: id, name: name, image: image, price: price)
                    list.append(movie)
                }
            }
            self.movieRXList.onNext(list)
        }
    }
}
