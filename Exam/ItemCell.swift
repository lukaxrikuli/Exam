//
//  ItemCell.swift
//  Exam
//
//  Created by luka xrikuli on 30.12.21.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var LogoImage: UIImageView!
    @IBOutlet weak var TitleLable: UILabel!
    @IBOutlet weak var HorsePowerLabel: UILabel!
    @IBOutlet weak var ItemsCount: UILabel!
    
    var id: Int?
    var car = Car()
    var number = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func IncreaceBtn(_ sender: UIButton) {
        number += 1
        ItemsCount.text = "\(number)"
    }
    
    @IBAction func DecreaceBtn(_ sender: UIButton) {
        number -= 1
        if number < 0 {
            number = 0
        }
        ItemsCount.text = "\(number)"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
