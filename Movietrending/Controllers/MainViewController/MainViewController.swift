//
//  MainViewController.swift
//  Movietrending
//
//  Created by Macbook on 12/11/23.
//

import UIKit

class MainViewController: UIViewController {

    //IBoutlets:
    @IBOutlet weak var tableView: UITableView!
        
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //variables:
    var cellDataSource: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configView()
        
        bindViewModel()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .red
        
        setupTableView()
    }
    
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind{ [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
            
        }
    }

}