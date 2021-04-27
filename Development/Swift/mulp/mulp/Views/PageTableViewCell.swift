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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style,reuseIdentifier: reuseIdentifier)
        
        self.addSubview(picture)
        picture.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        picture.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        picture.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        picture.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
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
