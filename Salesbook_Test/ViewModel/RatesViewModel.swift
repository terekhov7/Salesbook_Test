//
//  RatesViewModel.swift
//  Salesbook_Test
//
//  Created by Vitalii on 01/10/2020.
//

import Foundation

class RatesViewModel {
    
    private var lastWeekRates: LastWeekRates!
    
    init (mainCurrencyCode: String, ratesCurrencyCode: String, fromDate: String, toDate: String) {
        
        let urlString = "https://api.exchangeratesapi.io/history?start_at=" + fromDate + "&end_at=" + toDate + "&base=" + mainCurrencyCode + "&symbols=" + ratesCurrencyCode
        
        lastWeekRates = LastWeekRates(url: urlString)
    }
    
    func getInfoDictionary() -> NSDictionary {
        return lastWeekRates.getRatesDictionary()["rates"] as? NSDictionary ?? [:]
    }
    
    func getRatesArray(currencyCode: String) -> [Double] {
        let dateRates = lastWeekRates.getRatesDictionary()["rates"] as! NSDictionary
        let currencyRates = dateRates.allValues as! [NSDictionary]
        
        var rates: [Double] = []
        
        for rate in currencyRates {
            let rateDouble = rate[currencyCode] as! Double
            rates.append(rateDouble)
        }
       
        return rates
    }
    
    func getDatesArray() -> [String] {
        let dateRates = lastWeekRates.getRatesDictionary()["rates"] as! NSDictionary
        
        let dates = dateRates.allKeys as! [String]
        
        var datesFormatted: [Date] = []
        let dateFormatter = DateFormatter()
        for date in dates{
            dateFormatter.dateFormat = "yyyy-MM-dd"
            datesFormatted.append(dateFormatter.date(from: date)!)
        }
        
        datesFormatted.sort(by: >)
        
        var datesSorted: [String] = []
        for date in datesFormatted {
            dateFormatter.dateFormat = "dd.MM.yyyy"
            datesSorted.append(dateFormatter.string(from: date))
        }
        
        return datesSorted
    }
    
}
