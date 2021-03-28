//
//  PageTableViewCell.swift
//  mulp
//
//  Created by /fam on 3/28/21.
//

import UIKit

class PageTableViewCell: UITableViewCell {
    @IBOutlet weak var pageName:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
