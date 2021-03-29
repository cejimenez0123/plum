//
//  Page.swift
//  mulp
//
//  Created by /fam on 3/27/21.
//

import UIKit

struct Page{
    var id = UUID()
    let name: String
    var canvas: Canvas
}

struct Canvas{
    var image: UIImage?
    var canvasView: CanvasView
}
