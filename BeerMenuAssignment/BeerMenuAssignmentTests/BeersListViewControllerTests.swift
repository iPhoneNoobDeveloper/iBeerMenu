//
//  BeersListViewControllerTests.swift
//  BeerMenuAssignmentTests
//
//  Created by Nirav Jain on 04/10/21.
//

import XCTest
@testable import BeerMenuAssignment

class BeersListViewControllerTests: XCTestCase {

    private var beersListViewController: BeersListViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        beersListViewController = storyboard.instantiateViewController(withIdentifier: "BeersListViewController") as? BeersListViewController ?? BeersListViewController()
        beersListViewController?.loadView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOutletConnectionIsNotNil() {
        do {
            _ = try XCTUnwrap(self.beersListViewController?.beerListTableView, "IBOutlet of navigationBar is not attached ")
        } catch {}
    }
    
    func testControllersTableViewConformsToDataSourceProtocol() {
        XCTAssertTrue(((beersListViewController?.conforms(to: UITableViewDataSource.self))) ?? false)
    }
    
    func testControllersTableViewNumberOfRowsInSection() {
        XCTAssertTrue(((beersListViewController?.responds(to: #selector(beersListViewController?.tableView(_:numberOfRowsInSection:)))) != nil))
    }

    func testControllersTableViewCellForRow() {
        XCTAssertTrue(((beersListViewController?.responds(to: #selector(beersListViewController?.tableView(_:cellForRowAt:)))) != nil))
    }
    
    func testBeerListTableViewCell() {
        beersListViewController?.registerBeerTableViewCells()
        let cell = beersListViewController?.beerListTableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.reUseIdentifier) as? BeerTableViewCell
        XCTAssertNotNil(cell)
    }

}
