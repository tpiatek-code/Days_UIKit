//
//  CustomTableViewCell.swift
//  Days_UIKit
//
//  Created by Tomasz Piątek on 26/10/2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelEvent: UILabel!
    @IBOutlet weak var labelDay: UILabel!
 
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
    
    extension UILabel {
        func textDropShadow() {
            self.layer.masksToBounds = false
            self.layer.shadowRadius = 3.0
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 1, height: 2)
        }
        
        static func createCustomLabel() -> UILabel {
            let label = UILabel()
            label.textDropShadow()
            return label
        }
    }

