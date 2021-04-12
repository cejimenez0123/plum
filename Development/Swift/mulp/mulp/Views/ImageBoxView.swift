//
//  ImageBoxView.swift
//  mulp
//
//  Created by /fam on 4/9/21.
//

import UIKit

class ImageBoxView:UIImageView{
   
    override init(image: UIImage?) {
       
        let _: CGRect = UIScreen.main.bounds

//        let ws = screenSize.width / image!.size.width
//        let hs = screenSize.height / image!.size.height
      
//       let ws = image!.size.width / screenSize.width
//        let hs = image!.size.height / screenSize.width
        super.init(image: image)
    
        
        self.contentMode = .scaleAspectFit
        self.frame = CGRect(x:20,y: 50, width: 100 / image!.size.width , height:100 / image!.size.height )
        let overlayer = UIView(frame:CGRect( x:0,y:0,width:  image!.size.width/50, height: image!.size.height/50 ))
        overlayer.backgroundColor = UIColor(white: 1, alpha: 0.5)
        overlayer.layer.isHidden = false
        overlayer.layer.borderColor = UIColor.gray.cgColor
        overlayer.layer.borderWidth = 2.0
        
        self.addSubview(overlayer)
    }
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
}
//func checkIfFit(image: UIImage)->[width: CGFloat;ratio:Float ])do {
//    let screenSize: CGRect = UIScreen.main.bounds
//if (image.size.width > screenSize.width){
//    var size = image.size.width * 0.9
//    if(size > screenSize.width){
//        checkIfFit(size)
//    }else{
//        return {width: size, ratio: ratio}
//    }}
//
//}
