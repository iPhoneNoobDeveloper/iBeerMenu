//
//  BeerTableViewCellTests.swift
//  BeerMenuAssignmentTests
//
//  Created by Nirav Jain on 04/10/21.
//

import XCTest
@testable import BeerMenuAssignment

class BeerTableViewCellTests: XCTestCase {
    var beerListTableViewCell: BeerTableViewCell?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let tableView = UITableView()
        tableView.register(BeerTableViewCell.cellNib(), forCellReuseIdentifier: BeerTableViewCell.reUseIdentifier)
        self.beerListTableViewCell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.reUseIdentifier) as? BeerTableViewCell
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //Check for Reuse identifer valude do not change, mainly due to typing error.
    func testReUseIdentifier(){
        let reUseIdentifier =  BeerTableViewCell.reUseIdentifier
        XCTAssertEqual(reUseIdentifier, "BeerTableViewCell")
    }
    
    func testOutletConnectionIsNotNil() {
        do {
            _ = try XCTUnwrap(self.beerListTableViewCell?.beerImageView, "IBOutlet of beerImageView is not attached ")
            _ = try XCTUnwrap(self.beerListTableViewCell?.nameLabel, "IBOutlet of nameLabel is not attached ")
            _ = try XCTUnwrap(self.beerListTableViewCell?.taglineLabel, "IBOutlet of taglineLabel is not attached ")
        } catch {}
    }
    
    func testDefaultBeerTableCellLayout() {
        beerListTableViewCell?.setDefaultBeerTableCellLayout()
        XCTAssertNotNil(self.beerListTableViewCell?.taglineLabel.font, "font of tagline label is not defined")
        XCTAssertNotNil(self.beerListTableViewCell?.nameLabel.font, "font of name label is not defined")
    }
}
