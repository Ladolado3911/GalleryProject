//
//  FavouriteViewController.swift
//  GalleryProject
//
//  Created by Zura Kobakhidze on 06.07.21.
//

import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource : FavoriteDataSource!
    private var viewModel: FavoriteViewModelProtocol!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataSource.refresh()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        configureViewModel()
    }
    
    private func setupLayout(){
        tableView.registerNib(class: FavoriteCell.self)
    }
    
    func configureViewModel() {
        viewModel = FavoriteViewModel()
        dataSource = FavoriteDataSource(with: tableView, viewModel: viewModel)
    }

}
