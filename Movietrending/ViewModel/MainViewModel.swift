//
//  MainViewModel.swift
//  Movietrending
//
//  Created by Macbook on 12/11/23.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[Movie]> = Observable(nil)
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
            if isLoading.value ?? true {
                return
            }
            
            isLoading.value = true
            APICaller.getTrendingMovies { [weak self] result in
                self?.isLoading.value = false
                
                switch result {
                case .success(let trendingMovieData):
                    self?.dataSource = trendingMovieData
                    self?.mapCellData()
                case .failure(let err):
                    print(err)
                }
            }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results ?? []
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
}
