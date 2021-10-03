//
//  BeerDetailsTableViewCellTests.swift
//  BeerMenuAssignmentTests
//
//  Created by Nirav Jain on 04/10/21.
//

import XCTest
@testable import BeerMenuAssignment

class BeerDetailsTableViewCellTests: XCTestCase {

    var beerDetailsTableViewCell: BeerDetailsTableViewCell?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let tableView = UITableView()
        tableView.register(BeerDetailsTableViewCell.cellNib(), forCellReuseIdentifier: BeerDetailsTableViewCell.reUseIdentifier)
        self.beerDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: BeerDetailsTableViewCell.reUseIdentifier) as? BeerDetailsTableViewCell
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func mockBeerDetailForDetailTableViewCell() -> Beer? {
        let beerDetails = Beer(id: 0, name: "Trashy Blonde", tagline: "You Know You Shouldn't", firstBrewed: "04/2008", abv: 4.1, description: "A titillating, neurotic, peroxide punk of a Pale Ale. Combining attitude, style, substance, and a little bit of low self esteem for good measure; what would your mother say? The seductive lure of the sassy passion fruit hop proves too much to resist. All that is even before we get onto the fact that there are no additives, preservatives, pasteurization or strings attached. All wrapped up with the customary BrewDog bite and imaginative twist", brewersTips: "Getting good Bramling Cross is key. Most English hops are in leaf form (not pelletised), so getting fresh hops close to harvest (September) will give this beer the right amount of dark berry intensity")
        return beerDetails
    }

    
    //Check for Reuse identifer valude do not change, mainly due to typing error.
    func testReUseIdentifier(){
        let reUseIdentifier =  BeerTableViewCell.reUseIdentifier
        XCTAssertEqual(reUseIdentifier, "BeerTableViewCell")
    }
    
    func testOutletConnectionIsNotNil() {
        do {
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.beerNameLabel, "IBOutlet of beerNameLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.firstBrewedLabel, "IBOutlet of firstBrewedLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.abvValueLabel, "IBOutlet of abvValueLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.abvTitleLabel, "IBOutlet of abvTitleLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.ibvValueLabel, "IBOutlet of ibvValueLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.ibvTitleLabel, "IBOutlet of ibvTitleLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.descriptionContainer, "IBOutlet of descriptionContainer is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.beerImageView, "IBOutlet of beerImageView is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.taglineLabel, "IBOutlet of taglineLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.descriptionTitleLabel, "IBOutlet of descriptionTitleLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.descriptionLabel, "IBOutlet of descriptionLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.taglineTitleLabel, "IBOutlet of taglineTitleLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.taglineLabel, "IBOutlet of taglineLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.brewerTipTitleLabel, "IBOutlet of brewerTipTitleLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.brewerTipLabel, "IBOutlet of brewerTipLabel is not attached ")
            _ = try XCTUnwrap(self.beerDetailsTableViewCell?.containerView, "IBOutlet of containerView is not attached ")


        } catch {}
    }
    
    func testDefaultBeerTableCellLayout() {
        beerDetailsTableViewCell?.setDefaultBeerDetailTableCellLayout()
        XCTAssertNotNil(self.beerDetailsTableViewCell?.abvTitleLabel.text, "text of abvTitleLabel is not defined")
        XCTAssertNotNil(self.beerDetailsTableViewCell?.ibvTitleLabel.text, "text of ibvTitleLabel is not defined")
    }
  
    func testLoadBeerDetailsFor() {
        if let beerDetails = self.mockBeerDetailForDetailTableViewCell() {
            beerDetailsTableViewCell?.loadBeerDetailsFor(beer: beerDetails)
            XCTAssertNotNil(self.beerDetailsTableViewCell?.beerNameLabel.text, "text of name is not defined")
            XCTAssertNotNil(self.beerDetailsTableViewCell?.firstBrewedLabel.text, "text of firstBrewed is not defined")
        }
    }

}
