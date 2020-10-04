//
//  Coordinator.swift
//  Salesbook_Test
//
//  Created by Vitalii on 01/10/2020.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

