//
//  Page.swift
//  mulp
//
//  Created by /fam on 3/27/21.
//

import UIKit

class Page: NSObject,Identifiable {
    let id = UUID()
    var canvas: CanvasView
    init(canvas: CanvasView){
        
        super.init()
    }
}


