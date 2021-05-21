//
//  ImageBoxView.swift
//  mulp
//
//  Created by /fam on 4/9/21.
//

import UIKit

class ImageBoxView:UIImageView{
    
    
    
    var viewController:UIViewController?
    var overlayer = UIView()
    let topRBut = UIView()
    let botRBut = UIView()
    let topLBut = UIView()
    let botLBut = UIView()
    override init(image: UIImage?) {
        
        super.init(image: image )
        
        
        
        guard let image = self.image else {return }
        let bound = UIScreen.main.bounds
       let width = bound.width / 2 * image.getCropWidth()
        let height =  width / image.getCropWidth()
        self.frame = CGRect(x: 30,y:150,width:width,height:height)
        self.isUserInteractionEnabled = true
        overlayer.isUserInteractionEnabled = true
        overlayer.translatesAutoresizingMaskIntoConstraints = false
        overlayer.layer.isHidden = false
        overlayer.clipsToBounds = true
        overlayer.layer.borderColor = UIColor.red.cgColor
        overlayer.layer.borderWidth = 2.0
        self.addSubview(overlayer)
        let constraints = [overlayer.leftAnchor.constraint(equalTo: self.leftAnchor,constant: -1),
                           overlayer.rightAnchor.constraint(equalTo: self.rightAnchor,constant: 1),
                           overlayer.topAnchor.constraint(equalTo: self.topAnchor,constant: -1),
                           overlayer.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 1)]
        topRBut.translatesAutoresizingMaskIntoConstraints = false
        botRBut.translatesAutoresizingMaskIntoConstraints = false
        topLBut.translatesAutoresizingMaskIntoConstraints = false
        botLBut.translatesAutoresizingMaskIntoConstraints = false
        topRBut.isUserInteractionEnabled = true
        botRBut.isUserInteractionEnabled = true
        topLBut.isUserInteractionEnabled = true
        botLBut.isUserInteractionEnabled = true
        topRBut.backgroundColor = .green
        botRBut.backgroundColor = .green
        topLBut.backgroundColor = .green
        botLBut.backgroundColor = .green
        overlayer.addSubview(topRBut)
        overlayer.addSubview(topLBut)
        overlayer.addSubview(botLBut)
        overlayer.addSubview(botRBut)
        let topRButtonConstraints = [topRBut.widthAnchor.constraint(equalToConstant: 50),
                                    topRBut.heightAnchor.constraint(equalToConstant: 50),
                                    topRBut.centerXAnchor.constraint(equalTo: overlayer.rightAnchor,constant: 5),
                                    topRBut.centerYAnchor.constraint(equalTo: overlayer.topAnchor,constant: -5)]
       let topLButConstraints = [topLBut.widthAnchor.constraint(equalToConstant: 50),                         topLBut.heightAnchor.constraint(equalToConstant: 50),
                                        topLBut.centerXAnchor.constraint(equalTo: overlayer.leftAnchor, constant: -5),
                                        topLBut.centerYAnchor.constraint(equalTo: overlayer.topAnchor,constant: -5)
                                           ]
           let botLButConstraints = [botLBut.widthAnchor.constraint(equalToConstant: 50),botLBut.heightAnchor.constraint(equalToConstant: 50),
                                     botLBut.centerXAnchor.constraint(equalTo: overlayer.leftAnchor, constant: 5),
                                        botLBut.centerYAnchor.constraint(equalTo: overlayer.bottomAnchor, constant: 5)]
           let botRButContraints = [botRBut.widthAnchor.constraint(equalToConstant: 50),botRBut.heightAnchor.constraint(equalToConstant: 50),botRBut.centerXAnchor.constraint(equalTo: overlayer.rightAnchor, constant: 5),botRBut.centerYAnchor.constraint(equalTo:overlayer.bottomAnchor, constant: 5)]
           let butContraints = topLButConstraints + topRButtonConstraints + botRButContraints + botLButConstraints
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleDrag(_:)))
        overlayer.addGestureRecognizer(dragGesture)
           NSLayoutConstraint.activate(butContraints)
        NSLayoutConstraint.activate(constraints)
        
    }
//        addHandles()
    @objc func handleDrag(_ panGesture: UIPanGestureRecognizer)->(){
            let translation = panGesture.translation(in: self.viewController?.view)

        self.center.x += translation.x
            self.center.y += translation.y
            panGesture.setTranslation(CGPoint.zero, in: self.viewController?.view)
        
    }
    
   
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
                super.init(coder: aDecoder)
            
    }

}

