//
//  ViewController.swift
//  Salesbook_Test
//
//  Created by Vitalii on 30/09/2020.
//

import UIKit

class CurrencyInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Storyboarded {
    
    @IBOutlet var currencyNameLabel: UILabel!
    @IBOutlet var backgroundLabelView: UIView!
    @IBOutlet var currencyTableView: UITableView!
    
    weak var coordinator: MainCoordinator?
    private var currencyName: String!
    private var currencyViewModel:  CurrencyInfoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currencyViewModel = CurrencyInfoViewModel(currency: "PLN")
        currencyNameLabel.text = currencyViewModel.getCurrencyName()
        
        currencyTableView.isAccessibilityElement = true
        currencyTableView.accessibilityIdentifier = "currencyTableView"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        backgroundLabelView.layer.borderWidth = 2
        backgroundLabelView.layer.cornerRadius = 10
        backgroundLabelView.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyViewModel.getRatesDictionary().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell") as! CurrencyInfoTableViewCell
        cell.accessibilityIdentifier = "currencyCell_\(indexPath.row)"
        cell.isAccessibilityElement = true
        let currencyCode = currencyViewModel.getRatesDictionary().allKeys[indexPath.row] as! String
        let currencyRate = currencyViewModel.getRatesDictionary().allValues[indexPath.row] as! Double
        let roundedRate = Double(round(10000 * currencyRate) / 10000)
        
        cell.currencyCodeLabel.text = currencyCode
        cell.currencyRateLabel.text = String(roundedRate)
        cell.currencyNameLabel.text = Locale.current.localizedString(forCurrencyCode: currencyCode)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currencyCode = currencyViewModel.getRatesDictionary().allKeys[indexPath.row] as! String
        coordinator?.showRates(currencyCode: currencyCode)
    }
}

