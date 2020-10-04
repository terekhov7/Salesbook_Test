//
//  Salesbook_TestUITests.swift
//  Salesbook_TestUITests
//
//  Created by Vitalii on 30/09/2020.
//

import XCTest

class Salesbook_TestUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testTableView() {
        app.launch()

        let currencyTableView = app.tables["currencyTableView"]

        let cells = currencyTableView.cells
        
        if cells.count > 0 {
            let count = cells.count - 1
            let promise = expectation(description: "Waiting for cells")
         
            for i in stride(from: 0, to: count , by: 1) {
                
                let tableCell = cells.element(boundBy: i)
                XCTAssertTrue(tableCell.exists, "Cell exist")
                
                tableCell.tap()
         
                if i == (count - 1) {
                    promise.fulfill()
                }
                
                app.navigationBars.buttons.element(boundBy: 0).tap()
            }
            waitForExpectations(timeout: 30, handler: nil)
        } else {
            XCTAssert(false)
        }
    }
}
