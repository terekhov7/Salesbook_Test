//
//  Salesbook_TestTests.swift
//  Salesbook_TestTests
//
//  Created by Vitalii on 30/09/2020.
//

import XCTest
@testable import Salesbook_Test

class Salesbook_TestTests: XCTestCase {
    
    func testCurrencyInfo() {
        let currencyInfo = CurrencyInfo(url: "https://api.exchangeratesapi.io/latest?base=PLN")

        XCTAssertNotEqual(currencyInfo.getCurrencyDictionary(), [:])
    }
    
    func testLastWeekRates() {
        let lastRates = LastWeekRates(url: "https://api.exchangeratesapi.io/history?start_at=2020-03-01&end_at=2020-03-15&base=PLN&symbols=EUR")

        XCTAssertNotEqual(lastRates.getRatesDictionary(), [:])
    }

    func testCurrencyViewModel() {
        let currencyViewModel = CurrencyInfoViewModel(currency: "PLN")
        
        XCTAssertNotEqual(currencyViewModel.getRatesDictionary(), [:])
        XCTAssertNotEqual(currencyViewModel.getCurrencyName(), "")
    }
    
    func testRatesViewModel() {
        let ratesViewModel = RatesViewModel(mainCurrencyCode: "PLN", ratesCurrencyCode: "USD", fromDate: "2020-03-10", toDate: "2020-03-20")
        
        XCTAssertNotEqual(ratesViewModel.getInfoDictionary(), [:])
        XCTAssertNotEqual(ratesViewModel.getDatesArray(), [])
        XCTAssertNotEqual(ratesViewModel.getRatesArray(currencyCode: "USD"), [])
    }
}
