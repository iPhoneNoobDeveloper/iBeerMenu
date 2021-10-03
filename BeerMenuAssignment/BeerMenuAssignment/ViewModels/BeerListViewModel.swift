//
//  BeerListViewModel.swift
//  BeerMenuAssignment
//
//  Created by Nirav Jain on 03/10/21.
//

import Foundation
import UIKit

class BeerListViewModel {
    
    var beers: [Beer] = []
    let beerRequest = BeerServiceRouter()
    
    typealias BeerRetrieved = () -> Void
    
    func getBeerDetails(completion: @escaping(() -> Void)) {
        BeerServiceRouter().getBeerList { (beerResponse, status, error) in
            if let beers = beerResponse {
                self.beers = beers
                completion()
            } else {
                
                DispatchQueue.main.async {
                    let viewController = (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)?.topViewController
                    let cancel = "Cancel"
                    viewController?.displayAlertOnViewController(title: nil, message: error?.description ?? "Something went wrong! Please try again", actionTitles: [cancel], actionStyles: [.default,], actions: [nil])
                }
            }
        }
    }
}
