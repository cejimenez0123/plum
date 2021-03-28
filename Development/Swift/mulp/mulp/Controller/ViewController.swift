//
//  ViewController.swift
//  mulp
//
//  Created by /fam on 2/25/21.
//

import UIKit

class ViewController: UITableViewController {
    
 
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addCanvas))
        // Do any additional setup after loading the view.
    }
    
    @objc func addCanvas(){
        
    }
}

