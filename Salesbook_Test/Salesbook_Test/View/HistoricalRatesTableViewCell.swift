//
//  HistoricalRatesTableViewCell.swift
//  Salesbook_Test
//
//  Created by Vitalii on 02/10/2020.
//

import UIKit

class HistoricalRatesTableViewCell: UITableViewCell {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var backgroundCustomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.backgroundColor = UIColor.clear.cgColor
        
        backgroundCustomView.layer.cornerRadius = 10
    }
}
