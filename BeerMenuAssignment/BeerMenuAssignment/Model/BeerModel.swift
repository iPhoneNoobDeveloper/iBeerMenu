//
//  BeerModel.swift
//  BeerMenuAssignment
//
//  Created by Nirav Jain on 03/10/21.
//

import Foundation
import UIKit

struct Beer: Codable {
    var id: Int
    var name: String
    var tagline: String
    var firstBrewed: String
    var imageURL: URL?
    var image: UIImage? = nil
    var abv: Double
    var ibu: Double?
    var description: String
    var brewersTips: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, tagline, abv, ibu, description
        case imageURL = "image_url"
        case firstBrewed = "first_brewed"
        case brewersTips = "brewers_tips"
    }
}
