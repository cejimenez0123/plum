//
//  PageTableViewCell.swift
//  mulp
//
//  Created by /fam on 3/28/21.
//

import UIKit

class PageTableViewCell: UITableViewCell {
    @IBOutlet weak var pageName:UILabel?
    @IBOutlet var picture:UIImageView! = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        return imageView
    }()
    @IBOutlet var cellBox:UIView! = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
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
    
        picture.addConstraint(NSLayoutConstraint(item: self.picture!,
                                                 attribute: NSLayoutConstraint.Attribute.height,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: self.picture!,
                                                      attribute: NSLayoutConstraint.Attribute.width,
                                                      multiplier:
                                                        1,
                                                      constant: 0))
      
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
