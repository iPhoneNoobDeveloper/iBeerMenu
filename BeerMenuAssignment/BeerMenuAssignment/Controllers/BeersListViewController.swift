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
        self.viewModel.getBeerDetails { [weak self] in
            DispatchQueue.main.async {
                guard let view = self else { return }
                view.beerListTableView.reloadData()
            }
        }
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
//            ImageCache.publicCache.load(url: beer.imageURL as! NSURL, item: Item(image: UIImage(), url: beer.imageURL!)) { (fetchedItem, image) in
//                if let img = image, img != fetchedItem.image {
//                    cell.beerImageView.image = img
//                }
//            }
            if let imageURL = beer.imageURL {
                cell.beerImageView.downloadBeerImageFrom(URL: imageURL, contentMode: .scaleAspectFit)
            }
            cell.nameLabel.text = beer.name
            cell.taglineLabel.text = beer.tagline
            cell.layoutIfNeeded()
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
}