//    func addHandles(){
//
//        guard let image = self.image else {return }
//        let bound = UIScreen.main.bounds
//       let width = bound.width / 2 * image.getCropWidth()
//        let height =  width / image.getCropWidth()
//        self.frame = CGRect(x: 30,y:150,width:width,height:height)
//            // topController should now be your topmost view controller
//
//
//        overlayer.translatesAutoresizingMaskIntoConstraints = false
//                self.contentMode = .scaleAspectFit
//        self.addSubview(overlayer)
//        overlayer.backgroundColor = UIColor(white: 1, alpha: 0.0)
//
//        NSLayoutConstraint.activate(constraints)
//        self.isUserInteractionEnabled = true
//        overlayer.isUserInteractionEnabled = true
//        overlayer.layer.isHidden = false
//        overlayer.clipsToBounds = true
//        overlayer.layer.borderColor = UIColor.red.cgColor
//        overlayer.layer.borderWidth = 2.0
//        let buttonH = CGFloat(20)
//        let buttonW  = CGFloat(20)
//        let upRButton  = UIView()
//        let upLButton = UIView()
//        let botLButton = UIView()
//        let botRButton = UIView()
        
        
//        upLButton.translatesAutoresizingMaskIntoConstraints = false
//        upRButton.translatesAutoresizingMaskIntoConstraints = false
//        botLButton.translatesAutoresizingMaskIntoConstraints = false
//        botRButton.translatesAutoresizingMaskIntoConstraints = false
//
//        upRButton.isUserInteractionEnabled = true
//        upLButton.isUserInteractionEnabled = true
//        botLButton.isUserInteractionEnabled = true
//        botRButton.isUserInteractionEnabled = true
//
//        overlayer.addSubview(upRButton);
//        overlayer.addSubview(upLButton);
//        overlayer.addSubview(botRButton);
//        overlayer.addSubview(botLButton);
        
        
//     let upRButtonConstraints = [upRButton.widthAnchor.constraint(equalToConstant: 50),
//                                 upRButton.heightAnchor.constraint(equalToConstant: 50),
//                                 upRButton.centerXAnchor.constraint(equalTo: overlayer.rightAnchor,constant: 5),
//                                 upRButton.centerYAnchor.constraint(equalTo: overlayer.topAnchor,constant: -5)]
//    let upLButtonConstraints = [upLButton.widthAnchor.constraint(equalToConstant: 50),                         upLButton.heightAnchor.constraint(equalToConstant: 50),
//                                     upLButton.centerXAnchor.constraint(equalTo: overlayer.leftAnchor, constant: -5),
//                                     upLButton.centerYAnchor.constraint(equalTo: overlayer.topAnchor,constant: -5)
//                                        ]
//        let botLButtonConstraints = [botLButton.widthAnchor.constraint(equalToConstant: 50),botLButton.heightAnchor.constraint(equalToConstant: 50),
//                                     botLButton.centerXAnchor.constraint(equalTo: overlayer.leftAnchor, constant: 5),
//                                     botLButton.centerYAnchor.constraint(equalTo: overlayer.bottomAnchor, constant: 5)]
//        let botRButtonContraints = [botRButton.widthAnchor.constraint(equalToConstant: 50),botRButton.heightAnchor.constraint(equalToConstant: 50),botRButton.centerXAnchor.constraint(equalTo: overlayer.rightAnchor, constant: 5),botRButton.centerYAnchor.constraint(equalTo: overlayer.bottomAnchor, constant: 5)]
//
//        let buttonConstraints = upRButtonConstraints + upLButtonConstraints + botLButtonConstraints + botRButtonContraints
//        NSLayoutConstraint.activate(buttonConstraints)
       
