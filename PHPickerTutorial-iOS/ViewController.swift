//
//  ViewController.swift
//  PHPickerTutorial-iOS
//
//  Created by kimhyungyu on 2021/11/15.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    
    @IBOutlet weak var myFirstImageView: UIImageView!
    @IBOutlet weak var mySecondImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tochPresentButton(_ sender: Any) {
        
        var configuration = PHPickerConfiguration()
        // π The maximum number of selections the user can make.
        // π κΈ°λ³Έκ° 1. 0 μ€μ μ μ νμ μμ€νμ΄ μ§μνλ μ΅λκ°μΌλ‘ μ€μ .
        configuration.selectionLimit = 2
        
        // π The filter you apply to restrict the asset types the picker displays.
        // π κΈ°λ³Έμ μΌλ‘ μ΄λ―Έμ§(λΌμ΄λΈν¬ν  ν¬ν¨), λΌμ΄λΈν¬ν , λΉλμ€μ κ°μ λͺ¨λ  μμνμ νμ.
        configuration.filter = .images
//        configuration.filter = .any(of: [.images, .livePhotos, .videos])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
    }
}
// π μ μ κ° μ νμ μλ£νκ±°λ μ·¨μ λ²νΌμΌλ‘ λ«μμ λ μλ €μ£Όλ delegate
extension ViewController: PHPickerViewControllerDelegate {
    // π required method
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // π μ νμλ£ νΉμ μ·¨μνλ©΄ λ·° dismiss.
        picker.dismiss(animated: true, completion: nil)
        /*
        // π μ¬μ§ νκ°λ§ select.
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.sync {
                    self.myFirstImageView.image = image as? UIImage
                }
            }
        }
         */
        // π
        let itemFirstProvider = results[0].itemProvider
        let itemSecondProvider = results[1].itemProvider
        
        if itemFirstProvider.canLoadObject(ofClass: UIImage.self) {
            itemFirstProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.sync {
                    self.myFirstImageView.image = image as? UIImage
                }
            }
        }
        
        if itemSecondProvider.canLoadObject(ofClass: UIImage.self) {
            itemSecondProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.sync {
                    self.mySecondImageView.image = image as? UIImage
                }
            }
        }
    }
}
