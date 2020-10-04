//
//  HistoricalRatesTableViewController.swift
//  Salesbook_Test
//
//  Created by Vitalii on 02/10/2020.
//

import UIKit

class HistoricalRatesTableViewController: UITableViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    var currencyCode: String!
    private var ratesDictionary: NSDictionary!
    private var ratesViewModel: RatesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("efef")
        let todayDate = getTodayDay()
        let weekAgoDate = getWeekAgoDate(from: Date())
        
        ratesViewModel = RatesViewModel(mainCurrencyCode: "PLN", ratesCurrencyCode: currencyCode, fromDate: weekAgoDate, toDate: todayDate)
        
        self.title = currencyCode
        tableView.tableFooterView = UIView()
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        
        switch traitCollection.userInterfaceStyle {
            case .light, .unspecified:
                self.navigationController?.navigationBar.tintColor = UIColor(named: "backColor")
            case .dark:
                self.navigationController?.navigationBar.tintColor = .white
        @unknown default:
            self.navigationController?.navigationBar.tintColor = UIColor.systemBlue
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratesViewModel.getInfoDictionary().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historicalRatesCell") as! HistoricalRatesTableViewCell
        
        let currencyRate = ratesViewModel.getRatesArray(currencyCode: currencyCode)[indexPath.row]
        let roundedRate = Double(round(10000 * currencyRate) / 10000)
        
        cell.dateLabel.text = ratesViewModel.getDatesArray()[indexPath.row]
        cell.rateLabel.text = String(roundedRate)
       
        return cell
    }

    private func getTodayDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: Date())
    }
    
    private func getWeekAgoDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var dateComponents = Calendar.current.dateComponents([.year], from: date)
        dateComponents.weekOfYear = Calendar.current.component(.weekOfYear, from: date) - 1
        dateComponents.weekday = 2
        let dateEnd = Calendar.current.date(from: dateComponents)!

        return dateFormatter.string(from: dateEnd)
    }
}
