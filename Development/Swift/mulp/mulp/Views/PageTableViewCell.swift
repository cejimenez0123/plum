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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        let yeah = UIButton()
        yeah.setTitle( "Yeah", for: .normal)
        yeah.frame = CGRect(x:0,y:0,width:70,height:50)
        yeah.backgroundColor = .blue
        let nah = UIButton()
        nah.setTitle("Nah", for: .normal)
        let buttonCon = UIView()
        buttonCon.frame = CGRect(x:0,y:0,width: 140,height: 50)
        buttonCon.addSubview(yeah)
        buttonCon.addSubview(nah)
        view.addSubview(buttonCon)
//        NSLayoutConstraint.activate([
//        buttonCon.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        buttonCon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:  0.3),
//            buttonCon.heightAnchor.constraint(equalTo: view.heightAnchor)
//        ])
        buttonCon.backgroundColor = .white
        
        
        NSLayoutConstraint.activate(
        [yeah.leftAnchor.constraint(greaterThanOrEqualTo: buttonCon.leftAnchor),
        nah.leftAnchor.constraint(equalTo: yeah.rightAnchor),
        nah.rightAnchor.constraint(equalTo:buttonCon.rightAnchor),
        buttonCon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),buttonCon.heightAnchor.constraint(equalTo: view.heightAnchor), buttonCon.topAnchor.constraint(equalTo: view.topAnchor),
        buttonCon.bottomAnchor.constraint(equalTo:view.bottomAnchor),
        yeah.topAnchor.constraint(equalTo:buttonCon.topAnchor),
        yeah.bottomAnchor.constraint(equalTo: buttonCon.bottomAnchor)])
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
        
        cellBox.topAnchor.constraint(equalTo: picture.bottomAnchor),

                                        cellBox.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),

                                        cellBox.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),

        cellBox.heightAnchor.constraint(equalToConstant: 50)])
        
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
    func aYeah(){
        
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
