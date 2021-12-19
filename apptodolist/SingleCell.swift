//
//  SingleCell.swift
//  apptodolist
//
//  Created by admin on 18/12/2021.
//

import UIKit

class SingleCell: UITableViewCell {

    @IBOutlet weak var todotitle: UILabel!
    
    
    @IBOutlet weak var duedate: UILabel!
    
    @IBOutlet weak var tododesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
