//
//  ImageBoxView.swift
//  mulp
//
//  Created by /fam on 4/9/21.
//

import UIKit

class ImageBoxView:UIImageView{
    var viewController:UIViewController?
    var overlayer:UIView
    override init(image: UIImage?) {
        overlayer = UIView()
        
        super.init(image: image )
        addHandles()
        
    }
    func addHandles(){
        
        guard let image = self.image else {return }
        let bound = UIScreen.main.bounds
       let width = bound.width / 2 * image.getCropWidth()
        let height =  width / image.getCropWidth()
        self.frame = CGRect(x: 30,y:150,width:width,height:height)
            // topController should now be your topmost view controller
       
    
        overlayer.translatesAutoresizingMaskIntoConstraints = false
                self.contentMode = .scaleAspectFit
        self.addSubview(overlayer)
        overlayer.backgroundColor = UIColor(white: 1, alpha: 0.0)
        let constraints = [overlayer.leftAnchor.constraint(equalTo: self.leftAnchor,constant: -1),
                           overlayer.rightAnchor.constraint(equalTo: self.rightAnchor,constant: 1),
                           overlayer.topAnchor.constraint(equalTo: self.topAnchor,constant: -1),
                           overlayer.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 1)]
        NSLayoutConstraint.activate(constraints)
        self.isUserInteractionEnabled = true
        overlayer.isUserInteractionEnabled = true
        overlayer.layer.isHidden = false
        overlayer.clipsToBounds = true
        overlayer.layer.borderColor = UIColor.red.cgColor
        overlayer.layer.borderWidth = 2.0
//        let buttonH = CGFloat(20)
//        let buttonW  = CGFloat(20)
        let upRButton  = UIView()
        let upLButton = UIView()
        let botLButton = UIView()
        let botRButton = UIView()
        let buttons  = [upRButton,upLButton,botLButton,botRButton]
        for but in buttons {
            but.isUserInteractionEnabled = true
        }
        overlayer.addSubview(upRButton)
        overlayer.addSubview(upLButton)
        overlayer.addSubview(botRButton)
        overlayer.addSubview(botLButton)
        upLButton.translatesAutoresizingMaskIntoConstraints = false
        upRButton.translatesAutoresizingMaskIntoConstraints = false
        botLButton.translatesAutoresizingMaskIntoConstraints = false
        botRButton.translatesAutoresizingMaskIntoConstraints = false
        
     let upRButtonConstraints = [upRButton.widthAnchor.constraint(equalToConstant: 50),
                                 upRButton.heightAnchor.constraint(equalToConstant: 50),
                                 upRButton.centerXAnchor.constraint(equalTo: overlayer.rightAnchor,constant: 5),
                                 upRButton.centerYAnchor.constraint(equalTo: overlayer.topAnchor,constant: -5)]
    let upLButtonConstraints = [upLButton.widthAnchor.constraint(equalToConstant: 50),                         upLButton.heightAnchor.constraint(equalToConstant: 50),
                                     upLButton.centerXAnchor.constraint(equalTo: overlayer.leftAnchor, constant: -5),
                                     upLButton.centerYAnchor.constraint(equalTo: overlayer.topAnchor,constant: -5)
                                        ]
        let botLButtonConstraints = [botLButton.widthAnchor.constraint(equalToConstant: 50),botLButton.heightAnchor.constraint(equalToConstant: 50),
                                     botLButton.centerXAnchor.constraint(equalTo: overlayer.leftAnchor, constant: 5),
                                     botLButton.centerYAnchor.constraint(equalTo: overlayer.bottomAnchor, constant: 5)]
        let botRButtonContraints = [botRButton.widthAnchor.constraint(equalToConstant: 50),botRButton.heightAnchor.constraint(equalToConstant: 50),botRButton.centerXAnchor.constraint(equalTo: overlayer.rightAnchor, constant: 5),botRButton.centerYAnchor.constraint(equalTo: overlayer.bottomAnchor, constant: 5)]
        
        let buttonConstraints = upRButtonConstraints + upLButtonConstraints + botLButtonConstraints + botRButtonContraints
        NSLayoutConstraint.activate(buttonConstraints)
       
//
//        let upLButton = UIView(frame: CGRect(x: -5, y: -5, width: buttonW, height: buttonH))
        upRButton.backgroundColor = .green
        upLButton.backgroundColor = .green
        botRButton.backgroundColor = .green
        botLButton.backgroundColor = .green
        let scalingGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleScaling(_:)))
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleDrag(_:)))
        upLButton.addGestureRecognizer(scalingGesture)
        upRButton.addGestureRecognizer(scalingGesture)
        botRButton.addGestureRecognizer(scalingGesture)
        botLButton.addGestureRecognizer(scalingGesture)
        overlayer.addGestureRecognizer(dragGesture)
        
    }
    required init?(coder aDecoder: NSCoder) {
        overlayer = UIView()
            super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        }
    @objc func handleScaling(_ gest: UIPanGestureRecognizer) {
//        guard let view = gest.view else {
//            return
//        }
//
      
        
            let translation = gest.translation(in: self.viewController?.view)
            let scaley = 1.0 - (translation.y / 160)
            
            self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
//        self.transform = self.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
        
        
    }
    @objc func handleDrag(_ panGesture: UIPanGestureRecognizer){
//        let lastLoaction = self.center
//        guard let view = panGesture.view else {return}
//        if panGesture.state == .began{
//            let location = panGesture.location(in: overlayer)
//        }
        let translation = panGesture.translation(in: self.viewController?.view)
//        let image = panGesture.view as! UIImageView
       
        self.center.x += translation.x
        self.center.y += translation.y
            panGesture.setTranslation(CGPoint.zero, in: self.viewController?.view)}
}
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
//        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
//            let lastLocation = self.center
//            guard gestureRecognizer.view != nil else {return}
//
//            let translation = gestureRecognizer.translation(in: self.viewController!.view)
//                // note: 'view' is optional and need to be unwrapped
//            self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
//                gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
//            gestureRecognizer.setTranslation(CGPoint.zero, in: self.superview)

    
    


  

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
