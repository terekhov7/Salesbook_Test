//
//  Currency.swift
//  Salesbook_Test
//
//  Created by Vitalii on 30/09/2020.
//

import Foundation

class CurrencyInfo {
    
    private var currencyDictionary: NSDictionary?
    
    init (url: String) {
        
        let group = DispatchGroup()
        group.enter()

        DispatchQueue.global().async {
            if let url = URL(string: url) {
                let request = URLRequest(url: url)
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        print(error)
                        return
                    }
                    if let data = data {
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                            self.currencyDictionary = jsonResult
                            group.leave()
                        } catch {
                            print(error)
                        }
                    }
                }
                task.resume()
            }
        }
        group.wait()
    }
    
    func getCurrencyDictionary() -> NSDictionary {
        return currencyDictionary ?? [:]
    }
    
}
