# PHPickerTutorial-iOS
πͺ iOS 14+ PHPickerViewController μ¬μ£Όμ¬μ£Όμ¬

---

κΈ°μ‘΄μ μ§μνλ UIPickerViewController κ° μμλλ°μ! iOS 14 μμ μλ‘μ΄ Photo Picker κ° λμμ΄λ€!

[Apple Developer Documentation](https://developer.apple.com/documentation/photokit/phpickerviewcontroller)

μμ κ°λ°μ λ¬Έμλ₯Ό μ΄ν΄λ³΄μκ΅¬μ!

### Overview

`PHPickerViewController` ν΄λμ€λ `UIImagePickerController` μ λμμλλ€. `PHPickerViewController` λ μμ μ±κ³Ό μ λ’°μ±μ κ°μ νκ³  λ€μκ³Ό κ°μ κ°λ°μμ μ¬μ©μμκ² μ΄μ μ μ κ³΅ν©λλ€.

- Deferred image loading and recovery UI

μ§μ°λ μ΄λ―Έμ§ λ‘λ©κ³Ό λ³΅κ΅¬ UI

- Reliable handling of large and complex assets, like RAW and panoramic images

RAW λ° νλΈλΌλ§ μ΄λ―Έμ§μ κ°μ ν¬κ³  λ³΅μ‘ν μμμ μμ μ μΈ μ²

(RAW λ μ΄λ―Έμ§ νμΌ ν¬λ§·μ΄λ€. λ€λ₯Έ νμ₯μλ€λ³΄λ€ ν¬κΈ°κ° λ§€μ° ν¬μ§λ§ μ¬μ§νΈμ§μ μ μ©νλ€κ³  νλ€. iPhone 12 νλ‘ λ° νλ‘λ§₯μ€μμλΆν° μ΄¬μκ°λ₯.)

- User-selectable assets that arenβt available forΒ `UIImagePickerController`

UIImagePickerController μ μ¬μ©ν  μ μλ μ¬μ©μμ ν κ°λ₯ν μμ

- Configuration of the picker to display only Live Photos

Live Photos λ§ νμνλ picker κ΅¬μ±

- Availability ofΒ [PHLivePhoto](https://developer.apple.com/documentation/photokit/phlivephoto)Β objects without library access

λΌμ΄λΈλ¬λ¦¬ μ‘μΈμ€ μμ΄ PHLivePhoto(Live Photo) κ°μ²΄ μ¬μ©κ°λ₯

- Stricter validations against invalid inputs

μ ν¨νμ§ μλ μλ ₯μ λν λ μκ²©ν κ²μ¦

**μ΄λ κ² λ³΄λκΉ κΈ°λ₯λ©΄μμ λ¬΄μμ΄ νμ€ν λ€λ₯Έμ§ λͺ¨λ₯΄κ² λλ°μ! λ§λ€μ΄λ³΄κΈ°μ μ λ¨Όμ  μκ°ν΄λ³΄κ² μ΅λλ€!**

- multiple select
- zoom in or out
- search
- κΆν μμ²­ νμμ΄ λ¨μ§ μλλ€.

μμ²­..λμ§ μλμ..? νλ₯κ·Έλ 

# μΆλ°

### 1. import PhotosUI

```swift
import PhotosUI
```

### 2. Create PHPickerConfiguration

: picker λ·°μ»¨νΈλ‘€λ¬λ₯Ό κ΅¬μ±νλ μ λ³΄λ₯Ό ν¬ν¨ν κ°μ²΄μλλ€.

μ΄ κ°μ²΄λ‘ μ μ΄ ν  μ μλλ° κ·Έ μ’λ₯λ₯Ό μμλ³΄μ!

```swift
var configuration = PHPickerConfiguration()
// π selectionLimit
// π μ μ κ° μ νν  μ μλ μμμ μ΅λ κ°―μ. κΈ°λ³Έκ° 1. 0 μ€μ μ μ νμ μμ€νμ΄ μ§μνλ μ΅λκ°μΌλ‘ μ€μ .
configuration.selectionLimit = 1

// π filter
// π picker κ° νμνλ μμ νμ μ νμ μ μ©. κΈ°λ³Έμ μΌλ‘ λͺ¨λ  μμ μ νμ νμ(μ΄λ―Έμ§, λΌμ΄λΈν¬ν , λΉλμ€)
configuration.filter = .images
// configuration.filter = .any(of: [.images, .livePhotos, .videos])
```

### 3. Initialize PHPicker

λ§λ  PHPickerConfiguration μ κ°μ§κ³  PHPickerViewController λ₯Ό λ§λ€μ΄μΌ ν©λλ€.

```swift
let picker = PHPickerViewController(configuration: configuration)
```

### 4. PHPickerViewControllerDelegate

`UIImagePickerController` λ μ ννκ³  `didFinishPickingMediaWithInfo` λ©μλλ‘ μ νν λ―Έλμ΄μ μ λ³΄λ₯Ό κ°μ Έμλλ° PHPicker λ λμΌν μ­ν μ΄ μλ€.

```swift
// π μ μ κ° μ νμ μλ£νκ±°λ μ·¨μ λ²νΌμΌλ‘ λ«μμ λ μλ €μ£Όλ delegate
extension ViewController: PHPickerViewControllerDelegate {
    // π required method
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // ...
    }
}
```

`PHPickerViewControllerDelegate` μ μ±νν΄μ£Όκ³  μ­μλ `picker.delegate = self` μ€μ ν΄μ£Όμ΄μΌ νλ€.

### 5. Present Picker

μ΄μ  νΌμ»€λ₯Ό λ·°μ λμ΄λ΄μλ€! μλλ μ μ²΄ μ½λμλλ€.

```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        // ...
    }
}
```

### 6. Handling assets

μ΄μ  μ νν μμλ€μ λ€λ£¨μ΄λ³΄κ² μ΅λλ€.

delegate μμ νλΌλ―Έν° results λ₯Ό μ¬μ©νλ©΄λλ΅λλ€!

- PHPickerResult : μ νλ μμμ λνλ΄λ νμ.
- itemProvider: **[NSItemProvider](https://developer.apple.com/documentation/foundation/nsitemprovider).** μ νλ μμμ respresentation.

```swift

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // π μ νμλ£ νΉμ μ·¨μνλ©΄ λ·° dismiss.
        picker.dismiss(animated: true, completion: nil)
        
        // π itemProvider λ₯Ό κ°μ Έμ¨λ€.
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider,
           // π itemProvider μμ μ§μ ν νμμΌλ‘ λ‘λν  μ μλμ§ μ²΄ν¬
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            // π loadObject() λ©μλλ completionHandler λ‘ NSItemProviderReading κ³Ό error λ₯Ό μ€λ€.
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                // π itemProvider λ background asnyc μμμ΄κΈ° λλ¬Έμ UI μ κ΄λ ¨λ μλ°μ΄νΈλ κΌ­ main μ°λ λμμ μ€νν΄μ€μΌ ν©λλ€.
                DispatchQueue.main.sync {
                    self.myImageView.image = image as? UIImage
                }
            }
        }
    }
}
```

### 7. Multiple selection Handling

λ€μκ³Ό κ°μ΄ `PHPickerResult` λ°°μ΄μμ κΊΌλ΄μ£Όλ©΄ λλ€.

```swift
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)   
    
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
```

### κ²°κ³Ό

<img src ="https://user-images.githubusercontent.com/69136340/141780108-70dddc9e-6fda-4b16-9e16-45c9769edfab.gif" width ="250">

μΆμ² : 

[iOS 14+ ) PHPicker](https://zeddios.tistory.com/1052)
