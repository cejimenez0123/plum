//
//  ViewController.swift
//  mulp
//
//  Created by /fam on 2/25/21.
//

import UIKit

class MainViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var pages = [Page]()
    
    let imagePicker = UIImagePickerController()
    @IBOutlet var BarButtonItem: UIBarButtonItem!
    
    @IBOutlet var LeftButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imagePicker.delegate = self
        title = "Hope"

    }
    
    @IBAction func openImagePicker(_ sender: UIBarButtonItem) {
        imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
                
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.dismiss(animated: true, completion:  { () -> Void in})
            print(pages)
            pages.append(Page(id: UUID(), name: "Page", canvas: pickedImage))
            self.tableView.reloadData()
            print(pages)
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PageTableViewCell", for: indexPath) as! PageTableViewCell
        let imageView = UIImageView()
        let bounds = UIScreen.main.bounds
       
        imageView.image = pages[indexPath.row].canvas
        imageView.frame = CGRect(x:0,y:0,width:bounds.size.width,height: imageView.image!.size.height)
        cell.picture = imageView
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        }


}
