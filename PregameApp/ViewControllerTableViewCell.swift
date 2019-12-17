//
//  ViewControllerTableViewCell.swift
//  PregameApp
//
//  Created by Jonny Chow on 11/3/19.
//  Copyright © 2019 Jonny Chow. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var alcLabel: UILabel!
    @IBOutlet weak var alcPrice: UILabel!
    @IBOutlet weak var alcVol: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
