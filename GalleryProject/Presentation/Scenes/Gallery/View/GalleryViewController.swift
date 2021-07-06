//
//  GalleryViewController.swift
//  myPart
//
//  Created by Shotiko Klibadze on 06.07.21.
//

import UIKit

class GalleryViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource : GalleryDataSource!
    private var viewModel: GalleryViewModelProtocol!
    
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
        tableView.registerNib(class: GalleryCell.self)
    }
    
    func configureViewModel() {
        viewModel = GalleryViewModel()
        dataSource = GalleryDataSource(with: tableView, viewModel: viewModel)
    }
    



}
