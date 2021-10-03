//
//  BeerModel.swift
//  BeerMenuAssignment
//
//  Created by Nirav Jain on 03/10/21.
//

import Foundation
import UIKit

struct Beer: Decodable {
    let id: Int
    let name: String
    let tagline: String
    let firstBrewed: String
    let imageURL: URL?
    var image: UIImage? = nil
    let abv: Double
    let ibu: Double?
    let description: String
    let brewersTips: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, tagline, abv, ibu, description
        case imageURL = "image_url"
        case firstBrewed = "first_brewed"
        case brewersTips = "brewers_tips"
    }
}