//
//        let upLButton = UIView(frame: CGRect(x: -5, y: -5, width: buttonW, height: buttonH))
//        upRButton.backgroundColor = .green
//        upLButton.backgroundColor = .green
//        botRButton.backgroundColor = .green
//        botLButton.backgroundColor = .green
//        let scalingGesture = UIPanGestureRecognizer(target: self, action: #selector(.handleScaling(_:)))
//        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(Overlayer.handleDrag(_:)))
//        upLButton.addGestureRecognizer(scalingGesture)
//        upRButton.addGestureRecognizer(scalingGesture)
//        botRButton.addGestureRecognizer(scalingGesture)
//        botLButton.addGestureRecognizer(scalingGesture)
//        overlayer.addGestureRecognizer(dragGesture)
        

    
//    @objc func handleScaling(_ gest: UIPanGestureRecognizer) {
//            let translation = gest.translation(in: self.viewController?.view)
//            let scaley = 1.0 - (translation.y / 160)
//            self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
////        self.transform = self.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
//
//
//    }
//    @objc func handleDrag(_ panGesture: UIPanGestureRecognizer){
////        let lastLoaction = self.center
////        guard let view = panGesture.view else {return}
////        if panGesture.state == .began{
////            let location = panGesture.location(in: overlayer)
////        }
//        let translation = panGesture.translation(in: self.viewController?.view)
////        let image = panGesture.view as! UIImageView
//
//        self.center.x += translation.x
//        self.center.y += translation.y
////            panGesture.setTranslation(CGPoint.zero, in: self.viewController?.view)}
//
//    let topRBut = UIView()
//    let botRBut = UIView()
//    let topLBut = UIView()
//    let botLBut = UIView()
//
//
//        super.init(frame:frame)
       
        
//
//        topRBut.translatesAutoresizingMaskIntoConstraints = false
//        botRBut.translatesAutoresizingMaskIntoConstraints = false
//        topLBut.translatesAutoresizingMaskIntoConstraints = false
//        botLBut.translatesAutoresizingMaskIntoConstraints = false
//        topRBut.isUserInteractionEnabled = true
//        botRBut.isUserInteractionEnabled = true
//        topLBut.isUserInteractionEnabled = true
//        botLBut.isUserInteractionEnabled = true
//        topRBut.backgroundColor = .green
//        botRBut.backgroundColor = .green
//        topLBut.backgroundColor = .green
//        botLBut.backgroundColor = .green
//        self.addSubview(topRBut)
//        self.addSubview(topLBut)
//        self.addSubview(botLBut)
//        self.addSubview(botRBut)
//
//     let topRButtonConstraints = [topRBut.widthAnchor.constraint(equalToConstant: 50),
//                                 topRBut.heightAnchor.constraint(equalToConstant: 50),
//                                 topRBut.centerXAnchor.constraint(equalTo: self.rightAnchor,constant: 5),
//                                 topRBut.centerYAnchor.constraint(equalTo: self.topAnchor,constant: -5)]
//    let topLButConstraints = [topLBut.widthAnchor.constraint(equalToConstant: 50),                         topLBut.heightAnchor.constraint(equalToConstant: 50),
//                                     topLBut.centerXAnchor.constraint(equalTo: self.leftAnchor, constant: -5),
//                                     topLBut.centerYAnchor.constraint(equalTo: self.topAnchor,constant: -5)
//                                        ]
//        let botLButConstraints = [botLBut.widthAnchor.constraint(equalToConstant: 50),botLBut.heightAnchor.constraint(equalToConstant: 50),
//                                  botLBut.centerXAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
//                                     botLBut.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: 5)]
//        let botRButContraints = [botRBut.widthAnchor.constraint(equalToConstant: 50),botRBut.heightAnchor.constraint(equalToConstant: 50),botRBut.centerXAnchor.constraint(equalTo: self.rightAnchor, constant: 5),botRBut.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: 5)]
//        let butContraints = topLButConstraints + topRButtonConstraints + botRButContraints + botLButConstraints
//        NSLayoutConstraint.activate(butContraints)
//        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleDrag(_:)))
//        self.addGestureRecognizer(dragGesture)
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    @objc func handleTopRBut(sender: UIPanGestureRecognizer){
//        let translation = sender.translation(in: self.viewController!.view)
//        let scaley = 1.0 - (translation.y / 160)
//        self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
//
//
//        }
//
//   @objc func handleTopLBut(sender: UIPanGestureRecognizer){
//    let translation = sender.translation(in: self.viewController!.view)
//    let scaley = 1.0 - (translation.y / 160)
//    self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
//
//    }
//   @objc func handleBotRBut(sender: UIPanGestureRecognizer){
//        let translation = sender.translation(in: self.viewController!.view)
//        let scaley = 1.0 - (translation.y / 160)
//        self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
//
//    }
//    func handleBotLBut(sender: UIPanGestureRecognizer){
//        let translation = sender.translation(in: self.viewController!.view)
//        let scaley = 1.0 - (translation.y / 160)
//        self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
//
//    }
//    @objc func handleDrag(_ sender: UIPanGestureRecognizer){
////        let lastLoaction = self.center
////        guard let view = panGesture.view else {return}
////        if panGesture.state == .began{
////            let location = panGesture.location(in: overlayer)
////        }
//        let translation = sender.translation(in: self.viewController?.view)
////        let image = panGesture.view as! UIImageView
//
//        self.parentView?.center.x += translation.x
//        self.parentView?.center.y += translation.y
//            sender.setTranslation(CGPoint.zero, in: self.viewController?.view)
//        }
//}
//
//        image.center = CGPoint(x: image.center.x+translation.x, y: image.center.y+translation.y)
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
