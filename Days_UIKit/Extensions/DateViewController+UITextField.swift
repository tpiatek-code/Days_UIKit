//
//  UITextField.swift
//  Days_UIKit
//
//  Created by Tomasz Piątek on 15/12/2022.
//

import UIKit

extension DateViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        text.resignFirstResponder()
        return true
    }
    
}
