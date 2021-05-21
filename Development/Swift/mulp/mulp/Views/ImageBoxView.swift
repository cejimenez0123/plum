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
        let topRGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleTopR(_:)))
        let topLGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleTopL(_:)))
        let botRGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleBotR(_:)))
        let botLGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleBotL(_:)))
        topRBut.addGestureRecognizer(topRGesture)
        topLBut.addGestureRecognizer(topLGesture)
        botRBut.addGestureRecognizer(botRGesture)
        botLBut.addGestureRecognizer(botLGesture)
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
    @objc func handleTopR(_ gest: UIPanGestureRecognizer) {
                let translation = gest.translation(in: self.viewController?.view)
                let scaley = 1.0 - (translation.y / 160)
                self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
    //        self.transform = self.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    
    
        }
    @objc func handleTopL(_ gest: UIPanGestureRecognizer) {
                let translation = gest.translation(in: self.viewController?.view)
                let scaley = 1.0 - (translation.y / 160)
                self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
    //        self.transform = self.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    
    
        }
    @objc func handleBotR(_ gest: UIPanGestureRecognizer) {
                let translation = gest.translation(in: self.viewController?.view)
        let scaley = 1.0 + (translation.y / 160)
        self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
    //        self.transform = self.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    
    
        }
    @objc func handleBotL(_ gest: UIPanGestureRecognizer) {
                let translation = gest.translation(in: self.viewController?.view)
        let scaley =  1.0 + (translation.y / 160)
        self.transform = CGAffineTransform(scaleX: scaley, y: scaley)
    //        self.transform = self.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
    
    
        }
    
   
    
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
                super.init(coder: aDecoder)
            
    }

}

        
        
