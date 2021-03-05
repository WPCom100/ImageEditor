//
//  ViewController.swift
//  ImageEditor
//
//  Created by Mabray, Justin on 3/4/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var SourceImage: UIImageView!
    @IBOutlet weak var ResultImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ChoosePhotoButton(_ sender: UIButton) { //button should bring up imagepicker and then save the chosen photo in 'SourceImage'
        let photoChoice = UIImagePickerController()
        photoChoice.delegate = self
        self.present(photoChoice, animated: true, completion: nil)
    }
    
    
    @IBAction func GreyScaleButton(_ sender: UIButton) {
        //take image from SourceImage, make it Grayscale and then display in ResultImage
        
    }
    
    @IBAction func SepiaButton(_ sender: UIButton) {
        //take image from SourceImage, make it Sepia and then display in ResultImage

        
    }
    
    @IBAction func InvertButoon(_ sender: UIButton) {
        //take image from SourceImage, give it nverted colors and then display in ResultImage

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        SourceImage.image = photo
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}

