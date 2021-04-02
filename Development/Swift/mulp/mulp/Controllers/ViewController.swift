//
//  ViewController.swift
//  mulp
//
//  Created by /fam on 2/25/21.
//

import UIKit

class MainViewController: UITableViewController {
    var pages = [Page]()
    
    @IBOutlet var BarButtonItem: UIBarButtonItem!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Hope"

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PageTableViewCell", for: indexPath) as! PageTableViewCell
        cell.pageName.text = pages[indexPath.row].name
        return cell
    }
//    @objc func addCanvas(for segue:UIStoryboardSegue,sender:Any?){
//        let page =  Page(id: UUID(), name: "BEST", canvas: Canvas(image: nil, canvasView: CanvasView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))))
//        let viewcontroller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CanvasViewController") as? CanvasViewController
//        viewcontroller?.name  = page.name
//        viewcontroller?.CanvasView = page.canvas.canvasView
//        navigationController?.pushViewController(viewcontroller! , animated: false)
//
//
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        }


}
