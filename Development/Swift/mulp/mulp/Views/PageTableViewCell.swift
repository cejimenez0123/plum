//
//  PageTableViewCell.swift
//  mulp
//
//  Created by /fam on 3/28/21.
//

import UIKit

class PageTableViewCell: UITableViewCell {
    @IBOutlet weak var pageName:UILabel?
     var picture:UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        return imageView
    }()
    @IBOutlet var cellBox:UIView! = {
        var view = UIView()
        let commentButton = UIButton()
        let buttonCon = UIView()
        let yeah = UIButton()
        let nah = UIButton()
        let shareButton = UIButton()
        view.addSubview(commentButton)
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        yeah.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        nah.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        buttonCon.translatesAutoresizingMaskIntoConstraints = false
        buttonCon.backgroundColor = .black
            //Buttons
        
            yeah.setTitle( "Yeah", for: .normal)
            nah.setTitle("Nah", for: .normal)
        yeah.backgroundColor = .blue
        nah.backgroundColor = .red
        //Button Container
        
            buttonCon.addSubview(yeah)
            buttonCon.addSubview(nah)
        
        
        view.addSubview(buttonCon)
 
            //Button Container constraits Yeah and Nah button below
        NSLayoutConstraint.activate([buttonCon.leftAnchor.constraint(equalTo: view.leftAnchor),buttonCon.rightAnchor.constraint(equalTo: view.leftAnchor,constant:140),buttonCon.topAnchor.constraint(equalTo: view.topAnchor),buttonCon.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        NSLayoutConstraint.activate([yeah.topAnchor.constraint(equalTo: buttonCon.topAnchor),yeah.bottomAnchor.constraint(equalTo: buttonCon.bottomAnchor),yeah.rightAnchor.constraint(equalTo: buttonCon.rightAnchor,constant: -60),yeah.leftAnchor.constraint(equalTo: buttonCon.leftAnchor)])
        NSLayoutConstraint.activate([nah.topAnchor.constraint(equalTo: buttonCon.topAnchor),nah.bottomAnchor.constraint(equalTo: buttonCon.bottomAnchor),nah.rightAnchor.constraint(equalTo: buttonCon.rightAnchor),nah.leftAnchor.constraint(equalTo: yeah.rightAnchor)])

        
        
        let commentIcon = UIImage(named:"CommentIcon")
         commentButton.setImage(commentIcon,for: .normal)
        
        commentButton.imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        commentButton.imageView?.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([commentButton.heightAnchor.constraint(equalTo: view.heightAnchor),commentButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),commentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),commentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        let shareIcon = UIImage(named:"ShareIcon-1")
        shareButton.setImage(shareIcon, for: .normal)
        shareButton.imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = true
        view.addSubview(shareButton)
        
        NSLayoutConstraint.activate([shareButton.leftAnchor.constraint(equalTo: view.rightAnchor,constant: -80),shareButton.rightAnchor.constraint(equalTo: view.rightAnchor),shareButton.topAnchor.constraint(equalTo: view.topAnchor),shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        
        
       
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier: reuseIdentifier)
        
//       let commentHeight = cellBox.heightAnchor.constraint(equalToConstant: 45)
//        let commentWidth = cellBox.widthAnchor.constraint(equalToConstant: self.frame.width)
//        commentWidth.isActive = true
//        commentHeight.isActive  = true
        
        self.contentView.addSubview(picture)
        self.contentView.addSubview(cellBox)
        
        
//        let bounds = UIScreen.main.bounds
       
        NSLayoutConstraint.activate([

                                        picture.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),

                                        picture.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),

                                        picture.topAnchor.constraint(equalTo: self.contentView.topAnchor),

        picture.bottomAnchor.constraint(equalTo: cellBox.topAnchor),
                                        
                                        cellBox.heightAnchor.constraint(equalToConstant:56),
        
//        cellBox.topAnchor.constraint(equalTo: picture.bottomAnchor),
                                        cellBox.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
                                        cellBox.centerYAnchor.constraint(equalTo: picture.bottomAnchor, constant: 28),
                                        cellBox.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)])
//                                        cellBox.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
//
//                                        cellBox.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),

//        cellBox.heightAnchor.constraint(equalToConstant: 50)])
        
//
//        if let pic = picture{
//
//            if let image = pic.image{
        
//        NSLayoutConstraint(item: self.yourview!,
//                                                  attribute: NSLayoutAttribute.height,
//                                                  relatedBy: NSLayoutRelation.equal,
//                                                  toItem: self.yourview!,
//                                                  attribute: NSLayoutAttribute.width,
//                                                  multiplier: self.yourview.frame.size.height / self.yourview.frame.size.width,
//                                                  constant: 0)
//        picture.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        picture.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        picture.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        picture.bottomAnchor.constraint(equalTo: cellBox.topAnchor).isActive = true
//
//        cellBox.topAnchor.constraint(equalTo: picture.bottomAnchor).isActive = true
//        cellBox.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        cellBox.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        cellBox.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    func aYeah(button: UIButton){
        
    }
    func aNah(button: UIButton){
        
    }
    required init?(coder: NSCoder) {
        return nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
