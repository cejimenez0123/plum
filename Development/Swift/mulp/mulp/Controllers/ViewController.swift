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
        self.tableView.register(PageTableViewCell.self, forCellReuseIdentifier: "PageTableViewCell")
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "PageTableViewCell", for: indexPath) as! PageTableViewCell
    
       
        cell.picture.image = pages[indexPath.row].canvas
        var img: UIImage
        if cell.picture.image != nil{
            img = cell.picture.image!
        }else{
            img = pages[indexPath.row].canvas
        }
        
        cell.picture.addConstraint(NSLayoutConstraint(item: cell.picture,
                                                 attribute: NSLayoutConstraint.Attribute.height,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: cell.picture,
                                                      attribute: NSLayoutConstraint.Attribute.width,
                                                      multiplier:  img.getCropHeight(),
                                                      
                                                      constant: 0))
            
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentImage  = pages[indexPath.row].canvas
        let imageCrop = currentImage.getCropWidth()
        return tableView.frame.width / imageCrop + 60
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        }


}
extension UIImage{
    
    func getCropWidth()->CGFloat{
       return  CGFloat(self.size.width / self.size.height)
    }
    func getCropHeight()->CGFloat{
        return CGFloat(self.size.height / self.size.width)
    }
    
}
