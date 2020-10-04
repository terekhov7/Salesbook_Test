//
//  CurrencyViewModel.swift
//  Salesbook_Test
//
//  Created by Vitalii on 01/10/2020.
//

import Foundation

class CurrencyInfoViewModel {
    
    private var currencyInfo: CurrencyInfo!
    
    init (currency: String) {
        currencyInfo = CurrencyInfo(url: "https://api.exchangeratesapi.io/latest?base=" + currency)
    }
    
    func getCurrencyName() -> String {
        return currencyInfo.getCurrencyDictionary()["base"] as? String ?? ""
    }
    
    func getRatesDictionary() -> NSDictionary {
        return currencyInfo.getCurrencyDictionary()["rates"] as? NSDictionary ?? [:]
    }
    
}
