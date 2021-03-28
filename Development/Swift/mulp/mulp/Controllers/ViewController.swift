//
//  ViewController.swift
//  mulp
//
//  Created by /fam on 2/25/21.
//

import UIKit

class ViewController: UITableViewController {
    var pages = [Page]()
 
    override func viewDidLoad() {
        
        super.viewDidLoad()
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
        let controller = self.storyboard?.instantiateViewController(identifier: "CanvasViewController") as! CanvasViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}

