//
//  PhotoCell.swift
//  TumblerFeed
//
//  Created by Amzad Chowdhury on 9/12/18.
//  Copyright © 2018 Amzad Chowdhury. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
