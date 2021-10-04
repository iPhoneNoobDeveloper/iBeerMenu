//
//  ViewController.swift
//  BeerMenuAssignment
//
//  Created by Nirav Jain on 02/10/21.
//

import UIKit

class BeersListViewController: UIViewController {

    @IBOutlet weak var beerListTableView: UITableView!
    var viewModel = BeerListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.title = AppStrings.navigationTitle
        self.registerBeerTableViewCells()
        viewModel.loadBeerDetails()
    }
    
    func registerBeerTableViewCells() {
        beerListTableView.register(BeerTableViewCell.cellNib(), forCellReuseIdentifier: BeerTableViewCell.reUseIdentifier)
    }
}

extension BeersListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.reUseIdentifier, for: indexPath) as? BeerTableViewCell {
            
            let beer = viewModel.beers[indexPath.row]
            if let imageURL = beer.imageURL {
                cell.beerImageView.image = UIImage(named: "beer")
                ImageDownloader.shared.downloadImage(with: imageURL.absoluteString, completionHandler: { (image, cached) in
                    cell.beerImageView.image = image

                }, placeholderImage: UIImage(named: "beer"))
            }
            cell.nameLabel.text = beer.name
            cell.taglineLabel.text = beer.tagline
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productDetailViewController = storyboard.instantiateViewController(withIdentifier: "BeerDetailsViewController") as! BeerDetailsViewController
        productDetailViewController.beerDetail = self.viewModel.beers[indexPath.row]
        navigationController?.pushViewController(productDetailViewController, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !viewModel.isLoadingList){
            viewModel.isLoadingList = true
            viewModel.loadMoreBeersForList()
        }
    }
}
