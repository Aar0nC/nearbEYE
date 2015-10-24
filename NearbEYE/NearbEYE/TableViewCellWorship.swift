//
//  TableViewCellWorship.swift
//  NearbEYE
//
//  Created by Aaron Cotter on 2015-10-24.
//  Copyright © 2015 Stephen Melinyshyn. All rights reserved.
//

import UIKit

class TableViewCellWorship: UITableViewCell {

    @IBOutlet weak var worshipNameLabel: UILabel!
    @IBOutlet weak var worshipAddressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(cell : TableViewCellWorship, data : PlaceOfWorship) {
        worshipNameLabel.text = (data.name)
        worshipAddressLabel.text = (data.address) 
    }
    
    
}
