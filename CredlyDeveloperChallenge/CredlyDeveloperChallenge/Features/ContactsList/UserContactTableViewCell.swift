//
//  UserContactTableViewCell.swift
//  CredlyDeveloperChallenge
//
//  Created by Michael Sweeney on 1/27/23.
//

import UIKit

class UserContactTableViewCell: UITableViewCell {

    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    private let circularRadius: CGFloat = 24
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialsLabel.layer.masksToBounds = true
        initialsLabel.layer.cornerRadius = circularRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
