//
//  File.swift
//  mulp
//
//  Created by /fam on 3/5/21.
//

import Foundation
import UIKit

class CanvasViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    

    var name: String = "Untitled"
    let imagePicker = UIImagePickerController()
    @IBOutlet var CanvasView: UIView!
    override func viewDidLoad() {
           super.viewDidLoad()

           imagePicker.delegate = self
       }

    @IBAction func addPhoto(_ sender: UIBarButtonItem) {
        imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
                
        present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.dismiss(animated: true, completion: { () -> Void in

                    })
            
            let inset = UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 10)
            pickedImage.resizableImage(withCapInsets: inset)
                            
           
//            let panGesture = UIPanGestureRecognizer(target: self, action:(Selector(("handleDrag:"))))
            let imageView = ImageBoxView(image: pickedImage)
            imageView.viewController = self
          
                view.addSubview(imageView)
            
        }
    }
   
    func handleDrag(panGesture: UIPanGestureRecognizer){
        let translation = panGesture.translation(in: view)
          guard let gestureView = panGesture.view else {
            return
          }
          gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
          )
          panGesture.setTranslation(.zero, in: view)
        }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
            }
    @IBAction func addTextbox(_ sender: UIBarButtonItem) {
    }
}
    
