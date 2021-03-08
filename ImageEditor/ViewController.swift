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
        let image = CIImage(image: SourceImage.image!)
        
        let filter = CIFilter(name: "CIColorMonochrome", parameters: [
            
            "inputColor": CIColor.gray,
            "inputImage": image!,
            
            "inputIntensity": 1.0
        ])
        let outputImage = filter?.outputImage
        ResultImage.image = UIImage(ciImage: outputImage!)

        
    }
    
    @IBAction func SepiaButton(_ sender: UIButton) {
        //take image from SourceImage, make it Sepia and then display in ResultImage
        let image = CIImage(image: SourceImage.image!)
        
        let filter = CIFilter(name: "CISepiaTone", parameters: [
            
            "inputImage": image!,
            
            "inputIntensity": 0.6
        ])
        let outputImage = filter?.outputImage
        ResultImage.image = UIImage(ciImage: outputImage!)
        
    }
    
    @IBAction func InvertButton(_ sender: UIButton) {
        //take image from SourceImage, give it inverted colors and then display in ResultImage
        let image = CIImage(image: SourceImage.image!)
        
        let filter = CIFilter(name: "CIColorInvert", parameters: [
            
            "inputImage": image!
        ])
        let outputImage = filter?.outputImage
        ResultImage.image = UIImage(ciImage: outputImage!)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        SourceImage.image = photo
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}

