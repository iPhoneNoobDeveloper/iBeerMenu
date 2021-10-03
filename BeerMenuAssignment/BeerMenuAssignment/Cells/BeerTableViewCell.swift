//
//  BeerTableViewCell.swift
//  BeerMenuAssignment
//
//  Created by Nirav Jain on 02/10/21.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!

    static let reUseIdentifier = "BeerTableViewCell"
    static func cellNib() -> UINib {
        return UINib.init(nibName: BeerTableViewCell.reUseIdentifier, bundle: .main)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setDefaultBeerTableCellLayout()
    }
    
    func setDefaultBeerTableCellLayout() {
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.taglineLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
}
