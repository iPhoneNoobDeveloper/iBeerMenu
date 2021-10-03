//
//  BeerDetailsViewControllerTests.swift
//  BeerMenuAssignmentTests
//
//  Created by Nirav Jain on 04/10/21.
//

import XCTest
@testable import BeerMenuAssignment

class BeerDetailsViewControllerTests: XCTestCase {
    
    private var beerDetailsViewController: BeerDetailsViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        beerDetailsViewController = storyboard.instantiateViewController(withIdentifier: "BeerDetailsViewController") as? BeerDetailsViewController ?? BeerDetailsViewController()
        beerDetailsViewController?.loadView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOutletConnectionIsNotNil() {
        do {
            _ = try XCTUnwrap(self.beerDetailsViewController?.beerDetailTableView, "IBOutlet of navigationBar is not attached ")
        } catch {}
    }
    
    func testControllersTableViewConformsToDataSourceProtocol() {
        XCTAssertTrue(((beerDetailsViewController?.conforms(to: UITableViewDataSource.self))) ?? false)
    }
    
    func testControllersTableViewNumberOfRowsInSection() {
        XCTAssertTrue(((beerDetailsViewController?.responds(to: #selector(beerDetailsViewController?.tableView(_:numberOfRowsInSection:)))) != nil))
    }

    func testControllersTableViewCellForRow() {
        XCTAssertTrue(((beerDetailsViewController?.responds(to: #selector(beerDetailsViewController?.tableView(_:cellForRowAt:)))) != nil))
    }
    
    func testBeerListTableViewCell() {
        beerDetailsViewController?.registerBeerTableViewCells()
        let cell = beerDetailsViewController?.beerDetailTableView.dequeueReusableCell(withIdentifier: BeerDetailsTableViewCell.reUseIdentifier) as? BeerDetailsTableViewCell
        XCTAssertNotNil(cell)
    }

}
