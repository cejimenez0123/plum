//
//  ImageBoxView.swift
//  mulp
//
//  Created by /fam on 4/9/21.
//

import UIKit
enum Position{
    case upRight,upLeft,downRight,downLeft, up, right,left, down
}
class ImageBoxView:UIImageView{
    var viewController:UIViewController?
    override init(image: UIImage?) {
        
      

//        let ws = screenSize.width / image!.size.width
//        let hs = screenSize.height / image!.size.height
      
//       let ws = image!.size.width / screenSize.width
//        let hs = image!.size.height / screenSize.width
      
        super.init(image: image )
        guard let image = self.image else {return }
        let bound = UIScreen.main.bounds
       let width = bound.width / 2 * image.getCropWidth()
        let height =  width / image.getCropWidth()
        self.frame = CGRect(x: 30,y:150,width:width,height:height)
            // topController should now be your topmost view controller
        let overlayer = UIView(frame:CGRect( x:0,y:0,width:  self.frame.width, height: self.frame.height ))
        overlayer.translatesAutoresizingMaskIntoConstraints = false
                self.contentMode = .scaleAspectFit
        self.addSubview(overlayer)
//        let bounds = UIScreen.main.bounds
        
        
        overlayer.backgroundColor = UIColor(white: 1, alpha: 0.0)
        let constraints = [overlayer.leftAnchor.constraint(equalTo: self.leftAnchor),
                           overlayer.rightAnchor.constraint(equalTo: self.rightAnchor),
                           overlayer.topAnchor.constraint(equalTo: self.topAnchor),
                           overlayer.bottomAnchor.constraint(equalTo: self.bottomAnchor)]
        NSLayoutConstraint.activate(constraints)
        self.isUserInteractionEnabled = true
        overlayer.isUserInteractionEnabled = true
        overlayer.layer.isHidden = false
        overlayer.clipsToBounds = true
        overlayer.layer.borderColor = UIColor.red.cgColor
        overlayer.layer.borderWidth = 2.0
        let buttonH = bounds.width/13
        
        let upRButton =  UIView(frame: CGRect(x: overlayer.frame.maxX, y: overlayer.frame.minY, width: buttonH, height: buttonH))
        let upLButton = UIView(frame: CGRect(x: -10, y: -10, width: buttonH, height: buttonH))
        let buttons = [upRButton,upLButton]
        let panGesture = UIPanGestureRecognizer(target: upRButton, action: #selector(self.handleCorner(_:)))
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleDrag(_:)))
        for button in buttons {
            button.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 255, blue: 0, alpha: 1))
            
            button.isUserInteractionEnabled = true
            button.addGestureRecognizer(panGesture)
        
            button.layer.cornerRadius = 5
            overlayer.addSubview(button)
        }
        self.addGestureRecognizer(dragGesture)
        
    }
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        }
    @objc func handleCorner(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            guard gestureRecognizer.view != nil else {return}
               let piece = gestureRecognizer.view!
            let translation = gestureRecognizer.translation(in: piece.superview)
                // note: 'view' is optional and need to be unwrapped
                gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: piece.superview)
            }
        }
    @objc func handleDrag(_ panGesture: UIPanGestureRecognizer){
//        let lastLoaction = self.center
        guard let view = panGesture.view else {return}
        let translation = panGesture.translation(in: self.viewController?.view)
//        let image = panGesture.view as! UIImageView
        view.center.x += translation.x
        view.center.y += translation.y
        panGesture.setTranslation(CGPoint.zero, in: self.viewController?.view)
//            image.center = CGPoint(x: image.center.x+translation.x, y: image.center.y+translation.y)
//

//            if panGesture.state == UIGestureRecognizer.State.began {
//                // add something you want to happen when the Label Panning has started
//            }
//
//            if panGesture.state == UIGestureRecognizer.State.ended {
//                panGesture.setTranslation(CGPoint.zero, in: view)
//                // add something you want to happen when the Label Panning has ended
//            }
//
//            if panGesture.state == UIGestureRecognizer.State.changed {
//                // add something you want to happen when the Label Panning has been change ( during the moving/panning )
//            } else {
//                // or something when its not moving
//            }
        }
//        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
//            let lastLocation = self.center
//            guard gestureRecognizer.view != nil else {return}
//
//            let translation = gestureRecognizer.translation(in: self.viewController!.view)
//                // note: 'view' is optional and need to be unwrapped
//            self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
//                gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
//            gestureRecognizer.setTranslation(CGPoint.zero, in: self.superview)
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
