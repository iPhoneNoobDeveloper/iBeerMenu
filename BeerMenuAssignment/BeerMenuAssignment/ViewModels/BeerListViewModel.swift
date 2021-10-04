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
    var currentPage : Int = 1
    var isLoadingList : Bool = false
    var pageRecordSize = 25

    typealias BeerRetrieved = () -> Void
    
    let beerServiceRouter = BeerServiceRouter()
    
    func loadBeerDetails(forIndexPage page: Int = 1) {
        
        self.getBeerDetails(currentPage: page) {
            DispatchQueue.main.async {
                if let viewController = (UIApplication.shared.windows.first!.rootViewController as? UINavigationController)?.topViewController as? BeersListViewController {
                    viewController.beerListTableView.reloadData()
                    self.isLoadingList = false

                }
            }
        }
    }
    
    func getBeerDetails(currentPage: Int,  completion: @escaping(() -> Void)) {
        
        beerServiceRouter.getBeerList(currentPage: currentPage) { (beerResponse, status, error) in
            if let beers = beerResponse {
                if beers.isEmpty {
                    self.beers = beers
                } else {
                    self.beers.append(contentsOf: beers)
                }
                completion()
            } else {
                if status != 200 {
                    self.isLoadingList = false
                    DispatchQueue.main.async {
                        let viewController = (UIApplication.shared.windows.first!.rootViewController as? UINavigationController)?.topViewController
                        let cancel = "Cancel"
                        viewController?.displayAlertOnViewController(title: nil, message: error?.description ?? "Something went wrong! Please try again", actionTitles: [cancel], actionStyles: [.default,], actions: [nil])
                    }
                }
            }
        }
    }
    
    func loadMoreBeersForList() {
        currentPage += 1
        loadBeerDetails(forIndexPage: currentPage)
    }
}
