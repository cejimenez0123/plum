//
//  ImageBoxView.swift
//  mulp
//
//  Created by /fam on 4/9/21.
//

import UIKit

class ImageBoxView:UIView{
    
    
    var image: UIImage
    var viewController:UIViewController
    var imageView: UIImageView
    var handleLayer = UIView()
    let topRBut = UIView()
    let botRBut = UIView()
    let topLBut = UIView()
    let botLBut = UIView()
    required init(image:UIImage,frame:CGRect,viewController: UIViewController){
        
        self.image = image
        self.viewController = viewController
  
         imageView =  UIImageView(image:image )
        super.init(frame: frame)
        self.viewController.view.addSubview(self)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .red
        self.addSubview(imageView)
        let selfConstraints = [self.widthAnchor.constraint(equalTo: self.imageView.widthAnchor),self.heightAnchor.constraint(equalTo: self.imageView.heightAnchor),self.centerXAnchor.constraint(lessThanOrEqualTo: self.viewController.view.centerXAnchor, constant: 0),self.centerYAnchor.constraint(lessThanOrEqualTo: self.viewController.view.centerYAnchor, constant: 0)]
        let imageBoxConstraints = [imageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0),imageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0),imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)]
        imageView.isUserInteractionEnabled = true
        self.isUserInteractionEnabled = true
//        self.translatesAutoresizingMaskIntoConstraints = false
//       self.layer.isHidden = false
//        self.layer.borderColor = UIColor.red.cgColor
//        self.layer.borderWidth = 2.0
        imageView.addSubview(topRBut)
        imageView.addSubview(topLBut)
        imageView.addSubview(botRBut)
        imageView.addSubview(botLBut)

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
 
        let topRButtonConstraints = [topRBut.widthAnchor.constraint(equalTo: self.viewController.view.widthAnchor,multiplier: 0.5),
                                    topRBut.heightAnchor.constraint(equalTo: self.viewController.view.widthAnchor,multiplier: 0.5),
                                    topRBut.centerXAnchor.constraint(equalTo:self.rightAnchor,constant: -3),
                                    topRBut.centerYAnchor.constraint(equalTo: self.topAnchor,constant: 3)]
    let topLButConstraints = [topLBut.widthAnchor.constraint(equalToConstant: 10),                         topLBut.heightAnchor.constraint(equalToConstant: 10),
                                        topLBut.centerXAnchor.constraint(equalTo: self.leftAnchor, constant: 3),
                                        topLBut.centerYAnchor.constraint(equalTo: self.topAnchor,constant: 3)
                                           ]
    let botLButConstraints = [botLBut.widthAnchor.constraint(equalToConstant:10),
                              botLBut.heightAnchor.constraint(equalToConstant: 10),
                            botLBut.centerXAnchor.constraint(equalTo:self.leftAnchor, constant: 3),
                                    botLBut.centerYAnchor.constraint(equalTo:self.bottomAnchor, constant:-3)]
           let botRButContraints = [botRBut.widthAnchor.constraint(equalToConstant: 10),botRBut.heightAnchor.constraint(equalToConstant: 10),botRBut.centerXAnchor.constraint(equalTo: self.rightAnchor, constant:-3 ),botRBut.centerYAnchor.constraint(equalTo:self.bottomAnchor, constant:-3)]
        let constraints = topLButConstraints + topRButtonConstraints + botRButContraints + botLButConstraints + imageBoxConstraints + selfConstraints
        let dragGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleDrag(_:)))
        let topRGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleTopR(_:)))
        let topLGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleTopL(_:)))
        let botRGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleBotR(_:)))
        let botLGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleBotL(_:)))
        topRBut.addGestureRecognizer(topRGesture)
        topLBut.addGestureRecognizer(topLGesture)
        botRBut.addGestureRecognizer(botRGesture)
        botLBut.addGestureRecognizer(botLGesture)
        self.addGestureRecognizer(dragGesture)
    
        NSLayoutConstraint.activate(constraints)
        
    }
    @objc func handleDrag(_ panGesture: UIPanGestureRecognizer)->(){
            let translation = panGesture.translation(in: self.viewController.view)

        self.center.x += translation.x
            self.center.y += translation.y
            panGesture.setTranslation(CGPoint.zero, in: self.viewController.view)
        
    }
    @objc func handleTopR(_ gest: UIPanGestureRecognizer) {
                let translation = gest.translation(in: self.viewController.view)
                let scaley = 1.0 - (translation.y / 160)
        let scalex = 1.0 - (translation.x / 100)
        imageView.transform = CGAffineTransform(scaleX: scalex, y: scaley)
        self.transform = CGAffineTransform(scaleX: scalex, y: scaley)
        
//            self.transform = self.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    
    
        }
    @objc func handleTopL(_ gest: UIPanGestureRecognizer) {
                let translation = gest.translation(in: self.viewController.view)
                let scaley = 1.0 - (translation.y / 160)
                self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
    //        self.transform = self.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    
    
        }
    @objc func handleBotR(_ gest: UIPanGestureRecognizer) {
                let translation = gest.translation(in: self.viewController.view)
        let scaley = 1.0 + (translation.y / 160)
        self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
        self.setNeedsLayout()
    //        self.transform = self.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    
    
        }
    @objc func handleBotL(_ gest: UIPanGestureRecognizer) {
                let translation = gest.translation(in: self.viewController.view)
        let scaley =  1.0 + (translation.y / 160)
        self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
    //        self.transform = self.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    
    
        }
    
   
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
                super.init(coder: aDecoder)
            
    }

}



        
