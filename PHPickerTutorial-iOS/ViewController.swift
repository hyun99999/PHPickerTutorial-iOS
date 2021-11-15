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
        // 🎆 The maximum number of selections the user can make.
        // 🎆 기본값 1. 0 설정시 제한은 시스템이 지원하는 최대값으로 설정.
        configuration.selectionLimit = 2
        
        // 🎆 The filter you apply to restrict the asset types the picker displays.
        // 🎆 기본적으로 이미지(라이브포토 포함), 라이브포토, 비디오와 같은 모든 에셋타입 표시.
        configuration.filter = .images
//        configuration.filter = .any(of: [.images, .livePhotos, .videos])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
    }
}
// 🎆 유저가 선택을 완료했거나 취소 버튼으로 닫았을 때 알려주는 delegate
extension ViewController: PHPickerViewControllerDelegate {
    // 🎆 required method
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 🎆 선택완료 혹은 취소하면 뷰 dismiss.
        picker.dismiss(animated: true, completion: nil)
        /*
        // 🎆 사진 한개만 select.
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
        // 🎆
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
