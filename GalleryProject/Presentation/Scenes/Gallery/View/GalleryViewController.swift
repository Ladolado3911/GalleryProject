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

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pickImage))
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
    
    @objc func pickImage() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
      }

}


extension GalleryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
        dataSource.addImage(with: image)
        let documentDir = try? FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        guard let filePath = documentDir?.appendingPathComponent("GalleryImages") else {return}
        guard let data = image.jpegData(compressionQuality: 1) else {return}
        do {
            try data.write(to: filePath)
            print(filePath)
        } catch {
            print (error.localizedDescription)
        }
      }
        
        
    
      picker.dismiss(animated: true, completion: nil)
    }

}
