//
//  CurrencyTableViewCell.swift
//  Salesbook_Test
//
//  Created by Vitalii on 30/09/2020.
//

import UIKit

class CurrencyInfoTableViewCell: UITableViewCell {

    @IBOutlet var currencyCodeLabel: UILabel!
    @IBOutlet var currencyNameLabel: UILabel!
    @IBOutlet var currencyRateLabel: UILabel!
    @IBOutlet var backgroundCustomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.layer.backgroundColor = UIColor.clear.cgColor
        
        backgroundCustomView.layer.cornerRadius = 10
    }
}
