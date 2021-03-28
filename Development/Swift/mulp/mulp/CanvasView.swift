//
//  CanvasView.swift
//  mulp
//
//  Created by /fam on 2/25/21.
//

import SwiftUI
class ToolView: UITableView{
    let tools = ["pencil","textarea","photo"]
    var toolImages = [UIImage]()
        

   
    
    override init(frame: CGRect, style: UITableView.Style){
        super.init(frame: frame, style: style)
        for word in tools {
            toolImages.append(UIImage(systemName: word)!)
        }
    }
   
    override func numberOfRows(inSection section: Int) -> Int {
        return tools.count
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class CanvasView: UIView {
    
   override init(frame: CGRect){
    super.init(frame: frame)
    self.backgroundColor = UIColor.white
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

