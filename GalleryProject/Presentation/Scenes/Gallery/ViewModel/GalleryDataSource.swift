//
//  GalleryDataSource.swift
//  myPart
//
//  Created by Shotiko Klibadze on 06.07.21.
//

import UIKit

class GalleryDataSource: NSObject, UITableViewDataSource {

    
    private var tableView: UITableView!
    private var viewModel: GalleryViewModelProtocol!
    
    
    private var content = [URL]()
    
    init(with tableView : UITableView, viewModel: GalleryViewModelProtocol) {
        self.tableView = tableView
        self.viewModel = viewModel
        
        super.init()
        
        self.tableView.dataSource = self
    }
    
    func refresh(){
        content.removeAll()
        guard let images = viewModel.getSavedImage() else { return }
        content.append(contentsOf: images)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(GalleryCell.self, for: indexPath)
        
        cell.configure(image: UIImage(contentsOfFile: content[indexPath.row].path))
        
        return cell
    }
    
    
    
}
