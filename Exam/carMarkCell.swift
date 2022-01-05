//
//  carMarkCell.swift
//  Exam
//
//  Created by luka xrikuli on 27.12.21.
//

import UIKit


class carMarkCell: UITableViewCell {

    @IBOutlet weak var cardMarkLabel: UILabel!
    @IBOutlet weak var CardBrandImageView: UIImageView!
    var id: Int?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
