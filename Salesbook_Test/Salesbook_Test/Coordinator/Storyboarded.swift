//
//  Storyboarded.swift
//  Salesbook_Test
//
//  Created by Vitalii on 01/10/2020.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate () -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate () -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
