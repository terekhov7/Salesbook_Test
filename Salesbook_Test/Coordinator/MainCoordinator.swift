//
//  MainCoordinator.swift
//  Salesbook_Test
//
//  Created by Vitalii on 01/10/2020.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CurrencyInfoViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showRates (currencyCode: String) {
        let vc = HistoricalRatesTableViewController.instantiate()
        vc.coordinator = self
        vc.currencyCode = currencyCode
        navigationController.pushViewController(vc, animated: true)
    }
}
