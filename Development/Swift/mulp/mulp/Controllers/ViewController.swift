//
//  ViewController.swift
//  mulp
//
//  Created by /fam on 2/25/21.
//

import UIKit

class ViewController: UITableViewController {
    var pages = [Page]()
 
    @IBAction func sequeCanvas(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Hope"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addCanvas))
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Page", for: indexPath) as! PageTableViewCell
        cell.pageName.text = pages[indexPath.row].name
        return cell
    }
    @objc func addCanvas(){
        let page =  Page(id: UUID(), name: "HOPE", canvas: Canvas(image: nil, canvasView: CanvasView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))))
        
        let controller = self.storyboard?.instantiateViewController(identifier: "CanvasViewController") as! CanvasViewController
        pages.append(page)
        controller.CanvasView = page.canvas.canvasView
        controller.page = page
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

