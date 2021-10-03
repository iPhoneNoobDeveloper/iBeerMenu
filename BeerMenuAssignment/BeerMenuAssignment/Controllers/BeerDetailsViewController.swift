//
//  BeerDetailsViewController.swift
//  BeerMenuAssignment
//
//  Created by Nirav Jain on 03/10/21.
//

import UIKit

class BeerDetailsViewController: UIViewController {

    @IBOutlet weak var beerDetailTableView: UITableView!
    
    var beerDetail: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = false
        self.view.backgroundColor = UIColor.FlatColor.Orange.NeonCarrot
        self.registerBeerTableViewCells()

    }
    
    func registerBeerTableViewCells() {
        beerDetailTableView.register(BeerDetailsTableViewCell.cellNib(), forCellReuseIdentifier: BeerDetailsTableViewCell.reUseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func buttonclosePressed() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension BeerDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell: BeerDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BeerDetailsTableViewCell", for: indexPath) as? BeerDetailsTableViewCell {
            if let beer = beerDetail {
                cell.loadBeerDetailsFor(beer: beer)
            }
            return cell
        }
        return UITableViewCell()
    }
}
