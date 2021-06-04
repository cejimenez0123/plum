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
            let bound = UIScreen.main.bounds
            let width = bound.width / 2 * (pickedImage.getCropWidth())
            let height =  width / (pickedImage.getCropWidth())
           
//            let panGesture = UIPanGestureRecognizer(target: self, action:(Selector(("handleDrag:"))))
           let frame = CGRect(x: 30, y: 150, width: width, height: height)
            let _ = ImageBoxView(image:pickedImage, frame: frame,viewController: self)
        
        
           
        
                
            
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
    
