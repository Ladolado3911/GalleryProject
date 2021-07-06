//
//  CameraViewController.swift
//  GalleryProject
//
//  Created by Shotiko Klibadze on 06.07.21.
//

import UIKit

class CameraViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAdd(_:)))
    }
    
    
    
    @IBAction func onAdd(_ sender: UIBarButtonItem){
      let picker = UIImagePickerController()
      picker.sourceType = .camera
      picker.delegate = self
      present(picker, animated: true, completion: nil)
    }
  }
  extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
        return
      }
      picker.dismiss(animated: true, completion: nil)
      //MARK: saving to gallery
//      let imageData = image.pngData()!
//      let compressedImage = UIImage(data: imageData)!
      UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
      //MARK: notifying that it’s been saved
      let alert = UIAlertController(title: "Saved!", message: "Your Image Has Been Saved!", preferredStyle: .alert)
      let okayAction = UIAlertAction(title: "ok", style: .default, handler: nil)
      alert.addAction(okayAction)
      self.present(alert, animated: true, completion: nil)
    }
  }
