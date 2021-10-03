//
//  BeerDetailsTableViewCell.swift
//  BeerMenuAssignment
//
//  Created by Nirav Jain on 03/10/21.
//

import UIKit

class BeerDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var firstBrewedLabel: UILabel!
    
    @IBOutlet weak var abvValueLabel: UILabel!
    @IBOutlet weak var abvTitleLabel: UILabel!
    
    @IBOutlet weak var ibvValueLabel: UILabel!
    @IBOutlet weak var ibvTitleLabel: UILabel!
    
    @IBOutlet weak var descriptionContainer: UIView!
    @IBOutlet weak var beerImageView: UIImageView!
    
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var taglineTitleLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    
    @IBOutlet weak var brewerTipTitleLabel: UILabel!
    @IBOutlet weak var brewerTipLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    static let reUseIdentifier = "BeerDetailsTableViewCell"
    static func cellNib() -> UINib {
        return UINib.init(nibName: BeerDetailsTableViewCell.reUseIdentifier, bundle: .main)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.setDefaultBeerDetailTableCellLayout()
    }

    func setDefaultBeerDetailTableCellLayout() {
        self.descriptionContainer.layer.cornerRadius = 10.0
        
        self.beerNameLabel.textColor = .white
        self.abvValueLabel.textColor = .white
        self.ibvValueLabel.textColor = .white
        
        self.firstBrewedLabel.textColor = UIColor.FlatColor.Orange.Sun
        self.abvTitleLabel.textColor = UIColor.FlatColor.Orange.Sun
        self.ibvTitleLabel.textColor = UIColor.FlatColor.Orange.Sun
        
        self.abvTitleLabel.text = "ABV"
        
        self.ibvTitleLabel.text = "IBU"

    }
    
    func loadBeerDetailsFor(beer: Beer) {
        self.beerNameLabel.text = beer.name
        self.firstBrewedLabel.text = beer.firstBrewed
        self.ibvValueLabel.text = String(beer.ibu ?? 0.0)
        self.descriptionLabel.text = beer.description
        self.taglineLabel.text = beer.tagline
        self.brewerTipLabel.text = beer.brewersTips
        
        if let imageURL = beer.imageURL {
            self.beerImageView.downloadBeerImageFrom(URL: imageURL, contentMode: .scaleAspectFit)
        }
    }
    
}
