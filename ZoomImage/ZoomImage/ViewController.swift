//
//  ViewController.swift
//  ZoomImage
//
//  Created by Huy Vu on 11/6/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpScrollView()
    }
    
    func setUpScrollView(){
        scrollView.delegate = self
    }
    
    
    
    @IBAction func button(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
          imagePicker.sourceType = .photoLibrary // You can use .camera for the camera
          imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    

}

extension ViewController: UIScrollViewDelegate ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // Do something with the selected image
            
            print("fbfhvfhvf \(info)")
            // Hiển thị ảnh đã chọn trên UIImageView
            imageView.image = selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
