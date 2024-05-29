//
//  HomePageVM.swift
//  MoviesApp_Firestore
//
//  Created by onur on 30.05.2024.
//

import Foundation
import RxSwift

class HomePageVM {
    var mrepo = MoviesDaoRepository()
    var movieRXList = BehaviorSubject<[Movie]>(value: [Movie]())
    
    init() {
        movieRXList = mrepo.movieRXList
        uploadMovies()
    }
    
    func uploadMovies(){
        mrepo.uploadMovies()
    }
}
